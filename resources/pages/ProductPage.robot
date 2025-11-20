*** Settings ***
Documentation     Product Details Page Object Model
Library           SeleniumLibrary

Resource          ../locators/product_locators.robot


*** Keywords ***
Product Details Page Should Load
    [Documentation]    Verify that product details page loaded successfully
    Wait Until Element Is Visible    ${PRODUCT_TITLE}    timeout=10s
    Element Should Be Visible    ${PRODUCT_IMAGE}
    Log    Product details page loaded

Get Product Title
    [Documentation]    Get the product title
    ${title}=    Get Text    ${PRODUCT_TITLE}
    Log    Product title: ${title}
    [Return]    ${title}

Get Product Price
    [Documentation]    Get the product price
    ${price}=    Get Text    ${PRODUCT_PRICE}
    Log    Product price: ${price}
    [Return]    ${price}

Get Product Description
    [Documentation]    Get the product description
    ${description}=    Get Text    ${PRODUCT_DESCRIPTION}
    Log    Product description: ${description}
    [Return]    ${description}

Verify Product Title Is Visible
    [Documentation]    Verify that product title is displayed
    Element Should Be Visible    ${PRODUCT_TITLE}
    ${title}=    Get Text    ${PRODUCT_TITLE}
    Should Not Be Empty    ${title}
    Log    Product title is visible: ${title}

Verify Product Price Is Displayed
    [Documentation]    Verify that product price is displayed
    Element Should Be Visible    ${PRODUCT_PRICE}
    ${price}=    Get Text    ${PRODUCT_PRICE}
    Should Not Be Empty    ${price}
    Log    Product price is displayed: ${price}

Verify Product Description Is Visible
    [Documentation]    Verify that product description is displayed
    Element Should Be Visible    ${PRODUCT_DESCRIPTION}
    ${description}=    Get Text    ${PRODUCT_DESCRIPTION}
    Should Not Be Empty    ${description}
    Log    Product description is visible

Add Product To Cart
    [Documentation]    Click Add to Cart button and handle confirmation
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    timeout=10s
    Click Element    ${ADD_TO_CART_BUTTON}
    Sleep    1s
    Handle Alert
    Sleep    2s
    Log    Product added to cart