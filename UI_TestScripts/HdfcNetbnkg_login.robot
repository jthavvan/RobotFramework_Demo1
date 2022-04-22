*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Verify that user is able to login with valid credentials
    [Tags]    DEBUG
    open browser        https://netbanking.hdfcbank.com/netbanking/  chrome
    select frame        name=login_page
    sleep       2s
    input text          name=fldLoginUserId     1000
    sleep       2s
    click element       xpath=//a[@class="btn btn-primary login-btn"]
    page should contain textfield    id=fldPasswordDispId

close browser
    close browser
