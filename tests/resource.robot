*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              chrome
${DELAY}                0
${VALID USER}           standard_user
${LOCKED-OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     abc
${LOGIN URL}            https://www.saucedemo.com/
${INVENTORY URL}        https://www.saucedemo.com/inventory.html
${BROKEN IMAGE PATH}    xpath=//img[contains(@src, "sl-404.168b1cce.jpg")]

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN URL}

Inventory Page Should Be Open
    Location Should Be    ${INVENTORY URL}

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login-button

Error Message Should Be Correct
    [Arguments]    ${message}
    Element Text Should Be  css:*[data-test="error"]    ${message}

Select Filter
    [Arguments]     ${filter}
    Select From List By Value   class:product_sort_container    ${filter}

Check Filter Text
    [Arguments]     ${filter name}
    Element Text Should Be  class:active_option     ${filter name}
