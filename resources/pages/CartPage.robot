*** Settings ***
Documentation     Cart Page Object Model
Library           SeleniumLibrary

Resource          ../locators/cart_locators.robot


*** Keywords ***
Cart Page Should Load
    [Documentation]    Verify that cart page loaded successfully
    Wait Until Element Is Visible    ${TOTAL_PRICE}    timeout=10s
    Element Should Be Visible    ${CART_TABLE}
    Log    Cart page loaded

Verify Product Is In Cart
    [Documentation]    Verify that a specific product is in the cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    ${CART_ITEMS}    timeout=10s
    ${locator}=    Set Variable    xpath://td[contains(text(), '${product_name}')]
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Log    Product '${product_name}' is in cart

Get Cart Total Price
    [Documentation]    Get the total price from cart
    ${total}=    Get Text    ${TOTAL_PRICE}
    Log    Cart total: ${total}
    [Return]    ${total}

Get Cart Item Count
    [Documentation]    Get number of items in cart
    ${count}=    Get Element Count    ${CART_ITEMS}
    Log    Items in cart: ${count}
    [Return]    ${count}

Click Place Order Button
    [Documentation]    Click the Place Order button to open order modal
    Wait Until Element Is Visible    ${PLACE_ORDER_BTN}    timeout=10s
    Click Element    ${PLACE_ORDER_BTN}
    Sleep    1s
    Wait Until Element Is Visible    ${ORDER_MODAL}    timeout=10s
    Log    Place order modal opened

Fill Order Form
    [Documentation]    Fill the order form with provided data
    [Arguments]    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    Input Text    ${ORDER_NAME_INPUT}    ${name}
    Input Text    ${ORDER_COUNTRY_INPUT}    ${country}
    Input Text    ${ORDER_CITY_INPUT}    ${city}
    Input Text    ${ORDER_CARD_INPUT}    ${card}
    Input Text    ${ORDER_MONTH_INPUT}    ${month}
    Input Text    ${ORDER_YEAR_INPUT}    ${year}
    Log    Order form filled with details

Click Purchase Button
    [Documentation]    Click the Purchase button to complete order
    Wait Until Element Is Visible    ${PURCHASE_BUTTON}    timeout=10s
    Click Element    ${PURCHASE_BUTTON}
    Sleep    2s
    Log    Purchase button clicked

Verify Order Success
    [Documentation]    Verify that order was placed successfully
    Wait Until Element Is Visible    ${SUCCESS_MODAL}    timeout=10s
    Element Should Be Visible    ${SUCCESS_MESSAGE}
    ${message}=    Get Text    ${SUCCESS_MESSAGE}
    Log    Order successful: ${message}

Click Confirm In Success Modal
    [Documentation]    Click confirm button in success modal
    Wait Until Element Is Visible    ${CONFIRM_OK_BTN}    timeout=10s
    Click Element    ${CONFIRM_OK_BTN}
    Sleep    2s
    Log    Confirmed success modal

Remove Item From Cart
    [Documentation]    Remove a specific item from cart
    [Arguments]    ${product_name}
    ${locator}=    Set Variable    xpath://td[contains(text(), '${product_name}')]/../td/a
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Click Element    ${locator}
    Sleep    1s
    Log    Removed product from cart: ${product_name}

Verify Cart Is Empty
    [Documentation]    Verify that cart is empty
    ${count}=    Get Element Count    ${CART_ITEMS}
    Should Be Equal As Numbers    ${count}    0    Cart should be empty
    Log    Cart is empty