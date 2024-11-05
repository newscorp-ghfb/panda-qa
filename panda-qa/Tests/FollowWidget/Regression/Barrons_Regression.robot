*** Settings ***
Documentation  Barrons Regression Tests
Force Tags  Barrons
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/BarronsArticlePage.robot
Resource  ../../../Resources/PageObjects/BarronsNewslettersPage.robot
Resource  ../../../Resources/PageObjects/BarronsWatchlistPage.robot
Resource  ../../../Resources/PageObjects/BarronsQuotesPage.robot
Resource  ../../../Resources/PageObjects/BarronsMarketDataPage.robot
Resource  ../../../Resources/PageObjects/BarronsAuthorsPage.robot
Resource  ../../../Resources/PageObjects/BarronsPreferenceCenterPage.robot
Resource  ../../../Resources/PageObjects/BarronsCapabilitiesPage.robot
Resource  ../../../Resources/PageObjects/BarronsCMSPage.robot
Resource  ../../../Resources/PageObjects/BarronsMailboxPage.robot
Resource  ../../../Resources/PageObjects/BarronsCreateArticlePage.robot
Resource  ../../../Resources/PageObjects/BarronsStockScreenerPage.robot

Library  SeleniumLibrary


Test Setup  CommonFunctionality.Start Barrons Article
#Test Setup  CommonFunctionality.Start Barrons Newsletter
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***
${table_locator}=  document.querySelector("#root > div > div:nth-child(1) > div > div:nth-child(9) > div.style--grid--2cXhDDnR.BarronsTheme--grid--2JEpTORq > div > div > div.style--grid--2cXhDDnR.style--padding-right--1PeddZD_.BarronsTheme--grid--2JEpTORq.BarronsTheme--homepage-row--9sIyDEGs.BarronsTheme--padding-right--2Cpz1W7R.base--padding-right--3Qqhq68s > div.style--column--2u7yywNS.style--column-top--2wtJOJkr.style--column-8--1yL3Jdqd.style--column--37Q00wRx.style--column-top--3XcIEFYc.style--column-8--UsTcXRw2.style--homepage-column--2gYPzDCd > div:nth-child(1) > div > div > div.BarronsTheme--positionRelative--2XlCjejz > div > div > dj-watchlist").shadowRoot.querySelector("div > table")

*** Test Cases ***
#US-T58
#US-T57
#US-T55
#US-T56
Validate the multiple authors follow button from articles page
    [Documentation]  This test case validates the multiple authors follow button from articles page
    [Tags]  Regression  Follow  MultipleAuthors  Article   BarronsMultipleauthors   TagBAF

    Set Selenium Speed  0.5 seconds
    DefinedKeywords.Barrons Article Sign in Process
    Set Selenium Implicit Wait  50s
    BarronsArticlePage.Validate author on article page


#US-T477
Validate the Barrons Preference Center page
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Regression  PreferenceCenter  477
    CommonFunctionality.Start Barrons Newsletter
    DefinedKeywords.Barrons Newsletter Sign in Process
    BarronsNewslettersPage.Click Watchlist Button
    BarronsNewslettersPage.Barrons Signout Process
    BarronsNewslettersPage.Validate watchlist is present

#US-T467
Validate the Barrons Preference Center page watchlist logout
    [Documentation]  This test case validates the barrons preference center page Logout
    [Tags]  Regression  PreferenceCenter  TagBN
    CommonFunctionality.Start Barrons Newsletter
    DefinedKeywords.Barrons Newsletter Sign in Process
    BarronsNewslettersPage.Click Watchlist Button
    BarronsNewslettersPage.Barrons Signout Process
    BarronsNewslettersPage.Validate watchlist is present

#US-T82
#US-T80
#US-T81
Validate the Barrons Preference Center page
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Regression  PreferenceCenter  TagBFCP

    BarronsPreferenceCenterPage.Add Author By Hotlink
    DefinedKeywords.Sign In Process
    BarronsPreferenceCenterPage.Validate Followed Authors
    ${val}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val} > 0  BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
    BarronsPreferenceCenterPage.Validate Author Name
    BarronsPreferenceCenterPage.Validate Following Toggle Feature
    BarronsPreferenceCenterPage.Validate Following Frequency
    BarronsPreferenceCenterPage.Validate All Tabs Displayed
    BarronsPreferenceCenterPage.Validate Author On All Tab
    BarronsPreferenceCenterPage.Add Company By Hotlink
