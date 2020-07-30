*** Settings ***
Documentation     This example demonstrates how to use current library
Library      Selenium2Library
Library      XvfbRobot

*** Test Cases ***
Create Headless Browser
    Start Virtual Display    1920    1080
    Open Browser   http://google.com
    Set Window Size    1920    1080
    ${title}=    Get Title
    Should Be Equal    Google    ${title}
    [Teardown]    Close Browser
