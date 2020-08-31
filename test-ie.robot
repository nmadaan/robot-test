  
*** Settings ***
Library     Selenium2Library
Library     Collections

*** Test Cases ***
Test IE InPrivate
    ${dc}   Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER  sys, selenium.webdriver
    Set To Dictionary   ${dc}   ignoreProtectedModeSettings    ${True}
    Set To Dictionary   ${dc}   ie.forceCreateProcessApi       ${True}
    Set To Dictionary   ${dc}   ie.browserCommandLineSwitches=-private
    Open Browser    https://google.com     ie     desired_capabilitie=${dc}


Test IE InPrivate
    Open Browser    https://google.com    ie