#    BarronsPreferenceCenterPage.Validate Followed Companies
#    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
#    Run Keyword If  ${val2} > 0  BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
#    BarronsPreferenceCenterPage.Validate Company Frequency
#    BarronsPreferenceCenterPage.Validate Company Quote Link
#    BarronsPreferenceCenterPage.Validate Company On All Tab
#    BarronsPreferenceCenterPage.Click Barrons tab
#    BarronsPreferenceCenterPage.Validate Company Toggle Feature
#    BarronsPreferenceCenterPage.Click Company Toggle Feature
#    BarronsPreferenceCenterPage.Validate Following Toggle Alert Pop up
#    BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
#    BarronsPreferenceCenterPage.Click Barrons tab
#    BarronsPreferenceCenterPage.Validate Company Quote Link Not exists


#US-T26
Validate Authors for Barrons Article page without byline
    [Documentation]  This test case validates authors without byline for barrons article page
    [Tags]  Regression  Author  Article    Follow1

    CommonFunctionality.Start Barrons Article without byline
    BarronsArticlePage.Validate author without byline

#US-T215
#US-T216
#US-T217
Validate the Watchlist widget from Watchlist page
    [Documentation]  This test case validates the watchlist widget from watchlist page
    [Tags]  Regression  Watchlist      215

    CommonFunctionality.Start Barrons for Watchlist page
    DefinedKeywords.Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    BarronsWatchlistPage.Validate Watchlist Page
    BarronsWatchlistPage.Click Add Symbol Input
    BarronsWatchlistPage.Type Symbol
    BarronsWatchlistPage.Select Symbol
    BarronsWatchlistPage.Validate Symbol in Default New Watchlist
    BarronsWatchlistPage.Create Watchlist Name
    BarronsWatchlistPage.Edit Watchlist Name
    BarronsWatchlistPage.Type Symbol
    BarronsWatchlistPage.Select Symbol
    BarronsWatchlistPage.Validate Symbol in Created Watchlist
    BarronsWatchlistPage.Sort Symbols
    BarronsWatchlistPage.Delete Watchlists
    #BarronsWatchlistPage.Validate Default New Watchlist
    #BarronsWatchlistPage.Validate No Symbol in Default New Watchlist

#US-T468
Validate the Watchlist widget from Watchlist
    [Documentation]  This test case validates the watchlist widget from watchlist page
    [Tags]  Regression  Watchlist      468

    CommonFunctionality.Start Barrons for Watchlist page
    DefinedKeywords.Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    BarronsWatchlistPage.Validate Watchlist Page
    BarronsWatchlistPage.Click Add Symbol Input
    BarronsWatchlistPage.Type Symbol
    BarronsWatchlistPage.Select Symbol
    BarronsWatchlistPage.Create Watchlist Name
    BarronsWatchlistPage.Edit Watchlist Name
    BarronsWatchlistPage.Type Symbol
    BarronsWatchlistPage.Select Symbol
    BarronsWatchlistPage.Validate Symbol in Created Watchlist
    #BarronsWatchlistPage.Sort Symbols
    #BarronsWatchlistPage.Delete Watchlists
    #BarronsWatchlistPage.Validate Default New Watchlist
    #BarronsWatchlistPage.Validate No Symbol in Default New Watchlist

#US-T469
Validate the Watchlist widget from Watchlist
    [Documentation]  This test case validates the watchlist widget from watchlist page
    [Tags]  Regression  Watchlist      469

    CommonFunctionality.Start Barrons for Watchlist page
    DefinedKeywords.Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    BarronsWatchlistPage.Validate Watchlist Page
    BarronsWatchlistPage.Click Add Symbol Input
    BarronsWatchlistPage.Type Symbol
    BarronsWatchlistPage.Select Symbol
    BarronsWatchlistPage.Create Watchlist Name
    BarronsWatchlistPage.Edit Watchlist Name
    BarronsWatchlistPage.Type Symbol
    BarronsWatchlistPage.Select Symbol
    BarronsWatchlistPage.Validate Symbol in Created Watchlist
    BarronsWatchlistPage.Sort Symbols

