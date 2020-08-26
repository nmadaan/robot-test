  
*** Settings ***
Library     Selenium2Library

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Open Google Firefox
    Open Browser    http://google.com    FF
    #Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    #Capture Page Screenshot
    #Close Browser

*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  --headless
    #${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    #Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
