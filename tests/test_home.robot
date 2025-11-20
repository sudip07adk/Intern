*** Settings ***
Documentation     Test suite for Home Page functionality
Library           SeleniumLibrary

Resource          ../resources/keywords/common.robot
Resource          ../resources/keywords/home_keywords.robot
Resource          ../resources/locators/home_locators.robot

Suite Setup       Open Application
Suite Teardown    Close Application

Test Tags         smoke    home


*** Test Cases ***
Verify Home Page Loads Successfully
    [Documentation]    Test that home page loads with all elements
    [Tags]    smoke
    Home Page Should Load
    Verify Welcome Text Is Visible
    Log Current Page Title
    Log    Home page loaded successfully

Verify All Product Categories Are Visible
    [Documentation]    Test that all product categories are accessible
    [Tags]    smoke
    Verify Home Page Layout
    Element Should Be Visible    ${CATEGORY_PHONES}
    Element Should Be Visible    ${CATEGORY_LAPTOPS}
    Element Should Be Visible    ${CATEGORY_MONITORS}
    Log    All categories verified

Verify Featured Products Are Displayed
    [Documentation]    Test that featured products are visible on home page
    [Tags]    smoke
    Verify Home Page Layout
    Wait For Element To Be Visible    ${FEATURED_PRODUCTS}
    ${count}=    Get Element Count    ${PRODUCT_ITEM}
    Should Be True    ${count} > 0
    Log    ${count} featured products displayed

Verify Navigation Menu Exists
    [Documentation]    Test that navigation menu is present
    [Tags]    smoke
    Element Should Be Visible    ${NAV_BAR}
    Element Should Be Visible    ${CART_LINK}
    Element Should Be Visible    ${CONTACT_LINK}
    Log    Navigation menu verified

Verify Home Page Logo Is Clickable
    [Documentation]    Test that home logo is visible and clickable
    [Tags]    smoke
    Element Should Be Visible    ${HOME_LOGO}
    Element Should Be Enabled    ${HOME_LOGO}
    Log    Home logo is clickable