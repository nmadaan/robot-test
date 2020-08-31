*** Settings ***
Library     Selenium2Library

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
#Test without Sandbox Option
#    Open Browser    http://google.com   chrome
#    Wait Until Page Contains    Google
#    Capture Page Screenshot
#    Close Browser

Open Google
    Open Browser    https://www.bing.com    Chrome
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Bing    ${title}
    Capture Page Screenshot
    Close Browser
    
Open Google Sandbox Option
    Open Chrome Browser
    GoTo    http://google.com
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    
*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    #${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    #Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
