*** Settings ***
Documentation     Category Page Object Model
Library           SeleniumLibrary

Resource          ../locators/category_locators.robot


*** Keywords ***
Category Page Should Load
    [Documentation]    Verify that category page loaded successfully
    Wait Until Element Is Visible    ${PRODUCT_CARDS}    timeout=10s
    ${count}=    Get Element Count    ${PRODUCT_CARDS}
    Should Be True    ${count} > 0    No products in category
    Log    Category page loaded with ${count} products

Get Product Count
    [Documentation]    Get total number of products in current category
    [Return]    ${count}
    ${count}=    Get Element Count    ${PRODUCT_CARDS}

Verify Product Name Is Visible
    [Documentation]    Verify that product names are visible in category
    ${name}=    Get Text    ${PRODUCT_NAME}
    Should Not Be Empty    ${name}
    Log    Product name: ${name}

Verify Product Price Is Visible
    [Documentation]    Verify that product prices are visible
    ${price}=    Get Text    ${PRODUCT_PRICE}
    Should Not Be Empty    ${price}
    Log    Product price: ${price}

Click On First Product
    [Documentation]    Click on the first product in the category
    Wait Until Element Is Visible    ${PRODUCT_LINK}    timeout=10s
    Click Element    ${PRODUCT_LINK}
    Sleep    2s
    Log    Clicked on first product

Click On Product By Name
    [Documentation]    Click on a specific product by its name
    [Arguments]    ${product_name}
    ${locator}=    Set Variable    xpath://a[contains(text(), '${product_name}')]
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Click Element    ${locator}
    Sleep    2s
    Log    Clicked on product: ${product_name}