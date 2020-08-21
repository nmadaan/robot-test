  
*** Settings ***
Library     Selenium2Library

*** Test Cases ***    
Open Google IE
    Open IE Browser
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser

    
*** Keywords ***
Open IE Browser
   ${dc}   Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER  sys, selenium.webdriver
   Set To Dictionary   ${dc}   ignoreProtectedModeSettings ${True}
   Open Browser    www.google.com  ie  desired_capabilitie=${dc}

   ${s2l}= Get Library Instance    Selenium2Library
   Log Dictionary  ${s2l._current_browser().capabilities}  # actual capabilities
