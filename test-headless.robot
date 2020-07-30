*** Settings ***
Library  Selenium2Library

*** Test Cases ***
Test title
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    headless
    Call Method    ${options}    add_argument    disable-gpu
    Create Webdriver  Chrome  chrome_options=${options}
    Maximize Browser Window
    go to   https://google.com
    Maximize Browser Window
    capture page screenshot
    close browser
    
Test title new
   Open Browser     https://google.com    headlesschrome
