  
*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     Collections

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***

Open Firefox browser 
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys   
    Call Method    ${options}   set_preference    dom.disable_beforeunload  False
    Call Method    ${options}   set_capability    unhandledPromptBehavior  ignore
    Call Method    ${options}   set_capability    unexpectedAlertBehaviour  ignore

    ${profile}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxProfile()    sys   
    Call Method    ${profile}   set_preference    dom.disable_beforeunload  False
    
    ${desired_capabilities}=    Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.FIREFOX    sys   
    Set To Dictionary   ${desired_capabilities}  unhandledPromptBehavior  ignore 
    Set To Dictionary   ${desired_capabilities}  unexpectedAlertBehaviour  ignore 
    
    Open Browser  http://google.com  Firefox    options=${options}  ff_profile_dir=${profile}  desired_capabilities=${desired_capabilities}
    

Open Google Firefox 2
    Open Browser     http://google.com    Firefox    ff_profile_dir=set_preference("security.sandbox.content.level", 5)
    Sleep    60 seconds
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser


Open Google Firefox Options
    ${options}  Evaluate  sys.modules['selenium.webdriver'].firefox.webdriver.Options()   sys, selenium.webdriver
    Call Method  ${options}  add_argument   "log": {"level": "trace"}
    Create Webdriver    Firefox    firefox_options=${options}
    Go To      https://www.bing.com
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Bing    ${title}
    Capture Page Screenshot
    Close Browser
