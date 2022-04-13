*** Settings ***
#Using Selenium Library
Library    SeleniumLibrary

#Using Data.xlsx file for inputs of data.
Library    DataDriver   ../TestData/Data.xlsx  sheet_name=Sheet1

#Using Config.robot from resource for Varibales
Resource    ../TestData/Config.robot

#Using FAQ.robot from resource for Start & Close Browser
Resource    ../Resources/FAQ.robot

#Keywords used from FAQ.robot to start browser & Close browser
Test Setup    Start Browser
Test Teardown   End Browser

#The template name in which keywords are configured.
Test Template    Invalid Login Scenarios

*** Test Cases ***
TC_01_Verify Login fails with Invalid Creds    ${USER_NAME}  ${PASSWORD}  ${TXT_ERROR}

*** Keywords ***
Invalid Login Scenarios

    [Arguments]    ${USER_NAME}    ${PASSWORD}    ${TXT_ERROR}
    input text    ${TXTBOX_USERNAME}    ${USER_NAME}
    input password    ${TXTBOX_PASSWORD}   ${PASSWORD}
    click button    ${BTN_LOGIN}
    sleep    2s
    page should contain    ${TXT_ERROR}




