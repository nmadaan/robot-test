  
*** Settings ***
Library     Selenium2Library
Library     Collections

*** Test Cases ***
Open Google IE options
    ${dc}   Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER  sys, selenium.webdriver
    Set To Dictionary   ${dc}   ignoreProtectedModeSettings    ${True}
    Set To Dictionary   ${dc}   ie.forceCreateProcessApi       ${True}
    Set To Dictionary   ${dc}   ie.browserCommandLineSwitches=-private
    Open Browser    https://google.com     ie
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    
Open Google IE 
    Open Browser    https://google.com    ie
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
