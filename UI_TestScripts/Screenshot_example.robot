*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    #Capture particular Element Screenshot
    Capture Element Screenshot      id=ctl00_MainContent_btnDelete      C:\RobotFramework_Training\\RobotFramework_Demo1\\UI_TestScripts\screenshots\\Delete.png
    Click Link      Logout
    Capture Page Screenshot     C:\RobotFramework_Training\\RobotFramework_Demo1\\UI_TestScripts\\scnreenshots\\LoginPage.png
    Page Should Contain Button    id=ctl00_MainContent_login_button

    Sleep   2s
    Close Browser
