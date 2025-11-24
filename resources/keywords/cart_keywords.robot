*** Settings ***
Documentation     Cart Page Keywords
Library           SeleniumLibrary

Resource          ../pages/CartPage.robot
#Resource          ../locators/cart_locators.robot
#Resource          common.robot


*** Keywords ***
Navigate To Cart Page
    [Documentation]    Navigate to the shopping cart page
    Click Element    ${CART_LINK}
    Sleep    5s
    Cart Page Should Load
    Log    Navigated to cart page

Verify Product Added To Cart
    [Documentation]    Verify that product is present in cart
    [Arguments]    ${Laptop    }
    Verify Product Is In Cart    ${product_name}
    Log    Product verified in cart: ${product_name}

Complete Order Placement
    [Documentation]    Complete the order placement process
    [Arguments]    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    Click Place Order Button
    Fill Order Form    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    Click Purchase Button
    Verify Order Success
    Log    Order placement completed

Complete Order With Default Data
    [Documentation]    Complete order with predefined test data
    ${order_data}=    Create Dictionary    name=Sudip    country=Nepal    city=Kathmandu    card=4111111111111111    month=12    year=2025
    Click Place Order Button
    Fill Order Form    ${order_data}[name]    ${order_data}[country]    ${order_data}[city]    ${order_data}[card]    ${order_data}[month]    ${order_data}[year]
    Click Purchase Button
    Verify Order Success
    Log    Order completed with default data

Close Order Success Modal
    [Documentation]    Close the order success modal
    Click Confirm In Success Modal
    Log    Success modal closed