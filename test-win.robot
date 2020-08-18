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
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    disable-extensions
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    binary_location    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe""
    Create Webdriver    Chrome    chrome_options=${chrome_options}
