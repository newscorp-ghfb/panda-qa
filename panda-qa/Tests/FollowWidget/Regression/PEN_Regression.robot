*** Settings ***
Documentation  PEN Regression Tests
Force Tags  PENews
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/PENArticlePage.robot
Resource  ../../../Resources/PageObjects/PENAuthorsPage.robot
Resource  ../../../Resources/PageObjects/PENPreferenceCenterPage.robot
Resource  ../../../Resources/PageObjects/PENMailboxPage.robot
Resource  ../../../Resources/PageObjects/PENCapabilitiesPage.robot

Test Setup  CommonFunctionality.Start PEN Article
Test Teardown  CommonFunctionality.Finish Testcase

*** Variables ***

*** Test Cases ***
#US-T95
#US-T96
Validate the PEN Preference Center page
    [Documentation]  This test case validates the PEN preference center page
    [Tags]  Regression  PreferenceCenter  Follow1

    PENPreferenceCenterPage.Add Author By Hotlink
    DefinedKeywords.Sign In Process
    PENPreferenceCenterPage.Validate Followed Authors
    ${val}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val} > 0  PENPreferenceCenterPage.Click Following Toggle Alert Pop up
    PENPreferenceCenterPage.Validate Author Name
    PENPreferenceCenterPage.Validate Following Toggle Feature
    PENPreferenceCenterPage.Validate Following Frequency
    PENPreferenceCenterPage.Validate All Tabs Displayed
    PENPreferenceCenterPage.Validate Author On All Tab
    #PENlPreferenceCenterPage.Navigate Article page
    #PENArticlePage.Scroll stories

#US-T29
Validate Authors for PEN Article page without byline
    [Documentation]  This test case validates authors without byline for PEN article page
    [Tags]  Regression  Article  Author   US-T29

    CommonFunctionality.Start PEN Article without byline
    PENArticlePage.Validate author without byline

#US-T123
Validate the PEN digest notification
    [Documentation]  This test case validates the PEN digest notification
    [Tags]  Regression  Notifications    Follow1
    PENMailboxPage.Navigate Mailbox page
    PENMailboxPage.Login
    PENMailboxPage.Select Inbox
    PENMailboxPage.Search Your Daily Digest from PEN
    PENMailboxPage.Validate PEN Digest notification

#US-T150
Validate the PEN real-time author notification
    [Documentation]  This test case validates the PEN real-time author notification
    [Tags]  Regression  Notifications  Author      Follow1
    PENMailboxPage.Navigate Mailbox page
    PENMailboxPage.Login
    PENMailboxPage.Select Inbox
    PENMailboxPage.Search Your PEN real-time author notification
    PENMailboxPage.Validate PEN real-time author notification

#US-T152
Validate the PEN real-time company notification
    [Documentation]  This test case validates the PEN real-time company notification
    [Tags]  Regression  Company  Notifications       Follow1
    PENMailboxPage.Navigate Mailbox page
    PENMailboxPage.Login
    PENMailboxPage.Select Inbox
    PENMailboxPage.Search Your PEN real-time company notification
    PENMailboxPage.Validate PEN real-time company notification

#US-T360
Validate Postback on Preference Center
    [Documentation]  This test case validates the PEN Postback on Preference Center
    [Tags]  Regression  Postback     360
    PENPreferenceCenterPage.Add Breaking News By Hotlink
    DefinedKeywords.Sign In Process
    PENPreferenceCenterPage.Validate Followed Breaking News
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  PENPreferenceCenterPage.Click Following Toggle Alert Pop up
    PENPreferenceCenterPage.Validate Breaking News Toggle Feature
    PENPreferenceCenterPage.Click Breaking News Toggle Feature  #--unsubscribe functionality
    PENPreferenceCenterPage.Validate Following Toggle Alert Pop up
    PENPreferenceCenterPage.Click Following Toggle Alert Pop up
    PENPreferenceCenterPage.Validate Over Mouse On Notification Tooltip
    PENMailboxPage.Navigate Mailbox page
    PENMailboxPage.Login
    PENMailboxPage.Select Inbox
    PENMailboxPage.Search PEN real-time company notification for Postback
    PENMailboxPage.Validate PEN real-time company notification for Postback
    PENMailboxPage.Unsubscribe the mails
    PENMailboxPage.Verify the mail is unsubscribed
    PENPreferenceCenterPage.Add Company By Hotlink

#US-T113
Validate Private Equity News Capabilities Dashboard for Author
    [Documentation]  This test case validates the PEN Capabilities Dashboard for Author
    [Tags]  Regression  Capabilities  Author      Follow1
    PENCapabilitiesPage.Navigate Capabilities Dashboard page
    PENCapabilitiesPage.Click Login button
    PENCapabilitiesPage.Capabilities Dashboard Sign In Process
    PENCapabilitiesPage.Sign In Process
    PENCapabilitiesPage.Click Author Tab
    PENCapabilitiesPage.Validate Author Page
    PENCapabilitiesPage.Validate Author tab
    PENCapabilitiesPage.Generate Author Hotlink
    PENCapabilitiesPage.Validate Authors On Search Tab
    PENCapabilitiesPage.Click on All records tab
    PENCapabilitiesPage.Click on Author hyperlink from All records tab

 #US-T114
Validate Private Equity News Capabilities Dashboard for Company
    [Documentation]  This test case validates the PEN Capabilities Dashboard for Company
    [Tags]  Regression  Capabilities  Company       TagPECB
    PENCapabilitiesPage.Navigate Capabilities Dashboard page
    PENCapabilitiesPage.Click Login button
    PENCapabilitiesPage.Capabilities Dashboard Sign In Process
    PENCapabilitiesPage.Sign In Process
    PENCapabilitiesPage.Click Company Tab
    PENCapabilitiesPage.Validate Company Page
    PENCapabilitiesPage.Validate Company tab
    PENCapabilitiesPage.Generate Company Hotlink
    PENCapabilitiesPage.Validate Company On Search Tab
    PENCapabilitiesPage.Click on All records tab
    PENCapabilitiesPage.Click on Company hyperlink from All records tab

