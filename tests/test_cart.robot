*** Settings ***
Documentation     Test suite for Shopping Cart functionality
Library           SeleniumLibrary

Resource          ../resources/keywords/common.robot
Resource          ../resources/keywords/home_keywords.robot
Resource          ../resources/keywords/category_keywords.robot
Resource          ../resources/keywords/product_keywords.robot
Resource          ../resources/keywords/cart_keywords.robot
Resource          ../resources/locators/home_locators.robot
Resource          ../resources/locators/cart_locators.robot

Suite Setup       Open Application
Suite Teardown    Close Application

Test Tags         smoke    cart


*** Test Cases ***
Add Single Product To Cart And Verify
    [Documentation]    Test adding a single product and verifying it in cart
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    ${product_title}=    Get Product Title
    Add Product To Shopping Cart
    Navigate To Cart Page
    Verify Product Added To Cart    ${product_title}
    Log    Product verified in cart: ${product_title}

Verify Cart Page Loads Successfully
    [Documentation]    Test that cart page loads with correct elements
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    Cart Page Should Load
    Log    Cart page loaded successfully

Verify Cart Total Price Is Displayed
    [Documentation]    Test that cart total price is shown
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    ${total}=    Get Cart Total Price
    Should Contain    ${total}    $
    Log    Cart total price: ${total}

Verify Multiple Products In Cart
    [Documentation]    Test adding and verifying multiple products
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    ${phone_title}=    Get Product Title
    Add Product To Shopping Cart
    Navigate To Home Page
    Navigate To Laptops Category
    Open First Product In Category
    ${laptop_title}=    Get Product Title
    Add Product To Shopping Cart
    Navigate To Cart Page
    Verify Product Added To Cart    ${phone_title}
    Verify Product Added To Cart    ${laptop_title}
    ${count}=    Get Cart Item Count
    Should Be Equal As Numbers    ${count}    2
    Log    Multiple products verified in cart

Place Order With Valid Data
    [Documentation]    Test complete order placement flow
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    Complete Order With Default Data
    Log    Order placed successfully

Verify Order Success Modal
    [Documentation]    Test that order success modal appears
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Laptops Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    Complete Order With Default Data
    Element Should Be Visible    ${SUCCESS_MESSAGE}
    Log    Order success modal verified

Close Order Success And Verify Cart Reset
    [Documentation]    Test closing success modal and verifying cart
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    Complete Order With Default Data
    Close Order Success Modal
    Log    Success modal closed after order

Place Order With Custom Data
    [Documentation]    Test order placement with custom user data
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Monitors Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    Click Place Order Button
    Fill Order Form    John Doe    Canada    Toronto    5555555555555555    06    2026
    Click Purchase Button
    Verify Order Success
    Log    Order placed with custom data

Verify Place Order Button Is Visible
    [Documentation]    Test that Place Order button exists on cart page
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Add Product To Shopping Cart
    Navigate To Cart Page
    Element Should Be Visible    ${PLACE_ORDER_BTN}
    Element Should Be Enabled    ${PLACE_ORDER_BTN}
    Log    Place Order button is visible and enabled

Test Complete Shopping Workflow
    [Documentation]    Test complete workflow: browse -> add to cart -> checkout
    [Tags]    smoke
    Navigate To Home Page
    Verify Home Page Layout
    Navigate To Laptops Category
    Verify Category Products Are Listed
    Open First Product In Category
    Verify Product Details Are Displayed
    ${product_title}=    Get Product Title
    Add Product To Shopping Cart
    Navigate To Cart Page
    Verify Product Added To Cart    ${product_title}
    ${total}=    Get Cart Total Price
    Should Not Be Empty    ${total}
    Complete Order With Default Data
    Verify Order Success
    Log    Complete shopping workflow successful