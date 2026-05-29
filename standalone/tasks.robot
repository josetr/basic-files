*** Settings ***
Documentation     Small Robot Framework syntax fixture.
Library           Collections

*** Variables ***
${STATUS}         doing

*** Test Cases ***
Task Status Is Visible
    ${task}=    Create Dictionary    title=Add Robot fixture    status=${STATUS}
    Should Be Equal    ${task.status}    doing
