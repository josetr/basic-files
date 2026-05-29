cmake_minimum_required(VERSION 3.24)

project(BasicFiles LANGUAGES C)

add_executable(basic_files c.c)
target_compile_features(basic_files PRIVATE c_std_11)
