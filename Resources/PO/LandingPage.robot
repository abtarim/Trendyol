*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Load
    [Arguments]    ${START_URL}
    go to   ${START_URL}

Verify Page Loaded
    wait until page contains    Sana Özel Ürünler