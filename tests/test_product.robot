*** Settings ***
Documentation     Test suite for Product Details Page
Library           SeleniumLibrary

Resource          ../resources/keywords/common.robot
Resource          ../resources/keywords/home_keywords.robot
Resource          ../resources/keywords/category_keywords.robot
Resource          ../resources/keywords/product_keywords.robot
Resource          ../resources/locators/home_locators.robot
Resource          ../resources/locators/product_locators.robot

Suite Setup       Open Application
Suite Teardown    Close Application

Test Tags         smoke    product


*** Test Cases ***
Verify Product Details Page Loads
    [Documentation]    Test that product details page loads correctly
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Product Details Page Should Load
    Log    Product details page loaded

Verify Product Title Is Displayed
    [Documentation]    Test that product title is visible
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Verify Product Title Is Visible
    Log    Product title displayed

Verify Product Price Is Displayed
    [Documentation]    Test that product price is visible
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Laptops Category
    Open First Product In Category
    Verify Product Price Is Displayed
    Verify Product Has Valid Price
    Log    Product price verified

Verify Product Description Is Available
    [Documentation]    Test that product description is available
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Monitors Category
    Open First Product In Category
    Verify Product Description Is Visible
    Log    Product description verified

Verify Add To Cart Button Exists
    [Documentation]    Test that Add to Cart button is present
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Element Should Be Visible    ${ADD_TO_CART_BUTTON}
    Log    Add to Cart button is present

Add Phone Product To Cart
    [Documentation]    Test adding a phone product to cart
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Add Product To Shopping Cart
    Log    Phone product added to cart

Add Laptop Product To Cart
    [Documentation]    Test adding a laptop product to cart
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Laptops Category
    Open First Product In Category
    Add Product To Shopping Cart
    Log    Laptop product added to cart

Add Monitor Product To Cart
    [Documentation]    Test adding a monitor product to cart
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Monitors Category
    Open First Product In Category
    Add Product To Shopping Cart
    Log    Monitor product added to cart

Verify Product Title And Price Together
    [Documentation]    Test that both title and price display correctly
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    ${title}=    Get Product Title
    ${price}=    Get Product Price
    Should Not Be Empty    ${title}
    Should Not Be Empty    ${price}
    Should Contain    ${price}    $
    Log    Product: ${title} | Price: ${price}