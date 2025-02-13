*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***


*** Keywords ***



Navigate Mailbox page
    Go To  https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1661294982&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26RpsCsrfState%3dfb29a836-86c5-c6e2-eeef-e3747c5e70dd&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015

Login
    Wait Until Element is Visible  //*[text()="Sign in"]
    Click Element  //*[text()="Sign in"]
    Wait Until Element is Visible  //*[@id="i0116"]
    Input Text  //*[@id="i0116"]  qapandaautomation@hotmail.com
    Wait Until Element is Visible  //*[@id="idSIButton9"]
    Click Button  //*[@id="idSIButton9"]
    Wait Until Element is Visible  //*[@id="i0118"]
    Input Text  //*[@id="i0118"]  Testing.123
    Wait Until Element is Visible  //*[@id="idSIButton9"]
    Click Button  //*[@id="idSIButton9"]
    Wait Until Element is Visible  //*[@id="acceptButton"]
    Click Button  //*[@id="acceptButton"]

Select Inbox
    Set Selenium Speed  2.0 seconds
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Wait Until Page Contains Element  //span[@id="searchScopeButtonId-option"]
    Click Element  //span[@id="searchScopeButtonId-option"]
    Wait Until Page Contains Element  //button[@id="searchScopeButtonId-list1"]
    Click Element  //button[@id="searchScopeButtonId-list1"]

Search Your Daily Digest from WSJ
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  Your daily roundup from WSJ
    Click Element  //button[@aria-label="Search"]

Validate WSJ Digest notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[contains(text(),'View in web browser')]
    Page Should Contain Element  //table[@role="presentation"]//span[text()="Daily"]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Privacy Notice"]
    Page Should Contain Element  //a[text()="Cookie Notice"]

Search Your WSJ real-time author notification
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  The latest article from Joanna Stern
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time author notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[contains(text(),'View in web browser')]
    Page Should Contain Element  //a[text()="Read More "]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Contact Us"]
    Page Should Contain Element  //a[text()="Privacy Notice"]
    Page Should Contain Element  //a[text()="Cookie Notice"]

Search Your WSJ real-time company notification
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  WSJ The latest news on Amazon.com, Inc.
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time company notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[contains(text(),'View in browser')]
    Page Should Contain Element  //div/span[text()='Amazon.com']
    Page Should Contain Element  //a[text()="Read More "]
    #Page Should Contain Element  //a[text()="Preferences"]
    Page Should Contain Element  //a[text()="Unsubscribe"]


Search Your WSJ real-time custom topic notification
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  Latest in Film
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time custom topic notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Set Selenium Implicit Wait  10s
    Page Should Contain Element  //a[contains(text(),'View in browser')]
    Page Should Contain Element  //div[text()="Latest in Film"]
    Page Should Contain Element  //a[text()="Read More "]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Contact Us"]
    Page Should Contain Element  //a[text()="Privacy Notice"]
    Page Should Contain Element  //a[text()="Cookie Notice"]


Search Your WSJ real-time custom topic video notification
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  Latest on Evan Gershkovich: Video
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time custom topic video notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[contains(text(),'View in browser')]
    Page Should Contain Element  //div[text()="Latest on Evan Gershkovich"]
    Page Should Contain Element  //a[text()=" Watch "]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Contact Us"]
    Page Should Contain Element  //a[text()="Privacy Notice"]  #//a[text()="Privacy Policy"]
    Page Should Contain Element  //a[text()="Cookie Notice"]   #//a[text()="Cookie Policy"]

Search Your WSJ real-time author video notification
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  The latest video from Joanna Stern
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time author video notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[contains(text(),'View in browser')]
    Page Should Contain Element  //a[text()=" Watch "]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Contact Us"]
    Page Should Contain Element  //a[text()="Privacy Notice"]
    Page Should Contain Element  //a[text()="Cookie Notice"]

Search Your WSJ real-time campaign notification
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  U.S. Elections Alert: WSJ Election Challenge
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time campaign notification
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[contains(text(),'View in browser')]
    Page Should Contain Element  //span[text()="Elections"]
    Page Should Contain Element  //a[text()="Read More "]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Contact Us"]
    Page Should Contain Element  //a[text()="Privacy Notice"]
    Page Should Contain Element  //a[text()="Cookie Notice"]

Search WSJ real-time author notification for Postback
    Wait Until Page Contains Element  //input[@id="topSearchInput"]
    Click Element  //input[@id="topSearchInput"]
    Input Text  //input[@id="topSearchInput"]  WSJ The latest from Ann M. Simmons
    Click Element  //button[@aria-label="Search"]

Validate WSJ real-time author notification for Postback
    Wait Until Page Contains Element  //div[@id="groupHeaderTop results"]/../div[2]
    Click Element  //div[@id="groupHeaderTop results"]/../div[2]
    Page Should Contain Element  //a[text()="Is this email difficult to read? View in browser"]
    Page Should Contain Element  //a[text()="Read More "]
    Page Should Contain Element  //a[text()="Alerts Center"]
    Page Should Contain Element  //a[text()="Contact Us"]
    Page Should Contain Element  //a[text()="Privacy Notice"]  #//a[text()="Privacy Policy"]
    Page Should Contain Element  //a[text()="Cookie Notice"]  #//a[text()="Cookie Policy"]

Unsubscribe the mails
    Page Should Contain Element  //div[text()="Unsubscribe"]
    Click Element  //div[text()="Unsubscribe"]
    Set Selenium Implicit Wait  50s
    Page Should Contain Element  //button[@id="ok-1"]
    Click Element  //button[@id="ok-1"]

Verify the mail is unsubscribed
    Page Should Not Contain  //div[text()="Unsubscribe"]
