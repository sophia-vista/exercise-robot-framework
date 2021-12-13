*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          resource.robot

*** Test Cases ***
Successful user log in
    Open Browser To Login Page

    Input Username  ${VALID USER}

    Input Password  ${VALID PASSWORD}

    Submit Credentials

    Inventory Page Should Be Open