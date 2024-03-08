*** Settings ***
Documentation  WSJ Regression Tests
Force Tags  WSJ
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/WSJArticlePage.robot
Resource  ../../../Resources/PageObjects/WSJNewslettersPage.robot
Resource  ../../../Resources/PageObjects/WSJWatchlistPage.robot
Resource  ../../../Resources/PageObjects/WSJAuthorsPage.robot
Resource  ../../../Resources/PageObjects/WSJCMSPage.robot
Resource  ../../../Resources/PageObjects/WSJInflationPage.robot
Resource  ../../../Resources/PageObjects/WSJMailboxPage.robot
Resource  ../../../Resources/PageObjects/WSJPreferenceCenterPage.robot

Test Setup  CommonFunctionality.Start WSJ Article
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***

*** Test Cases ***
#US-T78
#US-T77
#US-T76
#US-T75
Validate the multiple authors follow button from articles page
    [Documentation]  This test case validates the multiple authors follow button from articles page
    [Tags]  Regression  Author  Follow  Article       TagWSMA

    WSJArticlePage.Validate Follow Button
    WSJArticlePage.Click Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    DefinedKeywords.Sign In Process
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Following Button
    WSJArticlePage.Click Follow Button 2
    WSJArticlePage.Validate Following Button 2
    WSJArticlePage.Click Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Following Button
    WSJArticlePage.Click Following Button 2
    WSJrticlePage.Click Undo Link 2
    WSJArticlePage.Validate Following Button 2
    WSJPreferenceCenterPage.Navigate Preference Center page
    WSJPreferenceCenterPage.Validate Preference Center page
    WSJPreferenceCenterPage.Validate Author 1
    WSJPreferenceCenterPage.Validate Author 2


#US-T91
#US-T98
#US-T99
#US-T229
Validate the WSJ Preference Center page
    [Documentation]  This test case validates the WSJ preference center page
    [Tags]  Regression  PreferenceCenter  TagWPF

    WSJPreferenceCenterPage.Add Author By Hotlink
    DefinedKeywords.Sign In Process
    WSJPreferenceCenterPage.Validate Followed Authors
    ${val}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val} > 0  WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Validate Author Name
    WSJPreferenceCenterPage.Validate Following Toggle Feature
    WSJPreferenceCenterPage.Validate Following Frequency
    WSJPreferenceCenterPage.Validate All Tabs Displayed
    WSJPreferenceCenterPage.Validate Author On All Tab
    WSJPreferenceCenterPage.Add Company By Hotlink
    WSJPreferenceCenterPage.Validate Followed Companies
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Validate Company Frequency
    WSJPreferenceCenterPage.Validate Company Quote Link
    WSJPreferenceCenterPage.Validate Company On All Tab
    WSJPreferenceCenterPage.Click WSJ tab
    WSJPreferenceCenterPage.Validate Company Toggle Feature
    WSJPreferenceCenterPage.Click Company Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Add Breaking News By Hotlink
    WSJPreferenceCenterPage.Validate Followed Breaking News
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Validate Breaking News On All Tab
    WSJPreferenceCenterPage.Click WSJ tab
    WSJPreferenceCenterPage.Validate Breaking News Toggle Feature
    WSJPreferenceCenterPage.Click Breaking News Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    #WSJPreferenceCenterPage.Navigate Article page
    #WSJArticlePage.Scroll stories


#US-T30
Validate Authors for WSJ Article page without byline
    [Documentation]  This test case validates authors without byline for WSJ article page
    [Tags]  Regression  Article  Author    TagWAB

    CommonFunctionality.Start WSJ Article without byline
    WSJArticlePage.Validate author without byline

#US-T183
#US-T182
#US-T180
#US-T181
Validate the follow button for Letters breadcrumb from articles page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Regression  Follow  Breadcrumb  Article
    CommonFunctionality.Start WSJ Article for Letters breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page
