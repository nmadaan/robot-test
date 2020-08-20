*** Settings ***
Library     Selenium2Library

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***    
Hello chrome headless
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${options.set_binary}=  Set Variable  set_binary="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    ${options.add_argument}=  Set Variable  add_argument=--no-sandbox
    ${options.add_argument}=  Set Variable  add_argument=--headless
    Create WebDriver  Chrome  chrome_options=${options}
    
    Open Browser   http://www.google.com   chrome
    Wait Until Page Contains    Google
    Capture Page Screensho
    Close Browser
    
Open Google Page
    Open Browser    http://google.com     chrome
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    
Open Google
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
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
