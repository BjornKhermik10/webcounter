*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
Setting Counter To Ten Works
    Go To  ${HOME_URL}
    Input Text  value  10
    Click Button  Set
    Page Should Contain  nappia painettu 10 kertaa

Setting Counter To Zero Works
    Go To  ${HOME_URL}
    Input Text  value  0
    Click Button  Set
    Page Should Contain  nappia painettu 0 kertaa