#US-T183
#US-T182
#US-T180
#US-T181
Validate the WSJ Preference Center page for Letters breadcrumb
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Regression  PreferenceCenter  Breadcrumb

    Set Selenium Speed  0.2 seconds
    WSJPreferenceCenterPage.Navigate Preference Center page
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    WSJPreferenceCenterPage.Validate Followed Custom Topics
    WSJPreferenceCenterPage.Validate Custom Topics Following Toggle Feature
    WSJPreferenceCenterPage.Click Letters Following Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Navigate Letters Article page
    Set Selenium Speed  0.4 seconds
    WSJArticlePage.Validate Custom Follow Button

#US-T175
#US-T174
#US-T172
#US-T173
Validate the follow button for Editorials breadcrumb from articles page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Regression  Breadcrumb  Follow  Article
    CommonFunctionality.Start WSJ Article for Editorials breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page
#US-T175
#US-T174
#US-T172
#US-T173
Validate the WSJ Preference Center page for Editorials breadcrumb
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Regression  PreferenceCenter  Breadcrumb

    Set Selenium Speed  0.2 seconds
    WSJPreferenceCenterPage.Navigate Preference Center page
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    WSJPreferenceCenterPage.Validate Followed Custom Topics
    WSJPreferenceCenterPage.Validate Custom Topics Following Toggle Feature
    WSJPreferenceCenterPage.Click Editorials Following Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Navigate Editorials Article page
    Set Selenium Speed  0.4 seconds
    WSJArticlePage.Validate Custom Follow Button

#US-T179
#US-T178
#US-T176
#US-T177
Validate the follow button for Commentary breadcrumb from articles page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Regression  Follow  Breadcrumb  Article
    CommonFunctionality.Start WSJ Article for Commentary breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page
#US-T179
#US-T178
#US-T176
#US-T177
Validate the WSJ Preference Center page for Commentary breadcrumb
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Regression  PreferenceCenter  Breadcrumb

    Set Selenium Speed  0.2 seconds
    WSJPreferenceCenterPage.Navigate Preference Center page
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    WSJPreferenceCenterPage.Validate Followed Custom Topics
    WSJPreferenceCenterPage.Validate Custom Topics Following Toggle Feature
    WSJPreferenceCenterPage.Click Commentary Following Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Navigate Commentary Article page
    Set Selenium Speed  0.4 seconds
    WSJArticlePage.Validate Custom Follow Button
#US-T164
#US-T165
#US-T166
#US-T167
Validate the follow button for Commentary breadcrumb from Commentary page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Regression  Follow  Breadcrumb  Commentarypage
    CommonFunctionality.Start WSJ Commentary for Commentary breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.25 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T160
#US-T161
#US-T162
#US-T163
Validate the follow button for Editorials breadcrumb from Editorials page
    [Documentation]  This test case validates the follow button from Editorials page
    [Tags]  Regression  Follow  Breadcrumb
    CommonFunctionality.Start WSJ Editorials for Editorials breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.25 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page
#US-T168
#US-T169
#US-T170
#US-T171
Validate the follow button for Letters breadcrumb from Letters page
    [Documentation]  This test case validates the follow button from Letters page
    [Tags]  Regression  Follow  Breadcrumb
    CommonFunctionality.Start WSJ Letters for Letters breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.05 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page


#US-T131
#US-T132
#US-T133
#US-T134
Validate the follow button for Elections breadcrumb from Elections page
    [Documentation]  This test case validates the follow button from Elections page
    [Tags]  Regression  Follow  Breadcrumb
    CommonFunctionality.Start WSJ Elections for Elections breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.25 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T131
#US-T132
#US-T133
#US-T134
Validate the WSJ Preference Center page for Elections breadcrumb
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Regression  PreferenceCenter  Breadcrumb

    Set Selenium Speed  0.2 seconds
    WSJPreferenceCenterPage.Navigate Preference Center page
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    WSJPreferenceCenterPage.Validate Followed Custom Topics
    WSJPreferenceCenterPage.Validate Custom Topics Following Toggle Feature
    WSJPreferenceCenterPage.Click Elections Following Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Navigate Elections Article page
    Set Selenium Speed  0.4 seconds
    WSJArticlePage.Validate Custom Follow Button

