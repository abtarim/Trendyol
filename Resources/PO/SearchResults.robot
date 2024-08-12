*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${message}

*** Keywords ***
Verify Search Completed

#    Execute JavaScript    window.scroll( 0, document.body.scrollHeight)
#    Execute JavaScript  window.scrollBy({top: document.body.scrollHeight, left:0, behavior: "smooth", });

    Wait Until Page Contains    sonuç listeleniyor
    ${count} =     Get Element Count    xpath = //div[@class='prdct-cntnr-wrppr']//div[@class="p-card-wrppr with-campaign-view add-to-bs-card"]

#    ${message}=	Set Variable If	${count} == ${24}
#    run keyword if    ${count} == ${24}
    Should Be Equal    ${count}    ${24}
#    Page Should Contain Element    xpath = //div[@class='prdct-cntnr-wrppr']//div[@class="p-card-wrppr with-campaign-view add-to-bs-card"]    limit=24
#    Set selenium speed          .02s
#    run keyword if test failed  Print Console Message   ${message}=TEST FAIL!
#    Print Console Message   ${message}

Messag



Click Product Link
    [Documentation]  Clicks on the first product in the search results list

    click element    data:id:103397279

Print Console Message
    [Arguments]    ${message}
    log to console    ${message}