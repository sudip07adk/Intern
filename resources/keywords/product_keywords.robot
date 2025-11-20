*** Settings ***
Documentation     Product Page Keywords
Library           SeleniumLibrary

Resource          ../pages/ProductPage.robot
Resource          ../locators/product_locators.robot
Resource          common.robot


*** Keywords ***
Verify Product Details Are Displayed
    [Documentation]    Verify all product details are displayed
    Product Details Page Should Load
    Verify Product Title Is Visible
    Verify Product Price Is Displayed
    Verify Product Description Is Visible
    Log    All product details are displayed

Verify Product Has Valid Price
    [Documentation]    Verify that product has a valid price
    ${price}=    Get Product Price
    Should Contain    ${price}    $
    Log    Product has valid price: ${price}

Add Product To Shopping Cart
    [Documentation]    Add the current product to cart
    Add Product To Cart
    Log    Product added to shopping cart