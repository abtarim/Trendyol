*** Settings ***
Library    ../Libraries/MyLib.py
Library    ../Libraries/SearchTermLib.py
Resource  PO/LandingPage.robot
Resource  PO/TopNav.robot
Resource  PO/SearchResults.robot
Resource  PO/Product.robot
Resource  PO/Basket.robot
Resource  PO/LogIn.robot
Resource  PO/Account.robot

*** Variables ***

*** Keywords ***
User is not logged In
    log    Check to see whether user is logged in

Search for Products
    [Arguments]    ${START_URL}     ${SEARCH_TERM}
    LandingPage.Load    ${START_URL}
    LandingPage.Verify Page Loaded
    TopNav.Search for Products   ${SEARCH_TERM}


Search results contains relevant products
    SearchResults.Verify Search Completed

Select Product from Search results
    SearchResults.Click Product Link

Correct product page first loads
    Product.Verify Page First Loaded

Correct product page not first loads
    Product.Verify Page Not First Loaded

Add Product to Basket
    Product.Add to Basket
    Product.Go To Basket
    Basket.Verify Page Loaded

The product is present in Basket
    Basket.Verify Product Added To Basket

Begin Checkout
    Basket.To Login

Correct login page loads
    LogIn.Verify Page Loaded

Login with Many Invalid Credentials
    [Arguments]    @{InvalidLoginScenarios}
    FOR     ${LoginScenario}     IN    @{InvalidLoginScenarios}
        run keyword and continue on failure    Navigate To Sign In Page
        run keyword and continue on failure    Attempt Login        ${LoginScenario}
        run keyword and continue on failure    Verify Login Page Error Message      ${LoginScenario}
    END

Navigate To Sign In Page
    go to    https://www.trendyol.com/giris?cb=%2F
    sleep   .3s
    Correct login page loads
    sleep    .9s

Attempt Login
    [Arguments]     ${LoginScenario}
    LogIn.Enter Credentials    ${LoginScenario}
    LogIn.Click Submit Button
    sleep    .5s

Verify Login Page Error Message
    [Arguments]     ${LoginScenario}
    LogIn.Verify Error Message    ${LoginScenario}

Login
    [Arguments]    ${USER}
    LogIn.Login With Valid Credentials    ${USER}

Verify User LoggedIn
    sleep    .5s
    Account.Check Page Contains Cookie Dialog
    Account.Verify Page Loaded