#US-T233
#US-T232
#US-T231
#US-T230
Validate the follow button for Elections breadcrumb from articles page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Regression  Follow  Breadcrumb  Article
    CommonFunctionality.Start WSJ Article for Elections breadcrumb
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Follow Button
    #WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Validate Custom Following Button
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T221
#US-T222
#US-T223
Validate the Watchlist widget from Watchlist page
    [Documentation]  This test case validates the watchlist widget from watchlist page
    [Tags]  Regression  Watchlist   TagWWP

    CommonFunctionality.Start WSJ for Watchlist page
    DefinedKeywords.Sign In Process
    Set Selenium Speed  0.5 seconds
    Capture Page Screenshot    screenshot.png
    WSJWatchlistPage.Validate Watchlist Page
    WSJWatchlistPage.Validate Default New Watchlist
    WSJWatchlistPage.Click Add Symbol Input
    WSJWatchlistPage.Type Symbol
    WSJWatchlistPage.Select Symbol
    WSJWatchlistPage.Validate Symbol in Default New Watchlist
    WSJWatchlistPage.Create Watchlist Name
    WSJWatchlistPage.Edit Watchlist Name
    WSJWatchlistPage.Type Symbol
    WSJWatchlistPage.Select Symbol
    WSJWatchlistPage.Validate Symbol in Created Watchlist
    WSJWatchlistPage.Sort Symbols
    WSJWatchlistPage.Delete Watchlists
    WSJWatchlistPage.Validate Default New Watchlist
    WSJWatchlistPage.Validate No Symbol in Default New Watchlist

#US-T268
#US-T269
#US-T270
#US-T271
Validate the alert button for Board Pack Exclusive from articles page
    [Documentation]  This test case validates the alert button for Board Pack Exclusive from articles pag
    [Tags]  Regression Alerts  CustomTopic  Article
    CommonFunctionality.Start WSJ Article for Board Pack Exclusive
    #WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Board Pack Exclusive Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Board Pack Exclusive Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T153
Validate the WSJ digest notification
    [Documentation]  This test case validates the WSJ digest notification
    [Tags]  Regression  Notifications
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your Daily Digest from WSJ
    WSJMailboxPage.Validate WSJ Digest notification

#US-T124
Validate the WSJ real-time author notification
    [Documentation]  This test case validates the WSJ real-time author notification
    [Tags]  Regression  Notifications  Author
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your WSJ real-time author notification
    WSJMailboxPage.Validate WSJ real-time author notification

#US-T154
Validate the WSJ real-time company notification
    [Documentation]  This test case validates the WSJ real-time company notification
    [Tags]  Regression  Notifications  Company           TagWCN
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your WSJ real-time company notification
    WSJMailboxPage.Validate WSJ real-time company notification

#US-T143
Validate the WSJ real-time custom topic notification
    [Documentation]  This test case validates the WSJ real-time custom topic notification
    [Tags]  Regression  Notifications  CustomTopic
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your WSJ real-time custom topic notification
    WSJMailboxPage.Validate WSJ real-time custom topic notification


#US-T252
Validate the WSJ real-time custom topic video notification
    [Documentation]  This test case validates the WSJ real-time custom topic video notification
    [Tags]  Regression  Notifications  CustomTopic
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your WSJ real-time custom topic video notification
    WSJMailboxPage.Validate WSJ real-time custom topic video notification


#US-T251
Validate the WSJ real-time author video notification
    [Documentation]  This test case validates the WSJ real-time author video notification
    [Tags]  Regression  Notifications  Author
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your WSJ real-time author video notification
    WSJMailboxPage.Validate WSJ real-time author video notification


#US-T312
Validate the WSJ real-time campaign notification
    [Documentation]  This test case validates the WSJ real-time campaign notification
    [Tags]  Regression  Notifications             Tag WRCN
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search Your WSJ real-time campaign notification
    WSJMailboxPage.Validate WSJ real-time campaign notification

