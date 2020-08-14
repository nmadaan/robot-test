*** Settings ***
Library     Selenium2Library

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Open Google Page
    Open Browser    http://google.com     headlesschrome
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    
Open Google
    Open Chrome Browser
    GoTo    http://google.com
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot

*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  --headless
    Call Method  ${options}  add_argument   disable-gpu
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
