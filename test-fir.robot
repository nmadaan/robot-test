  
*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     Collections

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***

Open Google Firefox 1
    ${preferences} =    Create Dictionary   browser.tabs.remote.autostart  False   browser.tabs.remote.autostart.2   False   security.sandbox.content.level  5  
    Open Browser     http://google.com    Firefox      desired_capabilities=${preferences}
    

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
