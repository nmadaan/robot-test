*** Settings ***
Suite Teardown
Library     Selenium2Library
Library     OperatingSystem
Library     Collections

*** Test Cases ***
Open Google Edge
    Open Browser     http://google.com    edge
    Sleep    60 seconds
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    [Teardown]
