*** Settings ***

Library  SeleniumLibrary
Library  XvfbRobot

Test Teardown  Close browser

*** Test Cases ***
Open Chrome With Options
   Log     Creating WebDriver   WARN 
   Start Virtual Display    1920   1920
   ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method   ${options}   add_argument   --no-sandbox
    Call Method   ${options}   add_argument   --disable-setuid-sandbox 
    Create WebDriver   Chrome   chrome_options=${options}
    Go To   https://www.google.com
    #Open Browser    https://www.google.com    chrome
    #Page should contain  Google
