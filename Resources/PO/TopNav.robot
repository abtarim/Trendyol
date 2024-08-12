*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TOPNAV_SEARCH_BAR} =      css=.V8wbcUhU
${TOPNAV_SEARCH_BUTTON} =   xpath=//*[@id="sfx-discovery-search-suggestions"]/div/div/i


*** Keywords ***
Search for Products
    [Arguments]         ${SEARCH_TERM}
    Enter Search Term   ${SEARCH_TERM}
    Submit Search

Enter Search Term
    [Arguments]     ${SEARCH_TERM}
    input text      ${TOPNAV_SEARCH_BAR}    ${SEARCH_TERM}

Submit Search
    click element   ${TOPNAV_SEARCH_BUTTON}

