*** Settings ***
Documentation  This is some basic info about the whole suite
Resource    ../Data/InputData.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/TrendyolApp.robot
Resource    ../Resources/DataManager.robot
Suite Setup     Begin Test Suite    ${EMPTY_BROWSER}    ${BROWSER}
Suite Teardown    End Test Suite
#Test Setup      Begin Web Test
#Test Teardown   End Web Test

*** Variables ***
&{USER}
${EMPTY_BROWSER}
${BROWSER}
${START_URL}
@{SEARCH_TERMS}
${TERM} =    0
${SEARCH_TERM}

*** Test Cases ***
Logged out user can search for products
     [Tags]  Smoke
     Given TrendyolApp.user is not logged In
     When TrendyolApp.Search for Products    ${START_URL}    ${SEARCH_TERM}
     Then TrendyolApp.Search results contains relevant products

Logged out user can view a product
    [Tags]  Smoke
    Given TrendyolApp.Search results contains relevant products
    When TrendyolApp.Select Product from Search Results
    Then TrendyolApp.Correct product page first loads

Logged out user can add product to cart
    [Tags]  Smoke
    Given TrendyolApp.Correct product page not first loads
    When TrendyolApp.Add Product to Basket
    Then TrendyolApp.The product is present in Basket

Logged out user must sign in to check out
    [Tags]  Smoke
    Given TrendyolApp.The product is present in Basket
    When TrendyolApp.Begin Checkout
    Then TrendyolApp.Correct login page loads


#Should not be able to Invalid Logins
#    @{InvalidLoginScenarios} =  DataManager.Get CSV Data    ${INVALID_CREDENTIALS_FILE_CSV}
#    Login with Many Invalid Credentials     @{InvalidLoginScenarios}

#Should be able to login
#    [Tags]  Smoke
#    Given TrendyolApp.Navigate To Sign In Page
#    When TrendyolApp.Login    ${USER}
#    Then TrendyolApp.Verify User LoggedIn


