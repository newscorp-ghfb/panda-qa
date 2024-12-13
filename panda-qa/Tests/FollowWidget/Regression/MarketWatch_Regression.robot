*** Settings ***
Documentation  Market Watch Regression Tests
Force Tags  MarketWatch
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/MarketWatchArticlePage.robot
Resource  ../../../Resources/PageObjects/MarketWatchWatchlistPage.robot
Resource  ../../../Resources/PageObjects/MarketWatchAuthorsPage.robot
Resource  ../../../Resources/PageObjects/MarketWatchPreferenceCenterPage.robot
Resource  ../../../Resources/PageObjects/MarketWatchMailboxPage.robot
Resource  ../../../Resources/PageObjects/MarketWatchAlertsPage.robot

Test Setup  CommonFunctionality.Start Market Watch Article
#Test Setup  CommonFunctionality.Start Market Watch Newsletter
Test Teardown  CommonFunctionality.Finish Testcase

*** Variables ***

*** Test Cases ***
#US-T92
#US-T93
Validate the Market Watch Preference Center page
    [Documentation]  This test case validates the Market Watch preference center page
    [Tags]  Regression  PreferenceCenter  US-T92

    MarketWatchPreferenceCenterPage.Add Author By Hotlink
    DefinedKeywords.MarketWatch PreferenceCenter User Sign In Process
    MarketWatchPreferenceCenterPage.Validate Followed Authors
    ${val}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val} > 0  MarketWatchPreferenceCenterPage.Click Following Toggle Alert Pop up
    MarketWatchPreferenceCenterPage.Validate Author Name
    MarketWatchPreferenceCenterPage.Validate Following Toggle Feature
    MarketWatchPreferenceCenterPage.Validate Following Frequency
    MarketWatchPreferenceCenterPage.Validate All Tabs Displayed
    MarketWatchPreferenceCenterPage.Validate Author On All Tab
    #MarketWatchPreferenceCenterPage.Validate Following Toggle Alert Pop up
    #MarketWatchPreferenceCenterPage.Click Following Toggle Alert Pop up
    #MarketWatchPreferenceCenterPage.Navigate Article page
    #MarketWatchArticlePage.Scroll storie

#US-T28
Validate Authors for MarketWatch Article page without byline
    [Documentation]  This test case validates authors without byline for Market Watch article page
    [Tags]  Regression  Author  Article

    CommonFunctionality.Start Market Watch Article without byline
    MarketWatchArticlePage.Validate author without byline

#US-T218
#US-T219
#US-T220
Validate the Watchlist widget from Watchlist page
    [Documentation]  This test case validates the watchlist widget from watchlist page
    [Tags]  Regression  Watchlist  218

    CommonFunctionality.Start MarketWatch for Watchlist page
    Execute javascript  window.scrollTo(0,500)
    DefinedKeywords.MarketWatch Test User Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    MarketWatchWatchlistPage.Validate Watchlist Page
    MarketWatchWatchlistPage.Validate Default New Watchlist
    MarketWatchWatchlistPage.Click Add Symbol Input
    MarketWatchWatchlistPage.Type Symbol
    MarketWatchWatchlistPage.Select Symbol
    MarketWatchWatchlistPage.Validate Symbol in Default New Watchlist
    MarketWatchWatchlistPage.Create Watchlist Name
    MarketWatchWatchlistPage.Edit Watchlist Name
    MarketWatchWatchlistPage.Type Symbol
    MarketWatchWatchlistPage.Select Symbol
    MarketWatchWatchlistPage.Validate Symbol in Created Watchlist
    MarketWatchWatchlistPage.Delete Watchlists


#US-T276
#US-T272
Validate the MarketWatch price and volume on the alerts page
    [Documentation]  This test case validates the MarketWatch price and volume on the alerts page
    [Tags]  Regression  MarketWatch Price and Volume Alerts   US-T276

    CommonFunctionality.Start MarketWatch for Price and Volume Alerts page
    DefinedKeywords.MarketWatch Alerts User Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    MarketWatchAlertsPage.Validate Price and Volume Alert page
    MarketWatchAlertsPage.Click Edit option on Alerts page
    MarketWatchAlertsPage.Click Enter Volume threshold value
    MarketWatchAlertsPage.Click Save Alert Button
    MarketWatchAlertsPage.Click on Back Button
