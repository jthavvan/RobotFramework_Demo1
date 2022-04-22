*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    [Tags]    Smoke
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text	id=user-name	standard_user
    Input Text	id=password	    secret_sauce
    Click Button    id=login-button
    ${items_on_page}=      Get Element Count     xpath=//div[@class='inventory_list']/div
    #Log to Console  Total number of Items=${items_on_page}
    #Will display the message in Result Report of Robot Framework
    Log  Total number of Items=${items_on_page}
    RUN Keyword If  ${items_on_page} == 6  Test Keyword 1  ELSE IF  ${items_on_page} < 10 and ${items_on_page} > 6  Test Keyword 2  ELSE  Test Keyword 3

*** Keywords ***
Test Keyword 1
    Log To Console      Executed Keyword1 - Found Items as expected
    Close Browser

Test Keyword 2
    Log To Console      Executed Keyword2 - Found less than expected Items
    Close Browser

Test Keyword 3
    Log To Console      Executed Keyword3 - Found more than expected Items
    Close Browser