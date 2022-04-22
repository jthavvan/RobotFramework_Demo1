*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org
${token}    z4pQdZcvEoJiVjxTyjt0_A7r1ky4NYrHYYxv8BU61es
${id}   21499
*** Test Cases ***
Delete an Address
    create session      mysession   ${base_url}
    log to console      ${token}
    ${headers}      create dictionary    Authorization=Bearer ${token}
    log to console      ${headers}

    ${response}=    delete on session         mysession       api/v2/storefront/account/addresses/${id}        headers=${headers}
    log to console      ${response.status_code}
    #${response_body}=      To Json     ${response.content}     pretty_print = True
    #Log to console     ${response_body}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       204