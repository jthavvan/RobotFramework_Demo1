*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Verify that user is able to login with valid credentials
    [Tags]    DEBUG
    open browser        https://opensource-demo.orangehrmlive.com/index.php/auth/login  chrome
    input text          id=txtUsername  Admin
    input text          id=txtPassword  admin123
    click button        id=btnLogin
    page should contain link        Dashboard
    #close browser

Open Users page
    mouse over      link=Admin
    mouse over      link=User Management
    click link      link=Users


Logout from application and verify that user has logged out
    click element        id=welcome
    sleep       2s
    click link         link=Logout
    page should contain link        Forgot your password?

close browser
    close browser
