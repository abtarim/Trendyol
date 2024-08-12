*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    wait until page contains    Giriş Yap
    Set selenium speed          .02s

Change Product Amount by Text
    input text    xpath=//*[@id="pb-container"]/div/div[3]/div[2]/div/div[4]/div[1]/div/div/div/input   3


Verify Product Added To Basket
    ${count} =  get value   css = .counter-content
    should be equal    ${count}     1

To Login
    click link    xpath=//*[@id="pb-container"]/div/div[2]/div/a