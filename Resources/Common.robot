*** Settings ***
Library   SeleniumLibrary
Library	  AppObjects/App.py
Library    ../Libraries/SearchTermLib.py

*** Variables ***
@{searchTerms}
&{user}

*** Keywords ***
Begin Test Suite
    [Arguments]    ${EMPTY_BROWSER}     ${BROWSER}
    Set Suite Variables
    Set selenium speed          .02s
    Set selenium timeout        10s
    Begin Web Test  ${EMPTY_BROWSER}     ${BROWSER}

End Test Suite
    End Web Test

Begin Web Test
    [Arguments]     ${EMPTY_BROWSER}     ${BROWSER}
    Open Browser    ${EMPTY_BROWSER}     ${browser}
    Maximize Browser Window

End Web Test
    sleep    1s
    Close Browser

Set Suite Variables
    ${empty_browser} =      App.emptyBrowser
    ${browser} =            App.browser
    ${start_url} =          App.urlAddress
    ${search_term} =        App.searchTerm
    ${user_email} =         App.userEmail
    ${user_password} =      App.userPassword
    &{user}     create dictionary    Email=${user_email}    Password=${user_password}

    Set Suite Variable    &USER     &{user}
    Set Suite Variable    ${EMPTY_BROWSER}          ${empty_browser}
    Set Suite Variable    ${BROWSER}                ${browser}
    Set Suite Variable    ${START_URL}              ${start_url}
    Set Suite Variable    ${SEARCH_TERM}            ${search_term}

    ${searchTerms[0]}       SearchTermLib.getSearchTerm1
    ${searchTerms[1]}       SearchTermLib.getSearchTerm2
    ${searchTerms[2]}       SearchTermLib.getSearchTerm3
    ${searchTerms[3]}       SearchTermLib.getSearchTerm4


    Set Suite Variable      ${SEARCH_TERMS[0]}         ${searchTerms[0]}
    Set Suite Variable      ${SEARCH_TERMS[1]}         ${searchTerms[1]}
    Set Suite Variable      ${SEARCH_TERMS[2]}         ${searchTerms[2]}
    Set Suite Variable      ${SEARCH_TERMS[3]}         ${searchTerms[3]}

    @{searchTerms}     Create List    ${searchTerms[0]}    ${searchTerms[1]}    ${searchTerms[2]}    ${searchTerms[3]}
    Set Suite Variable      @SEARCH_TERMS      @{searchTerms}
    Set Suite Variable      ${SEARCH_TERM}  ${SEARCH_TERMS[${TERM}]}
