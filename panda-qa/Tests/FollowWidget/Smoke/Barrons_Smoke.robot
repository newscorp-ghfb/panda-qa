99*** Settings ***
Documentation  Barrons Smoke Tests
Force Tags  Barrons  Smoke  TagBarrons
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/BarronsArticlePage.robot
Resource  ../../../Resources/PageObjects/BarronsAuthorsPage.robot
Resource  ../../../Resources/PageObjects/BarronsPreferenceCenterPage.robot


Test Setup  CommonFunctionality.Start Barrons Article
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***

*** Test Cases ***
#US-T188
#US-T4
#US-T3
#US-T1
#US-T2
Validate the author follow button from articles page
    [Documentation]  This test case validates the author follow button from articles page
    [Tags]  Smoke  Follow  Article     TagBarronsAF

    Set Selenium Speed  0.5 seconds
    DefinedKeywords.Barrons Article Sign in Process
    Set Selenium Implicit Wait  40
    Execute javascript  window.scrollTo(0,500)
    Set Selenium Implicit Wait  60
    Execute javascript  window.scrollTo(0,500)
    BarronsArticlePage.Validate Follow Button
    BarronsArticlePage.Click Follow Button
    Set Selenium Implicit Wait  40
    BarronsArticlePage.Validate Following Button
    Set Selenium Speed  0.2 seconds
    IF  "${Env}" == "dev"
        Set Selenium Speed  0.5 seconds
    BarronsArticlePage.Click Following Button
    END
#    BarronsArticlePage.Click Preference Center link
#    BarronsPreferenceCenterPage.Validate Preference Center page
#US-T188
#US-T34
#US-T33
#US-T31
#US-T32
Validate the follow button from authors page
    [Documentation]  This test case validates the follow button from authors page
    [Tags]  Smoke  Follow  Author   TagBarronsFA

    Set Selenium Speed  0.5 seconds
    BarronsArticlePage.Validate author hyperlink
    BarronsArticlePage.Click author hyperlink
    #IF  "${Env}" == "dev"
        #BarronsArticlePage.Click author hyperlink
    #END
    BarronsAuthorsPage.Validate Authors Page
    BarronsArticlePage.Validate Follow Button
    BarronsArticlePage.Click Follow Button

#US-T54
#US-T53
#US-T52
#US-T51
Validate the stock pick follow button from articles page
    [Documentation]  This test case validates the stock pick follow button from articles page
    [Tags]  Smoke  Follow  CustomTopic        TagBarronsSP
    CommonFunctionality.Start Barrons Stock Picks for Stock Picks in article
    DefinedKeywords.Barrons Article Sign in Process
    Set Selenium Implicit Wait  40
    Execute javascript  window.scrollTo(0,500)
    Set Selenium Implicit Wait  30
    BarronsArticlePage.Validate Stock Pick Follow Button
    BarronsArticlePage.Click Stock Pick Follow Button
    Set Selenium Speed  0.5 seconds
    BarronsArticlePage.Validate Stock Pick Following Button
    BarronsArticlePage.Click Stock Pick Following Button

#US-T188
#US-T79
#US-T253
#US-T254
Validate the Barrons Preference Center page
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Smoke  PreferenceCenter              TagBarronsPFS
    Set Selenium Speed  0.2 seconds
    BarronsPreferenceCenterPage.Navigate Preference Center page
    DefinedKeywords.Sign In Process
    BarronsPreferenceCenterPage.Validate Followed Authors
    BarronsPreferenceCenterPage.Validate Following Toggle Feature
    BarronsPreferenceCenterPage.Click Following Toggle Feature
    BarronsPreferenceCenterPage.Validate Following Toggle Alert Pop up
    BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
    BarronsPreferenceCenterPage.Add Author By Hotlink
    BarronsPreferenceCenterPage.Validate Following Toggle Alert Pop up
    BarronsPreferenceCenterPage.Click Following Toggle Alert Pop up
    Set Selenium Implicit Wait  30
    BarronsPreferenceCenterPage.Validate Author Name




#US-T126
#US-T127
#US-T128
#US-T135
Validate the stock pick follow button from stock pick page
    [Documentation]  This test case validates the stock pick follow button from stock pick page
    [Tags]  Smoke  Follow  CustomTopic  US-T126

    CommonFunctionality.Start Barrons Stock Picks for Stock Picks breadcrumb
    DefinedKeywords.Barrons Stock Pick Sign In Process
    Set Selenium Implicit Wait  40
   # Execute javascript  window.scrollTo(0,500)
    #Set Selenium Implicit Wait  30
    #BarronsArticlePage.Validate Custom Topic Stock Pick Follow Button
   # BarronsArticlePage.Click Custom Topic Stock Pick Follow Button
    #Set Selenium Speed  0.2 seconds
    #BarronsArticlePage.Validate Custom Topic Stock Pick UnFollow Button
    #BarronsArticlePage.Click Custom Topic Stock Pick UnFollow Button
