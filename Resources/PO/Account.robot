*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ACCOUNT_PAGE_VERIFIER_HEADING} =       xpath = //p[.='Hesabım']


*** Keywords ***
Check Page Contains Cookie Dialog
    TRY
        Passing Cookies And Country Selection
        Click My Account Button
    EXCEPT
            Click My Account Button
    END

Passing Cookies And Country Selection
    page should contain     Accept All Cookie
    click button    id=onetrust-reject-all-handler
    sleep    .3s
    Select From List By Index     css = select    1
    sleep    .3s
    click button                    xpath = //button[.='Select']

Click My Account Button
    mouse over                      xpath = //p[.='Hesabım']
    sleep    .3s
    mouse over                      css=[href='/hesabim/siparislerim']
    sleep    .3s
    mouse down                      css=[href='/hesabim/siparislerim']
    sleep    .3s

Verify Page Loaded
    page should contain element     ${ACCOUNT_PAGE_VERIFIER_HEADING}
    element text should be          ${ACCOUNT_PAGE_VERIFIER_HEADING}  Hesabım
    sleep    .5s
    mouse over                      xpath=//p[.='Hesabım']
    sleep    .5s
    mouse over                      xpath=//*[@id="account-navigation-container"]/div/div[1]/div[2]/div/a[9]
    sleep    .5s
    mouse down                      xpath=//*[@id="account-navigation-container"]/div/div[1]/div[2]/div/a[9]
    sleep    .5s


