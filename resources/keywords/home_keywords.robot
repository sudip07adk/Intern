*** Settings ***
Documentation     Home Page Keywords
Library           SeleniumLibrary

Resource          ../pages/HomePage.robot
Resource          ../locators/home_locators.robot
Resource          common.robot


*** Keywords ***
Navigate To Home Page
    [Documentation]    Navigate to the home page
    Open Application    ${HOME_URL}
    Home Page Should Load
    Verify Welcome Text Is Visible
    Log    Navigation to home page completed

Verify Home Page Layout
    [Documentation]    Verify complete home page layout and elements
    Home Page Should Load
    Verify All Categories Are Visible
    Verify Featured Products Are Visible
    Log    Home page layout verification completed

Select Product Category
    [Documentation]    Select a specific product category
    [Arguments]    ${category}
    Click On Category    ${category}
    Log    Selected category: ${category}

Navigate To Phones Category
    [Documentation]    Navigate to Phones category
    Select Product Category    Phones
    Wait For Element To Be Visible    ${PRODUCT_CARDS}

Navigate To Laptops Category
    [Documentation]    Navigate to Laptops category
    Select Product Category    Laptops
    Wait For Element To Be Visible    ${PRODUCT_CARDS}

Navigate To Monitors Category
    [Documentation]    Navigate to Monitors category
    Select Product Category    Monitors
    Wait For Element To Be Visible    ${PRODUCT_CARDS}