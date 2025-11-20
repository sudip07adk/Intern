*** Settings ***
Documentation     Category Page Keywords
Library           SeleniumLibrary

Resource          ../pages/CategoryPage.robot
Resource          ../locators/category_locators.robot
Resource          common.robot


*** Keywords ***
Verify Category Products Are Listed
    [Documentation]    Verify that products are listed in category
    Category Page Should Load
    ${count}=    Get Product Count
    Log    Found ${count} products in category

Verify Products Have Names And Prices
    [Documentation]    Verify that all products display name and price
    Category Page Should Load
    Verify Product Name Is Visible
    Verify Product Price Is Visible
    Log    Products have names and prices

Open First Product In Category
    [Documentation]    Open the first product in the current category
    Click On First Product
    Wait Until Page Contains    h2
    Log    First product opened

Open Product By Name
    [Documentation]    Open a specific product by its name
    [Arguments]    ${product_name}
    Click On Product By Name    ${product_name}
    Log    Product '${product_name}' opened