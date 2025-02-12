*** Settings ***
Documentation  Mansion Global Regression Tests
Force Tags  MansionGlobal
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/MansionGlobalArticlePage.robot
Resource  ../../../Resources/PageObjects/MansionGlobalAuthorsPage.robot
Resource  ../../../Resources/PageObjects/MansionGlobalPreferenceCenterPage.robot
Resource  ../../../Resources/PageObjects/MansionGlobalMailboxPage.robot

Test Setup  CommonFunctionality.Start Mansion Global Article
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***

*** Test Cases ***
#US-T87
#US-T88
#US-T89
#US-T100
Validate the Mansion GLobal Preference Center page
    [Documentation]  This test case validates the Mansion Global preference center page
    [Tags]  Regression  PrefrenceCenter   US-T87

    MansionGLobalPreferenceCenterPage.Add Author By Hotlink
    DefinedKeywords.Sign In Process
    MansionGLobalPreferenceCenterPage.Validate Followed Authors
    ${val}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val} > 0  MansionGLobalPreferenceCenterPage.Click Following Toggle Alert Pop up
    MansionGlobalPreferenceCenterPage.Validate Author Name
    MansionGlobalPreferenceCenterPage.Validate Following Toggle Feature
    MansionGlobalPreferenceCenterPage.Validate Following Frequency
    MansionGlobalPreferenceCenterPage.Validate All Tabs Displayed
    MansionGlobalPreferenceCenterPage.Validate Author On All Tab
    MansionGlobalPreferenceCenterPage.Add Company By Hotlink
    MansionGlobalPreferenceCenterPage.Validate Followed Companies
    #${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    #Run Keyword If  ${val2} > 0
    MansionGlobalPreferenceCenterPage.Click Following Toggle Alert Pop up
#    MansionGLobalPreferenceCenterPage.Validate Company Frequency
#    MansionGLobalPreferenceCenterPage.Validate Company Quote Link
    MansionGLobalPreferenceCenterPage.Validate Company On All Tab
    MansionGLobalPreferenceCenterPage.Click Mansion Global tab
    MansionGLobalPreferenceCenterPage.Validate Company Toggle Feature
    MansionGLobalPreferenceCenterPage.Click Company Toggle Feature
    Set Selenium Speed  0.1 seconds
    MansionGLobalPreferenceCenterPage.Validate Following Toggle Alert Pop up
    MansionGLobalPreferenceCenterPage.Click Following Toggle Alert Pop up
    END

#US-T27
Validate Authors for Mansion Global Article page without byline
    [Documentation]  This test case validates authors without byline for Mansion Global article page
    [Tags]  Regression  Author  Article  US-T27

    CommonFunctionality.Start Mansion Global Article without byline
    DefinedKeywords.Mansion Global Sign In Process
    MansionGlobalArticlePage.Validate author without byline

#US-T148
Validate the Mansion Global digest notification
    [Documentation]  This test case validates the Mansion Global digest notification
    [Tags]  Regression  Notifications   US-T148
    MansionGlobalMailboxPage.Navigate Mailbox page
    MansionGlobalMailboxPage.Login
    MansionGlobalMailboxPage.Select Inbox
    MansionGlobalMailboxPage.Search Your Daily Digest from Mansion Global
    MansionGlobalMailboxPage.Validate Mansion Global Digest notification

#US-T121
Validate the Mansion Global real-time author notification
    [Documentation]  This test case validates the Mansion Global real-time author notification
    [Tags]  Regression  Notifications  Author        US-T121
    MansionGlobalMailboxPage.Navigate Mailbox page
    MansionGlobalMailboxPage.Login
    MansionGlobalMailboxPage.Select Inbox
    MansionGlobalMailboxPage.Search Your Mansion Global real-time author notification
    MansionGlobalMailboxPage.Validate Mansion Global real-time author notification

#US-T158
Validate the Mansion Global weekly saved search notification
    [Documentation]  This test case validates the Mansion Global weekly saved search notification
    [Tags]  Regression  Notifications   US-T158
    MansionGlobalMailboxPage.Navigate Mailbox page
    MansionGlobalMailboxPage.Login
    MansionGlobalMailboxPage.Select Inbox
    MansionGlobalMailboxPage.Search Your Mansion Global weekly saved search notification
    MansionGlobalMailboxPage.Validate Mansion Global weekly saved search notification

#US-T359
Validate Postback on Preference Center
    [Documentation]  This test case vabrlidates the Mansion Global Postback on Preference Center
    [Tags]  Regression  Postback        US-T359
    MansionGlobalPreferenceCenterPage.Add Breaking News By Hotlink
    DefinedKeywords.Sign In Process
    MansionGlobalPreferenceCenterPage.Validate Followed Breaking News
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  MansionGlobalPreferenceCenterPage.Click Following Toggle Alert Pop up
    MansionGlobalPreferenceCenterPage.Validate Breaking News Toggle Feature
    MansionGlobalPreferenceCenterPage.Click Breaking News Toggle Feature
    MansionGlobalPreferenceCenterPage.Validate Following Toggle Alert Pop up
    MansionGlobalPreferenceCenterPage.Click Following Toggle Alert Pop up
    MansionGlobalPreferenceCenterPage.Validate Over Mouse On Notification Tooltip
    MansionGlobalMailboxPage.Navigate Mailbox page
    Set Selenium Implicit Wait  6.0 seconds
    MansionGlobalMailboxPage.Login
    MansionGlobalMailboxPage.Select Inbox
    MansionGlobalMailboxPage.Search Mansion Global real-time author notification for Postback
    MansionGlobalMailboxPage.Validate Mansion Global real-time author notification for Postback
#    MansionGlobalMailboxPage.Unsubscribe the mails
#    MansionGlobalMailboxPage.Verify the mail is unsubscribed
#    MansionGlobalPreferenceCenterPage.Add Author By Hotlink
