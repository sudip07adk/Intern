*** Settings ***
Documentation     Home Page Object Model
Library           SeleniumLibrary

Resource          ../locators/home_locators.robot


*** Keywords ***
Home Page Should Load
    [Documentation]    Verify that home page loaded successfully
    Wait Until Element Is Visible    ${HOME_LOGO}    timeout=10s
    Title Should Be    STORE
    Log    Home page loaded successfully

Verify Welcome Text Is Visible
    [Documentation]    Verify welcome/header text on home page
    Wait Until Element Is Visible    ${WELCOME_TEXT}    timeout=10s
    Element Should Be Visible    ${WELCOME_TEXT}
    Log    Welcome text is visible

Verify All Categories Are Visible
    [Documentation]    Verify that all product categories are visible
    Element Should Be Visible    ${CATEGORY_PHONES}
    Element Should Be Visible    ${CATEGORY_LAPTOPS}
    Element Should Be Visible    ${CATEGORY_MONITORS}
    Log    All categories are visible

Verify Featured Products Are Visible
    [Documentation]    Verify that featured products are displayed on home page
    Wait Until Element Is Visible    ${FEATURED_PRODUCTS}    timeout=10s
    ${count}=    Get Element Count    ${PRODUCT_ITEM}
    Should Be True    ${count} > 0    No products found
    Log    ${count} featured products are visible

Click On Category
    [Documentation]    Click on a specific product category
    [Arguments]    ${category}
    Log    Clicking on ${category} category
    ${locator}=    Set Variable If    '${category}'=='Phones'    ${CATEGORY_PHONES}
    ...            '${category}'=='Laptops'    ${CATEGORY_LAPTOPS}
    ...            '${category}'=='Monitors'    ${CATEGORY_MONITORS}
    Click Element    ${locator}
    Sleep    2s
    Log    Clicked on ${category} category