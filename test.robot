*** Settings ***

Library  SeleniumLibrary
Library  XvfbRobot

Test Teardown  Close browser

*** Test Cases ***
Open Chrome With Options
    Open Browser    https://www.google.com    chrome
    Page should contain  Google
