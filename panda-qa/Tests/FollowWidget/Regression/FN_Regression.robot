*** Settings ***
Documentation  FN Regression Tests
Force Tags  FinancialNews
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/FNArticlePage.robot
Resource  ../../../Resources/PageObjects/FNAuthorsPage.robot
Resource  ../../../Resources/PageObjects/FNPreferenceCenterPage.robot
Resource  ../../../Resources/PageObjects/FNMailboxPage.robot

Test Setup  CommonFunctionality.Start FN Article
Test Teardown  CommonFunctionality.Finish Testcase


*** Variables ***

*** Test Cases ***
#US-T85
#US-T86
Validate the FN Preference Center page

    [Documentation]  This test case validates the FN London News preference center page
    [Tags]  Regression  PreferenceCenter  US-T85

    FNPreferenceCenterPage.Add Author By Hotlink
    DefinedKeywords.Sign In Process
    FNPreferenceCenterPage.Validate Followed Authors
    ${val}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val} > 0  FNPreferenceCenterPage.Click Following Toggle Alert Pop up
    FNPreferenceCenterPage.Validate Author Name
    FNPreferenceCenterPage.Validate Following Toggle Feature
    FNPreferenceCenterPage.Validate Following Frequency
    FNPreferenceCenterPage.Validate All Tabs Displayed
    FNPreferenceCenterPage.Validate Author On All Tab
    FNPreferenceCenterPage.Add Company By Hotlink
    FNPreferenceCenterPage.Validate Followed Companies
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  FNPreferenceCenterPage.Click Following Toggle Alert Pop up
    FNPreferenceCenterPage.Validate Company Frequency
    FNPreferenceCenterPage.Validate Company Quote Link
    FNPreferenceCenterPage.Validate Company On All Tab
    FNPreferenceCenterPage.Click FN tab
    FNPreferenceCenterPage.Validate Company Toggle Feature
    FNPreferenceCenterPage.Click Company Toggle Feature
    FNPreferenceCenterPage.Validate Following Toggle Alert Pop up
    FNPreferenceCenterPage.Click Following Toggle Alert Pop up
    #FNPreferenceCenterPage.Navigate Article page
    #FNArticlePage.Scroll stories

#US-T25
Validate Authors for FN Article page without byline
    [Documentation]  This test case validates authors without byline for FN article page
    [Tags]  Regression  Author  Article   US-T25

    CommonFunctionality.Start FN Article without byline
    FNArticlePage.Validate author without byline

#US-T142
Validate the FN digest notification
    [Documentation]  This test case validates the FN digest notification
    [Tags]  Regression  Notifications   US-T142
    FNMailboxPage.Navigate Mailbox page
    FNMailboxPage.Login
    FNMailboxPage.Select Inbox
    FNMailboxPage.Search Your Daily Digest from FN
    FNMailboxPage.Validate FN Digest notification

#US-T120
Validate the FN real-time author notification
    [Documentation]  This test case validates the FN real-time author notification
    [Tags]  Regression  Author  Notifications   US-T120
    FNMailboxPage.Navigate Mailbox page
    FNMailboxPage.Login
    FNMailboxPage.Select Inbox
    FNMailboxPage.Search Your FN real-time author notification
    FNMailboxPage.Validate FN real-time author notification

#US-T140
Validate the FN real-time company notification
    [Documentation]  This test case validates the FN real-time company notification
    [Tags]  Regression  Company  Notifications   US-T140
    FNMailboxPage.Navigate Mailbox page
    FNMailboxPage.Login
    FNMailboxPage.Select Inbox
    FNMailboxPage.Search Your FN real-time company notification
    FNMailboxPage.Validate FN real-time company notification

#US-T358
#US T357
Validate Postback on Preference Center
    [Documentation]  This test case validates the FN Postback on Preference Center
    [Tags]  Regression  Postback  US-T358
    FNPreferenceCenterPage.Add Breaking News By Hotlink
    DefinedKeywords.FN Sign In Process
    Set Selenium Implicit Wait  15s
    FNPreferenceCenterPage.Validate FN Followed Breaking News
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  FNPreferenceCenterPage.Click Following Toggle Alert Pop up
    FNPreferenceCenterPage.Validate Breaking News Toggle Feature
    FNPreferenceCenterPage.Click Breaking News Toggle Feature
    FNPreferenceCenterPage.Validate Following Toggle Alert Pop up
    FNPreferenceCenterPage.Click Following Toggle Alert Pop up
    FNPreferenceCenterPage.Validate Over Mouse On Notification Tooltip
    FNMailboxPage.Navigate Mailbox page
    FNMailboxPage.Login
    FNMailboxPage.Select Inbox
    FNMailboxPage.Search FN real-time company notification for Postback
    FNMailboxPage.Validate FN real-time company notification for Postback
#    FNMailboxPage.Unsubscribe the mails
#    FNMailboxPage.Verify the mail is unsubscribed
#    FNPreferenceCenterPage.Add Company By Hotlink
