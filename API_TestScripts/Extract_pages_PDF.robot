*** Settings ***
Library     RPA.FileSystem
Library     RPA.PDF
Library     String

*** Test Cases ***
Example Keyword
    ${pages}=    Extract Pages From PDF
    ...          source_path=testdata/sample06.pdf
    ...          output_path=testdata/Output_sample06.pdf
    ...          pages=1