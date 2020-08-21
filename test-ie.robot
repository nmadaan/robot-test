  
*** Settings ***
Library     Selenium2Library
Library     Collections

*** Test Cases ***    
Open Google IE
    Open IE Browser
    GoTo    http://google.com
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser

    
*** Keywords ***
Open IE Browser
    ${options}= Evaluate  sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER sys,selenium.webdriver
    Call Method    ${options}    add_argument      INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS:True    
    Create WebDriver  Internet Explorer ie_options=${options}
