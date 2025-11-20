*** Settings ***
Documentation     Test suite for Product Categories
Library           SeleniumLibrary

Resource          ../resources/keywords/common.robot
Resource          ../resources/keywords/home_keywords.robot
Resource          ../resources/keywords/category_keywords.robot
Resource          ../resources/locators/home_locators.robot
Resource          ../resources/locators/category_locators.robot

Suite Setup       Open Application
Suite Teardown    Close Application

Test Tags         smoke    categories


*** Test Cases ***
Verify Phones Category Has Products
    [Documentation]    Test that Phones category displays product list
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Verify Category Products Are Listed
    Verify Products Have Names And Prices
    Log    Phones category verified

Verify Laptops Category Has Products
    [Documentation]    Test that Laptops category displays product list
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Laptops Category
    Verify Category Products Are Listed
    Verify Products Have Names And Prices
    Log    Laptops category verified

Verify Monitors Category Has Products
    [Documentation]    Test that Monitors category displays product list
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Monitors Category
    Verify Category Products Are Listed
    Verify Products Have Names And Prices
    Log    Monitors category verified

Verify Products Can Be Selected From Phones
    [Documentation]    Test product selection from Phones category
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Phones Category
    Open First Product In Category
    Wait Until Page Contains    h2
    Log    Product selected from Phones

Verify Products Can Be Selected From Laptops
    [Documentation]    Test product selection from Laptops category
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Laptops Category
    Open First Product In Category
    Wait Until Page Contains    h2
    Log    Product selected from Laptops

Verify Products Can Be Selected From Monitors
    [Documentation]    Test product selection from Monitors category
    [Tags]    smoke
    Navigate To Home Page
    Navigate To Monitors Category
    Open First Product In Category
    Wait Until Page Contains    h2
    Log    Product selected from Monitors