#US-T319
#US-T320
#US-T321
#US-T322
Validate the alert button for Education
    [Documentation]  This test case validates the alert button for Education
    [Tags]  Regression  Alerts    TagWOE
    CommonFunctionality.Start WSJ Article for Education
    WSJArticlePage.Click Education Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Education Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T323
#US-T324
#US-T325
#US-T326
Validate the alert button for heard on the street
    [Documentation]  This test case validates the alert button for heard on the street
    [Tags]  Regression  Alerts             TagWHS
    CommonFunctionality.Start WSJ Article for heard on the street
    DefinedKeywords.WSJ Sign In Process
    WSJArticlePage.Click heard on the street Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.WSJ Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.WSJ Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click heard on the street Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T327
#US-T328
#US-T329
#US-T330
Validate the alert button for On Wine
    [Documentation]  This test case validates the alert button for On Wine
    [Tags]  Regression  Alerts                 TagWOW
    CommonFunctionality.Start WSJ Article for On Wine
    WSJArticlePage.Click On Wine Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click On Wine Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T331
#US-T332
#US-T333
#US-T334
Validate the alert button for Personal Finance
    [Documentation]  This test case validates the alert button for Personal Finance
    [Tags]  Regression  Alerts
    CommonFunctionality.Start WSJ Article for Personal Finance
    WSJArticlePage.Click Personal Finance Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Personal Finance Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T335
#US-T336
#US-T337
#US-T338
Validate the alert button for Personal Technology
    [Documentation]  This test case validates the alert button for Personal Technology
    [Tags]  Regression  Alerts
    CommonFunctionality.Start WSJ Article for Personal Technology
    WSJArticlePage.Click Personal Technology Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Personal Technology Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T339
#US-T340
#US-T341
#US-T342
Validate the alert button for Puzzles
    [Documentation]  This test case validates the alert button for Puzzles
    [Tags]  Regression  Alerts               TagWPZ
    CommonFunctionality.Start WSJ Article for Puzzles
    IF  ${Env} == "prod"
        DefinedKeywords.New WSJ Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.New WSJ Sign In Process
    WSJArticlePage.Click Puzzles Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Puzzles Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T343
#US-T344
#US-T345
#US-T346
Validate the alert button for Energy
    [Documentation]  This test case validates the alert button for Energy
    [Tags]  Regression  Alerts
    CommonFunctionality.Start WSJ Article for Energy
    WSJArticlePage.Click Energy Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  ${Env} == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  ${Env} == "dev"
        DefinedKeywords.Sign In Process
    END
    Set Selenium Speed  0.2 seconds
    IF  ${Env} == "prod"
        Set Selenium Speed  0.2 seconds
    ELSE IF  ${Env} == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Energy Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Custom Following Button
    WSJArticlePage.Click Custom Following Button
    WSJArticlePage.Validate Custom Follow Button
    WSJArticlePage.Click Custom Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page

#US-T361
Validate Postback on Preference Center
    [Documentation]  This test case validates the WSJ Postback on Preference Center
    [Tags]  Regression  Postback            TagWPBC
    WSJPreferenceCenterPage.Add Breaking News By Hotlink
    DefinedKeywords.Sign In Process
    WSJPreferenceCenterPage.Validate Followed Breaking News
    ${val2}=  Get Element Count  //*[@id="root"]/div/div/div/div[3]/div/div/button
    Run Keyword If  ${val2} > 0  WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Validate Breaking News Toggle Feature
    WSJPreferenceCenterPage.Click Breaking News Toggle Feature  #--unsubscribe functionality
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Validate Over Mouse On Notification Tooltip
    WSJMailboxPage.Navigate Mailbox page
    WSJMailboxPage.Login
    WSJMailboxPage.Select Inbox
    WSJMailboxPage.Search WSJ real-time author notification for Postback
    WSJMailboxPage.Validate WSJ real-time author notification for Postback
    WSJMailboxPage.Unsubscribe the mails
    WSJMailboxPage.Verify the mail is unsubscribed
    WSJPreferenceCenterPage.Add Author By Hotlink
