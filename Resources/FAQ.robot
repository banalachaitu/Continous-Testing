*** Settings ***

Library    SeleniumLibrary

*** Keywords ***
Start Browser
    open browser    ${START_URL}     ${BROWSER}
    maximize browser window
    delete all cookies
    sleep    2s

End browser
    close browser
