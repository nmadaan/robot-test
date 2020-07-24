*** Settings ***

Library  SeleniumLibrary

Test Teardown  Close browser

*** Test Cases ***
Hello chrome
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${options.set_binary}=  Set Variable  set_binary="C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    #${options.add_argument}=  Set Variable  add_argument=--headless
    Create WebDriver  Chrome  chrome_options=${options}
    Page should contain  Google