#US-3892
Validate the Watchlist widget from Watchlist
    [Documentation]  This test case validates the watchlist widget xZfrom watchlist page
    [Tags]  Regression  Watchlist  TagSPW

    CommonFunctionality.Start Barrons Stock Picks
    DefinedKeywords.Barrons Stock Pick Sign In Process
    Set Selenium Speed  0.5 seconds
    Execute javascript  window.scrollTo(0,500)
    BarronsWatchlistPage.Click Search



#US-T248
#US-T249
#US-T250
Validate the Watchlist widget from Quotes page
    [Documentation]  This test case validates the watchlist widget from quotes page
    [Tags]  Regression  Watchlist  QuotesPage     250

    CommonFunctionality.Start Barrons for Quotes page
    DefinedKeywords.Barrons Quote Page Sign in Process
    Set Selenium Implicit Wait  10 seconds
    BarronsQuotesPage.Validate Quote Page
#    BarronsQuotesPage.Delete Watchlist
    # BarronsQuotesPage.Validate Watchlist for non-logged user
    #BarronsQuotesPage.Delete Watchlist
    #BarronsQuotesPage.Validate Create Button

#US-T384
Verify if a user is able to login into Barrons Stock Screener and access the Featured Preset Screeners without any subscription for free review.
    [Documentation]  This test case validates that a user is able to login into Barrons Stock Screener and access the Featured Preset Screeners without any subscription for free review.
        [Tags]  Barrons StockScreener Page              384

    CommonFunctionality.Start Barrons Stock Screener Page for Featured Preset Screener
    Set Selenium Speed  0.25 seconds
    DefinedKeywords.Barrons Stock Screener Sign in Process
    Set Selenium Speed  0.50 seconds
    Capture Page Screenshot    screenshot.png
    BarronsStockScreenerPage.Barron's 400 Top Performers
    BarronsStockScreenerPage.Barron's All Screeners Option

#US-T385
Verify if a user is able to navigate to Barrons Stock Screener and subscribe in order to edit the list of featured preset screens.
    [Documentation]  This test case validates that a user is able to subscribe and login into Barrons Stock Screener in order to edit the list of featured preset screens.
    [Tags]  Barrons StockScreener Page      385

    CommonFunctionality.Start Barrons Stock Screener Page for Featured Preset Screener
    Set Selenium Speed  0.2 seconds
    DefinedKeywords.Barrons Stock Screener Sign in Process
    Set Selenium Implicit Wait  35 seconds
    BarronsStockScreenerPage.Barron's Stock Test02 Screen Button
    Set Selenium Speed  15 seconds
    Execute javascript  window.scrollTo(0,500)
    BarronsStockScreenerPage.Click on Edit Screen Name Option
#    BarronsStockScreenerPage.Barron's Stocks Market Capitalization Index Value
    BarronsStockScreenerPage.Click on Show Results Button
    BarronsStockScreenerPage.Click on Save Screen Option
#    BarronsStockScreenerPage.Barron's Exchange Option
#    Set Selenium Speed  10 seconds
#    BarronsStockScreenerPage.Barron's Index option
#    BarronsStockScreenerPage.Barron's Sector & Industry Option
#    BarronsStockScreenerPage.Barron's Stock Screener Sector&Industry Dropdown Menu Option
#    BarronsStockScreenerPage.Barron's Sector & Industry as Farming Option
#    BarronsStockScreenerPage.Barron's Market Capitalization Option
#    BarronsStockScreenerPage.Barron's Annual Dividend Yield Option
#    BarronsStockScreenerPage.Select Annual Divident Yield Minimum Value
#    BarronsStockScreenerPage.Select Annual Dividend Yield Maximum Value
#    BarronsStockScreenerPage.Click on Show Results Button
#    BarronsStockScreenerPage.Click on All Screener Option


