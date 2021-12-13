*** Settings ***
Documentation     A test suite with a eight test cases.
Resource          resource.robot

*** Test Cases ***
Successful user log in
    Open Browser To Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Inventory Page Should Be Open
    [Teardown]  Close Browser

Unsuccessful user log in by a locked out user
    Open Browser To Login Page
    Input Username                      ${LOCKED-OUT USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Login Page Should Be Open
    Error Message Should Be Correct     Epic sadface: Sorry, this user has been locked out.
    [Teardown]  Close Browser

Typed wrong password
    Open Browser To Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${INVALID PASSWORD}
    Submit Credentials
    Login Page Should Be Open
    Error Message Should Be Correct     Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser

Logged in as problem user and sees a broken inventory page
    Open Browser To Login Page
    Input Username                      ${PROBLEM USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Page Should Contain Image           ${BROKEN IMAGE PATH}
    [Teardown]  Close Browser

Sort product name (A to Z)
    Open Browser To Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Select Filter                       az
    Check Filter Text                   NAME (A TO Z)
    [Teardown]  Close Browser

Sort product name (Z to A)
    Open Browser To Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Select Filter                       za
    Check Filter Text                   NAME (Z TO A)
    [Teardown]  Close Browser

Sort product price (low to high)
    Open Browser To Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Select Filter                       lohi
    Check Filter Text                   PRICE (LOW TO HIGH)
    [Teardown]  Close Browser

Sort product price (high to low)
    Open Browser To Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Submit Credentials
    Select Filter                       hilo
    Check Filter Text                   PRICE (HIGH TO LOW)
    [Teardown]  Close Browser
