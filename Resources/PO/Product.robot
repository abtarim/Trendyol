*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Page First Loaded
    ${handle} =	Switch Window	NEW	# Select latest opened window
    wait until page contains    Öne Çıkan Özellikler:
    Set selenium speed          .3s

Verify Page Not First Loaded
    ${handle} =	Switch Window	CURRENT	# Select latest opened window
    wait until page contains    Öne Çıkan Özellikler:
    Set selenium speed          .3s

Add to Basket
    click button    Sepete Ekle

Go To Basket
    click link      css=.account-basket


