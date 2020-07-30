*** Settings ***
Library  Selenium2Library

*** Test Cases ***
Test title
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create Webdriver  Chrome  chrome_options=${options}
    Maximize Browser Window
    go to   https://google.com
    Maximize Browser Window
    capture page screenshot
    close browser
