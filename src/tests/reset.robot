*** Settings ***
Resource         resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser

*** Test Cases ***
When counter has a nonzero value and it is reset the value becomes zero
    Click Button    increment
    Click Button    increment
    Element Text Should Be    counter-value    2

    Click Button    reset
    Element Text Should Be    counter-value    0
