*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At Start The Counter Is Zero
    Go To  ${HOME_URL}
    Page Should Contain  nappia painettu 0 kertaa

When Button Pressed Twice The Counter Is Two
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa
