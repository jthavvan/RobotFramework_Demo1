*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

*** Test Cases ***
Test3
    [documentation]  This test case verifies that the user can select radio buttons and verify it
    [tags]  Smoke
    Open Browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     chrome
            Input Text	id=ctl00_MainContent_username	Tester
            Input Text	id=ctl00_MainContent_password	test
            Click Button    id=ctl00_MainContent_login_button
            Sleep   2s
            Element Text Should Be	link=View all orders	View all orders
            Click Link      link=Order
    Wait Until Element Is Visible       ctl00$MainContent$fmwOrder$cardList       timeout=10
    #Page Should Contain Radio Button        id:bmwradio
    #Radio Button Should Not Be Selected     id:bmwradio
    Select Radio Button     ctl00$MainContent$fmwOrder$cardList        Visa
    Sleep	3s
    Select Radio Button     ctl00$MainContent$fmwOrder$cardList        American Express
    Sleep	3s

Go to View All Orders and Verify that user got added
    #open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx
    Click Link      link=View all orders
    Sleep       2s
    Click Element       xpath=//td[normalize-space()='Dixit']//preceding-sibling::td/input
    #Click Element       xpath=//a[normalize-space()='${empname}']//parent::td/../td/input
    Sleep   5s
    Click Element       xpath=//td[normalize-space()='Dixit']//following-sibling::td/input
    Sleep   2s
    Page Should Contain     Edit Order
    Sleep   5s

Edit the State field and Verify that its Updated
    Input Text	    id=ctl00_MainContent_fmwOrder_TextBox3       Delhi
    Click Element       id=ctl00_MainContent_fmwOrder_UpdateButton
    Sleep       2s
    Page Should Contain Element     xpath=//td[normalize-space()='Dixit']//following-sibling::td[normalize-space()='Delhi']

Delete the user and Verify that user got deleted from WebTable
    Click Element       xpath=//td[normalize-space()='Dixit']//preceding-sibling::td/input
    Click Element       id=ctl00_MainContent_btnDelete
    Sleep       2s
    page should not contain element      Dixit

close browser
    close browser
