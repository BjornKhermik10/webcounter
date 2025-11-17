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
When Counter Has A Value And Is Reset It Becomes Zero
    Reset Counter
    Click Button    increment
    Click Button    increment
    Click Button    reset
    Page Should Contain    nappia painettu 0 kertaa
