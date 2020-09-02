  
*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     Collections

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Open Google Firefox
    Open Browser     http://google.com    Firefox    ff_profile_dir=set_preference("network.proxy.no_proxies_on", "localhost, 127.0.0.1")
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
