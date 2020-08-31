  
*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     Collections

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Open Google Firefox
    Set Environment Variable   no_proxy   127.0.0.1
    Open Browser       http://google.com       firefox
    ${title}=       Get Title
    Capture Page Screenshot
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    
Open Google Firefox Options
    ${options}  Evaluate  sys.modules['selenium.webdriver'].firefox.webdriver.Options()   sys, selenium.webdriver
    Call Method  ${options}  add_argument   "log": {"level": "trace"}
    Create Webdriver    Firefox    firefox_options=${options}
    Go To      http://google.com
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
