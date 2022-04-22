*** Settings ***
Library           OperatingSystem

*** Test Cases ***
Test 1
    Keyword 1
    Keyword 2

*** Keywords ***
Keyword 1
    #Create File    testdata/test1.txt    Hello Abhi!    encoding=UTF-8
    Append To File  TestData/appendFile1.txt    Hello Dixit!    encoding=UTF-8
Keyword 2
    ${Test}    Get File    TestData/appendFile1.txt    encoding=UTF-8    encoding_errors=strict
    Log to console      ${Test}