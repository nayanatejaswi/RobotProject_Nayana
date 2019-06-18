*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log To Console    Testsuite Started

Suite Teardown    Log To Console    TestSuite Completed    

# Test Setup    GoToHomePage
# Test Teardown    CloseBrowser

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    Log    Hello World... 
    
MySecondTest
    [Tags]    Smoke
    Log    This is my selenium Training   
    
MyThirdTest
    Set Tags    Regression
    Remove Tags    Regression
    Log    I am inside my test        
    
# FirstSeleniumTest
    # Open Browser    http://google.com    chrome
    # Set Browser Implicit Wait    5
    # Input Text    name=q    NayanaTara
    # Press Keys    name=q    ENTER
    # # Click Button    name=btnK    
    # Sleep    2    
    # Close All Browsers
    # Log    TestCase Completed  
    
# LoginTest
    # [Documentation]    This is a sample Login test 
    # Set Tags    smoke
    # BrowserSettings
    # Login
    # Logout
    # Log To Console    this tested was executed by %{username} in %{os} setup            
    
*** Variables ***
# Scalar Variable
${url}     https://www.amazon.in/ap/signin?_encoding=UTF8&ignoreAuthState=1&openid.assoc_handle=inflex&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.in%2F%3Fref_%3Dnav_signin&switch_account=
# List Variable
@{credentials}        +917331184075              amazon@123
# Dictionary Variable
&{login}               username=+917331184075    password=amazon@123


*** Keywords ***
Login
    Input Text    id=ap_email    @{credentials}[0]
    Click Button    id=continue
    Input Password    id=ap_password    &{login}[password]
    Click Button    id=signInSubmit  
    
BrowserSettings
    Maximize Browser Window
    Set Browser Implicit Wait    5

GoToHomePage
          Open Browser    ${url}   chrome
          
Logout
    Mouse Over    xpath=//*[@id="nav-link-accountList"]/span[1]  
    Click Element    xpath=//*[@id="nav-item-signout"]/span      
    Sleep    2    
          
CloseBrowser
    Close All Browsers

