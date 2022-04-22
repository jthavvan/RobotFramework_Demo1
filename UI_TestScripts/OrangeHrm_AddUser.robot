*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

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
    ${random_num} =     Generate Random String
    ${empname}=     Catenate    SEPARATOR=    Abhi    ${random_num}
    Log to Console      ${empname}

    mouse over      link=Admin
    mouse over      link=User Management
    click link      link=Users
    click button    name=btnAdd
    sleep           3s
    input text      id=systemUser_employeeName_empName  Fiona Grace
    input text      id=systemUser_userName  ${empname}
    sleep           5s
    input text      id=systemUser_password  admin123
    input text      id=systemUser_confirmPassword   admin123
    click button    id=btnSave
    sleep           3s
    page should contain link        link=${empname}
    sleep           5s



Logout from application and verify that user has logged out
    click element        id=welcome
    sleep       2s
    click link         link=Logout
    page should contain link        Forgot your password?

close browser
    close browser