#    MarketWatchAlertsPage.Click on Delete Button
#    MarketWatchAlertsPage.Validate Price and Volume Alerts
#    MarketWatchAlertsPage.Click Enter Volume threshold value
#    MarketWatchAlertsPage.Click Save Button
##    MarketWatchAlertsPage.Click Close button icon
#    MarketWatchAlertsPage.Click Delete Alert Button
#    MarketWatchAlertsPage.Click Delete Alert Confirmation Button

#US-T278
Validate the MarketWatch price and volume alert in Quote page
    [Documentation]  This test case validates the MarketWatch price and volume alerts on the Quote page
    [Tags]  Regression  MarketWatch Price and Volume alert in Quote page    Follow1
    CommonFunctionality.Start MarketWatch for Price and Volume Alerts page
    DefinedKeywords.MarketWatch Alerts User Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    MarketWatchAlertsPage.Validate Price and Volume Alert page
    MarketWatchAlertsPage.Click Edit option on Alerts page
    MarketWatchAlertsPage.Click Enter Volume search value
    MarketWatchAlertsPage.Click Save Alert Button
    MarketWatchAlertsPage.Click on Back Button
    MarketWatchAlertsPage.Click on GoldMan Sachs Investing stock on Quotes page
    MarketWatchAlertsPage.Click on Historical Quotes for GoldMan Sachs Investing stock
#    MarketWatchAlertsPage.Click On Search Quote option
#    MarketWatchAlertsPage.Click on Apple Investing stock on Quotes page
#    MarketWatchAlertsPage.Click on Historical Quotes for Apple Investing stock

#US-T298
Validate the MarketWatch price and volume alert deletion on Quote page
    [Documentation]  This test case validates the MarketWatch price and volume alerts on the Quote page
    [Tags]  Regression  MarketWatch Price and Volume alert in Quote page   Follow1
    CommonFunctionality.Start MarketWatch for Price and Volume Alerts page
    DefinedKeywords.MarketWatch Alerts User Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    MarketWatchAlertsPage.Validate Price and Volume Alert page
    MarketWatchAlertsPage.Click on Delete Button
    MarketWatchAlertsPage.Click Delete Alert Confirmation Button

#US-T149
Validate the MW digest notification
    [Documentation]  This test case validates the MW digest notification
    [Tags]  Regression  Notifications     Follow1
    MarketWatchMailboxPage.Navigate Mailbox page
    MarketWatchMailboxPage.Login
    MarketWatchMailboxPage.Select Inbox
    MarketWatchMailboxPage.Search Your Daily Digest from MW
    #MarketWatchMailboxPage.Validate MW Digest notification


#US-T415
Validate the MarketWatch Newsletter
  [Documentation]  This test case validates the MarketWatch price and volume alerts on the Quote page
  [Tags]  Regression  TagMWN
     CommonFunctionality.Start Market Watch Newsletter
     DefinedKeywords.Market Watch Sign In Process
     Set Selenium Implicit Wait  20
     MarketWatchAlertsPage.Validate Newsletters option on MW Preference Center
     MarketWatchAlertsPage.Click Newsletters option on MW Preference Center
     Execute javascript  window.scrollTo(0,500)
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of subscription to Mutual Funds Weekly newsletters
     MarketWatchAlertsPage.Validation of Unsubscripton of Mutual Funds Weekly newsletters

#US-T432
Validate the MarketWatch Newsletter
  [Documentation]  This test case validates the Personal Finance
  [Tags]  Regression  TagPF
     CommonFunctionality.Start Market Watch Newsletter
     DefinedKeywords.Market Watch Sign In Process
     Set Selenium Implicit Wait  20
     MarketWatchAlertsPage.Validate Newsletters option on MW Preference Center
     MarketWatchAlertsPage.Click Newsletters option on MW Preference Center
     Execute javascript  window.scrollTo(0,250)
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of subscription to Personal Finace newsletters
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of Unsubscripton of Personal Finace newsletters

#US-T431
Validate the MarketWatch Newsletter
  [Documentation]  This test case validates the Midday Report
  [Tags]  Regression  TagMR
     CommonFunctionality.Start Market Watch Newsletter
     DefinedKeywords.Market Watch Sign In Process
     Set Selenium Implicit Wait  20
     MarketWatchAlertsPage.Validate Newsletters option on MW Preference Center
     MarketWatchAlertsPage.Click Newsletters option on MW Preference Center
     Execute javascript  window.scrollTo(0,600)
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of subscription to Midday Report newsletters
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of Unsubscripton of Midday Report newsletters

