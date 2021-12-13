*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Opera
${DELAY}                0
${VALID USER}           standard_user
${LOCKED-OUT USER}      standard_user
${PROBLEM USER}         standard_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     abc
${LOGIN URL}            https://www.saucedemo.com
${INVENTORY URL}        https://www.saucedemo.com/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN URL}

Inventory Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login_button

