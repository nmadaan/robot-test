*** Settings ***
Library     Selenium2Library

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Test title
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    #my_create_webdriver   Chrome  ${options}
    create webdriver  Chrome  chrome_options=${options}
    Maximize Browser Window
    go to   https://google.com
    Maximize Browser Window
    capture page screenshot
    close browser
    
Hello chrome headless
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${options.set_binary}=  Set Variable  set_binary="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    ${options.add_argument}=  Set Variable  add_argument=--no-sandbox
    ${options.add_argument}=  Set Variable  add_argument=--headless
    Create WebDriver  Chrome  chrome_options=${options}
    
    Open Browser   http://www.google.com   chrome
    Wait Until Page Contains    ffgdfgdfgdfgdfg
    Close Browser
    
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
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    disable-extensions
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    set_binary    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    Create Webdriver    Chrome    chrome_options=${chrome_options}
