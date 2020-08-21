  
*** Settings ***
Library     Selenium2Library

*** Test Cases ***    
Open Google IE
    Open Browser    http://google.com    IE
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
