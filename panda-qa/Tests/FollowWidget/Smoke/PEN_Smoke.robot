*** Settings ***
Documentation  PEN Smoke Tests
Force Tags  PENews
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/PENArticlePage.robot
Resource  ../../../Resources/PageObjects/PENAuthorsPage.robot
Resource  ../../../Resources/PageObjects/PENPreferenceCenterPage.robot


Test Setup  CommonFunctionality.Start PEN Article
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***

*** Test Cases ***
#US-T184
#US-T17
#US-T18
#US-T19
#US-T20
Validate the follow button from articles page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Smoke  Follow  Article   US-T17

    PENArticlePage.Validate Follow Button
    PENArticlePage.Click Follow Button
    Set Selenium Implicit Wait  20
    CommonFunctionality.Start PEN Article
    PENArticlePage.Validate Sign In Modal
    PENArticlePage.Click Sign In Button Modal
    DefinedKeywords.Sign In Process
    Set Selenium Implicit Wait  40
    Execute javascript  window.scrollTo(0,500)
    Set Selenium Implicit Wait  10
    PENArticlePage.Validate Following Button
    PENArticlePage.Click Following Button

#US-T184
#US-T43
#US-T44
#US-T45
#US-T46
Validate the follow button from authors page
    [Documentation]  This test case validates the follow button from authors page
    [Tags]  Smoke  Follow  Author         US-T43
    Execute javascript  window.scrollTo(0,500)
    PENArticlePage.Validate author hyperlink
    PENArticlePage.Click author hyperlink
    DefinedKeywords.Set Implicit Wait
    PENAuthorsPage.Validate Authors Page
    #PENArticlePage.Validate Follow Button

#US-T184
#US-T94
Validate the PEN Preference Center page
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Smoke  PreferenceCenter    US-T94

    PENPreferenceCenterPage.Navigate Preference Center page
    DefinedKeywords.Sign In Process
    PENPreferenceCenterPage.Add Author By Hotlink
    PENPreferenceCenterPage.Validate Followed Authors
    Set Selenium Speed  0.5 seconds
    PENPreferenceCenterPage.Validate Following Toggle Feature
    PENPreferenceCenterPage.Click Following Toggle Feature
    PENPreferenceCenterPage.Validate Following Toggle Feature
    PENPreferenceCenterPage.Click Following Toggle Feature
    Execute javascript  window.scrollTo(0,500)

