  
*** Settings ***
Library     Selenium2Library
Library     OperatingSystem

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Open Google Firefox
    Set Environment Variable    no_proxy    127.0.0.1
    Open Browser       http://google.com       firefox
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    #Capture Page Screenshot
    #Close Browser
    
Open Firefox
    ${options}  Evaluate  sys.modules['selenium.webdriver'].firefox.webdriver.Options()   sys, selenium.webdriver
    Call Method  ${options}  add_argument  -headless
    Create Webdriver    Firefox    firefox_options=${options}
    Go To      http://google.com
    Capture Page Screenshot

Specifying Path To GeckoDriver
    ${ff default caps}    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
    Set To Dictionary    ${ff default caps}    marionette=${True}
    Create Webdriver    Firefox    executable_path=C:\\webdriver\\geckodriver.exe
    Go To    https://stackoverflow.com
    Sleep    2 s
    [Teardown]    Close All Browsers
    
*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  --headless
    #${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    #Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
