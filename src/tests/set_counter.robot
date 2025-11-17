*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To App
Suite Teardown    Close Browser

*** Keywords ***
Open Browser To App
    Open Browser    http://localhost:5001    Chrome
    Maximize Browser Window

Reset Counter
    Click Button    reset
    Page Should Contain    nappia painettu 0 kertaa

*** Test Cases ***
Setting Counter To Ten Works
    Reset Counter
    Input Text    value    10
    Click Button  set-button
    Page Should Contain    nappia painettu 10 kertaa

Setting Counter To Zero Works
    Reset Counter
    Input Text    value    0
    Click Button  set-button
    Page Should Contain    nappia painettu 0 kertaa