#US-T125
#US-T129
#US-T130
Validate the Watchlist widget from Market Data page
    [Documentation]  This test case validates the watchlist widget from market data page
    [Tags]  Regression  Watchlist  MarketdataPage   US-T125

    CommonFunctionality.Start Barrons for Market Data page
    BarronsMarketDataPage.Validate Watchlist for non-logged user
    BarronsMarketDataPage.Watchlist Sign In
    DefinedKeywords.Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    BarronsMarketDataPage.Validate Market Data Page
    #BarronsMarketDataPage.Click Create Button
    #BarronsMarketDataPage.Type Watchlist Name
    #BarronsMarketDataPage.Type Symbol
    #BarronsMarketDataPage.Select Symbol
    #BarronsMarketDataPage.Validate Symbol in the New Watchlist
    #BarronsMarketDataPage.Save Watchlist Changes
    #BarronsMarketDataPage.Create Watchlist With Add
    #arronsMarketDataPage.Type Watchlist Name
    #BarronsMarketDataPage.Save Watchlist Changes
    #BarronsMarketDataPage.Edit Watchlist Name
    #BarronsMarketDataPage.Save Watchlist Changes
    #BarronsMarketDataPage.Type Symbol
    #BarronsMarketDataPage.Select Symbol
    #BarronsMarketDataPage.Save Watchlist Changes
    #BarronsMarketDataPage.Delete Watchlist
    #BarronsMarketDataPage.Delete Watchlist
#    BarronsMarketDataPage.Validate Create Button

#US-T136
Validate the Barrons digest notification
    [Documentation]  This test case validates the Barrons digest notification
    [Tags]  Regression  Notifications             digest
    BarronsMailboxPage.Navigate Mailbox page
    BarronsMailboxPage.Login
    BarronsMailboxPage.Select Inbox
    BarronsMailboxPage.Search Your Daily Digest from Barron's
    BarronsMailboxPage.Validate Barron's Digest notification

#US-T119
Validate the Barrons real-time author notification
    [Documentation]  This test case validates the Barrons real-time author notification
    [Tags]  Regression  Notifications  Author  Follow1
    BarronsMailboxPage.Navigate Mailbox page
    BarronsMailboxPage.Login
    BarronsMailboxPage.Select Inbox
    BarronsMailboxPage.Search Your Barrons real-time author notification
    BarronsMailboxPage.Validate Barrons real-time author notification

#US-T137
Validate the Barrons real-time company notification
    [Documentation]  This test case validates the Barrons real-time company notification
    [Tags]  Regression  Notifications  Company  137
    BarronsMailboxPage.Navigate Mailbox page
    BarronsMailboxPage.Login
    BarronsMailboxPage.Select Inbox
    BarronsMailboxPage.Search Your Barrons real-time company notification
    BarronsMailboxPage.Validate Barrons real-time company notification

#US-T139
Validate the Barrons real-time stock picks notification
    [Documentation]  This test case validates the Barrons real-time stock picks notification
    [Tags]  Regression  Notifications  CustomTopic   139
    BarronsMailboxPage.Navigate Mailbox page
    BarronsMailboxPage.Login
    BarronsMailboxPage.Select Inbox
    BarronsMailboxPage.Search Your Barrons real-time stock picks notification
    BarronsMailboxPage.Validate Barrons real-time stock picks notification

#US T357
Validate Postback on Preference Center
    [Documentation]  This test case validates the Barrons Postback on Preference Center
    [Tags]  Regression  Postback                Follow1
    BarronsPreferenceCenterPage.Add Breaking News By Hotlink
    DefinedKeywords.Sign In Process
    BarronsPreferenceCenterPage.Validate Followed Breaking News
#    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
#    Run Keyword If  ${val2} > 0  BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
#    BarronsPreferenceCenterPage.Validate Breaking News Toggle Feature
#    BarronsPreferenceCenterPage.Click Breaking News Toggle Feature  #--unsubscribe functionality
#    BarronsPreferenceCenterPage.Validate Following Toggle Alert Pop up
#    BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
#    BarronsPreferenceCenterPage.Validate Over Mouse On Notification Tooltip
    BarronsMailboxPage.Navigate Mailbox page
    BarronsMailboxPage.Login
    BarronsMailboxPage.Select Inbox
    BarronsMailboxPage.Search Barrons real-time company notification for Postback
    BarronsMailboxPage.Validate Barrons real-time company notification for Postback
#    BarronsMailboxPage.Unsubscribe the mails
#    BarronsPreferenceCenterPage.Add Company By Hotlink



