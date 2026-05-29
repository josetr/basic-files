cmake_minimum_required(VERSION 3.20)

project(basic_files_examples C)

option(
  BASIC_FILES_STRICT_BUILDS
  "Fail CMake configuration when an optional project toolchain is missing."
  OFF
)

set(BASIC_FILES_PROJECTS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/projects")
set(BASIC_FILES_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/projects")

add_custom_target(basic-files-projects)

function(add_project_target target_name)
  add_dependencies(basic-files-projects "${target_name}")
  set_property(GLOBAL APPEND PROPERTY BASIC_FILES_PROJECT_TARGETS "${target_name}")
endfunction()

function(report_missing_project name detail)
  if(BASIC_FILES_STRICT_BUILDS)
    message(FATAL_ERROR "Cannot build ${name}: ${detail}")
  else()
    message(STATUS "Skipping ${name}: ${detail}")
  endif()
endfunction()

function(add_tool_project name)
  set(one_value_args TOOL WORKING_DIRECTORY OUTDIR)
  set(multi_value_args ARGS)
  cmake_parse_arguments(PROJECT "" "${one_value_args}" "${multi_value_args}" ${ARGN})

  if(NOT PROJECT_TOOL)
    message(FATAL_ERROR "add_tool_project(${name}) requires TOOL")
  endif()
  if(NOT PROJECT_WORKING_DIRECTORY)
    set(PROJECT_WORKING_DIRECTORY "${BASIC_FILES_PROJECTS_DIR}/${name}")
  endif()
  if(NOT PROJECT_OUTDIR)
    set(PROJECT_OUTDIR "${BASIC_FILES_OUTPUT_DIR}/${name}")
  endif()

  string(MAKE_C_IDENTIFIER "${name}" tool_id)
  string(TOUPPER "${tool_id}" tool_id)
  find_program(BASIC_FILES_${tool_id}_TOOL NAMES ${PROJECT_TOOL})

  if(BASIC_FILES_${tool_id}_TOOL)
    add_custom_target("project-${name}" ALL
      COMMAND "${CMAKE_COMMAND}" -E make_directory "${PROJECT_OUTDIR}"
      COMMAND "${BASIC_FILES_${tool_id}_TOOL}" ${PROJECT_ARGS}
      WORKING_DIRECTORY "${PROJECT_WORKING_DIRECTORY}"
      USES_TERMINAL
      VERBATIM
    )
    add_project_target("project-${name}")
  else()
    report_missing_project("${name}" "missing ${PROJECT_TOOL}")
  endif()
endfunction()

function(add_static_project name)
  foreach(file_name IN LISTS ARGN)
    if(NOT EXISTS "${BASIC_FILES_PROJECTS_DIR}/${name}/${file_name}")
      message(FATAL_ERROR "Static project ${name} is missing ${file_name}")
    endif()
  endforeach()

  add_custom_target("project-${name}" ALL
    COMMAND "${CMAKE_COMMAND}" -E echo "Checked static project ${name}"
    VERBATIM
  )
  add_project_target("project-${name}")
endfunction()

add_subdirectory(projects/cmake)
add_custom_target(project-cmake ALL DEPENDS cmake_example)
add_project_target(project-cmake)

add_tool_project(csharp
  TOOL dotnet
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  ARGS build "${BASIC_FILES_PROJECTS_DIR}/csharp/app.csproj"
       --artifacts-path "${BASIC_FILES_OUTPUT_DIR}/csharp/artifacts"
)

add_tool_project(dart
  TOOL dart
  ARGS compile exe lib/main.dart -o "${BASIC_FILES_OUTPUT_DIR}/dart/dart_example"
)

add_tool_project(go
  TOOL go
  ARGS build -o "${BASIC_FILES_OUTPUT_DIR}/go/go_example" .
)

add_tool_project(java
  TOOL javac
  OUTDIR "${BASIC_FILES_OUTPUT_DIR}/java/classes"
  ARGS -d "${BASIC_FILES_OUTPUT_DIR}/java/classes" src/main/java/dev/basicfiles/App.java
)

add_tool_project(kotlin
  TOOL kotlinc
  ARGS src/main/kotlin/Main.kt -include-runtime -d "${BASIC_FILES_OUTPUT_DIR}/kotlin/kotlin_example.jar"
)

add_tool_project(php
  TOOL php
  ARGS -l public/index.php
)

add_tool_project(python
  TOOL python3 python
  ARGS -m py_compile src/basic_files.py
)

add_tool_project(ruby
  TOOL ruby
  ARGS -c lib/basic_files.rb
)

add_tool_project(rust
  TOOL cargo
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  ARGS build --manifest-path "${BASIC_FILES_PROJECTS_DIR}/rust/Cargo.toml"
       --target-dir "${BASIC_FILES_OUTPUT_DIR}/rust/target"
)

add_tool_project(swift
  TOOL swift
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  ARGS build --package-path "${BASIC_FILES_PROJECTS_DIR}/swift"
       --scratch-path "${BASIC_FILES_OUTPUT_DIR}/swift/.build"
)

set(typescript_tsc "${BASIC_FILES_PROJECTS_DIR}/typescript/node_modules/.bin/tsc")
if(EXISTS "${typescript_tsc}")
  add_custom_target(project-typescript ALL
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${BASIC_FILES_OUTPUT_DIR}/typescript"
    COMMAND "${typescript_tsc}" --noEmit
    WORKING_DIRECTORY "${BASIC_FILES_PROJECTS_DIR}/typescript"
    USES_TERMINAL
    VERBATIM
  )
  add_project_target(project-typescript)
else()
  report_missing_project(
    "typescript"
    "missing node_modules/.bin/tsc; run npm install in projects/typescript"
  )
endif()

add_tool_project(zig
  TOOL zig
  ARGS build --cache-dir "${BASIC_FILES_OUTPUT_DIR}/zig/.zig-cache"
       -p "${BASIC_FILES_OUTPUT_DIR}/zig/zig-out"
)

add_static_project(todo-board index.html main.js styles.css)
add_static_project(web-app index.html main.js styles.css)

get_property(configured_project_targets GLOBAL PROPERTY BASIC_FILES_PROJECT_TARGETS)
message(STATUS "Configured project targets: ${configured_project_targets}")
