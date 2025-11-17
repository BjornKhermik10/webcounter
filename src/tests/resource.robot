*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${BROWSER}   chrome
${HEADLESS}  true

*** Keywords ***
Open And Configure Browser
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method  ${options}  add_argument  --incognito
    IF  '${HEADLESS}'=='true'
        Call Method  ${options}  add_argument  --headless
        Set Selenium Speed  0.05 seconds
    ELSE
        Set Selenium Speed  ${DELAY}
    END
    Open Browser  ${HOME_URL}  ${BROWSER}  options=${options}
