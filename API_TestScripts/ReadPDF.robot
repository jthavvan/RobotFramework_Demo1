*** Settings ***
#Library    DocTest.VisualTest
Library    DocTest.PdfTest
*** Test Cases ***
Verify Text in PDF file
   PDF Should Contain Strings        Dummy PDF file     C:\\Users\\tseuser\\Downloads\\dummy.pdf

This text exists in the PDF File
    @{strings}=    Create List    THE TEST SHIPPER    TEST CONSIGNEE
    PDF Should Contain Strings    ${strings}    testdata/sample.pdf

This text does NOT exist in the PDF File
    @{strings}=    Create List    THE TEST SHIPPER    THIS STRING DOES NOT EXIST IN THIS DOJO
    Run Keyword And Expect Error    Some expected texts were not found in document    PDF Should Contain Strings    ${strings}    testdata/sample.pdf