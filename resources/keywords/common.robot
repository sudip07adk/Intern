*** Settings ***
Documentation     Common Keywords for all tests
Library           SeleniumLibrary
Library           Collections


*** Keywords ***
Open Application
    [Documentation]    Open the Demoblaze website in browser
    [Arguments]    ${url}=https://www.demoblaze.com/
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Log    Application opened: ${url}

Close Application
    [Documentation]    Close browser and quit WebDriver
    Close Browser

Wait For Element To Be Visible
    [Documentation]    Wait for an element to be visible with timeout
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Page Contains    PRODUCT STORE    10s
    Log    Element is visible: ${locator}

Wait For Element And Click
    [Documentation]    Wait for element and click it
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Click Element    ${locator}
    Log    Clicked element: ${locator}

Get Element Text
    [Documentation]    Get text from an element
    [Arguments]    ${locator}
    ${text}=    Get Text    ${locator}
    Log    Element text: ${text}
    Return    ${text}

Verify Element Exists
    [Documentation]    Verify that an element exists on page
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}
    Log    Element exists: ${locator}

Switch To Alert And Accept
    [Documentation]    Handle JavaScript alert dialogs
    Sleep    1s
    ${alert_text}=    Get Alert Message
    Log    Alert message: ${alert_text}
    Accept Alert
    Log    Alert accepted

Log Current Page Title
    [Documentation]    Log the current page title
    ${title}=    Get Title
    Log    Current page title: ${title}
    Return    ${title}

Take Screenshot
    [Documentation]    Take a screenshot for debugging
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    ${screenshot_name}.png
    Log    Screenshot taken: ${screenshot_name}.png