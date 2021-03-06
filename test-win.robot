*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Open Google Chrome
    Open Browser     http://google.com    Chrome
    ${width}    ${height}=   Get Window Size
    Set Window Size    1916    956
    ${width}    ${height}=   Get Window Size
    Maximize Browser Window
    ${width}    ${height}=   Get Window Size
    Sleep    60 seconds
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    [Teardown]
