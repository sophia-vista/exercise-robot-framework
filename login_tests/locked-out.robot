*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          resource.robot

*** Test Cases ***
Typed wrong password
    Open Browser To Login Page

    Input Username  ${INVALID USER}

    Input Password  ${VALID PASSWORD}

    Submit Credentials

    Login Page Should Be Open