#US-T433
Validate the MarketWatch Newsletter
  [Documentation]  This test case validates the After the Bell
  [Tags]  Regression  TagAB
     CommonFunctionality.Start Market Watch Newsletter
     DefinedKeywords.Market Watch Sign In Process
     Set Selenium Implicit Wait  20
     MarketWatchAlertsPage.Validate Newsletters option on MW Preference Center
     MarketWatchAlertsPage.Click Newsletters option on MW Preference Center
     Execute javascript  window.scrollTo(0,600)
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of subscription to After the Bell newsletters
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of Unsubscripton of After the Bell newsletters

#US-T434
Validate the MarketWatch Newsletter
  [Documentation]  This test case validates the Europe Daily
  [Tags]  Regression  TagED
     CommonFunctionality.Start Market Watch Newsletter
     DefinedKeywords.Market Watch Sign In Process
     Set Selenium Implicit Wait  20
     MarketWatchAlertsPage.Validate Newsletters option on MW Preference Center
     MarketWatchAlertsPage.Click Newsletters option on MW Preference Center
     Execute javascript  window.scrollTo(0,600)
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of subscription to Europe Daily newsletters
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of Unsubscription to Europe Daily newsletters

#US-T435
Validate the MarketWatch Newsletter
  [Documentation]  This test case validates the Tech Daily
  [Tags]  Regression  TagTD
     CommonFunctionality.Start Market Watch Newsletter
     DefinedKeywords.Market Watch Sign In Process
     Set Selenium Implicit Wait  20
     MarketWatchAlertsPage.Validate Newsletters option on MW Preference Center
     MarketWatchAlertsPage.Click Newsletters option on MW Preference Center
     Execute javascript  window.scrollTo(0,600)
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of subscription to Tech Daily newsletters
     Set Selenium Implicit Wait  10
     MarketWatchAlertsPage.Validation of Unsubscription to Tech Daily newsletters

#US-T122
Validate the MW real-time author notification
    [Documentation]  This test case validates the MW real-time author notification
    [Tags]  Regression  Notifications  Author  Follow11
    MarketWatchMailboxPage.Navigate Mailbox page
    MarketWatchMailboxPage.Login
    MarketWatchMailboxPage.Select Inbox
    MarketWatchMailboxPage.Search Your MW real-time author notification
    MarketWatchMailboxPage.Validate MW real-time author notification

#US-T146
Validate the MW real-time company notification
    [Documentation]  This test case validates the MW real-time company notification
    [Tags]  Regression  Notifications  Company  real
    MarketWatchMailboxPage.Navigate Mailbox page
    MarketWatchMailboxPage.Login
    MarketWatchMailboxPage.Select Inbox
    MarketWatchMailboxPage.Search Your MW real-time company notification
    MarketWatchMailboxPage.Validate MW real-time company notification

#US-T356
Validate Postback on Preference Center
    [Documentation]  This test case validates the MW Postback on Preference Center
    [Tags]  Regression  Postback  356
    MarketWatchPreferenceCenterPage.Add Breaking News By Hotlink
    DefinedKeywords.Sign In Process
    MarketWatchPreferenceCenterPage.Validate Followed Breaking News
#    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
#    Run Keyword If  ${val2} > 0  MarketWatchPreferenceCenterPage.Click Following Toggle Alert Pop up
#    MarketWatchPreferenceCenterPage.Validate Breaking News Toggle Feature
#    MarketWatchPreferenceCenterPage.Click Breaking News Toggle Feature  #--unsubscribe functionality
#    MarketWatchPreferenceCenterPage.Validate Following Toggle Alert Pop up
#    MarketWatchPreferenceCenterPage.Click Following Toggle Alert Pop up
#    MarketWatchPreferenceCenterPage.Validate Over Mouse On Notification Tooltip
    MarketWatchMailboxPage.Navigate Mailbox page
    MarketWatchMailboxPage.Login
    MarketWatchMailboxPage.Select Inbox
    MarketWatchMailboxPage.Search Your MW real-time company notification for Postback
    MarketWatchMailboxPage.Validate MW real-time company notification for Postback
    #MarketWatchMailboxPage.Unsubscribe the mails
    #MarketWatchMailboxPage.Verify the mail is unsubscribed
    #MarketWatchPreferenceCenterPage.Add Company By Hotlink