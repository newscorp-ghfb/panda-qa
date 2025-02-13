*** Settings ***
Documentation  Mansion Global Smoke Tests
Force Tags  MansionGlobal    TagMansionGlobal


Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/MansionGlobalArticlePage.robot
Resource  ../../../Resources/PageObjects/MansionGlobalAuthorsPage.robot
Resource  ../../../Resources/PageObjects/MansionGlobalPreferenceCenterPage.robot


Test Setup  CommonFunctionality.Start Mansion Global Article
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***

*** Test Cases ***
#US-T186
#US-T9
#US-T10
#US-T11
#US-T12
Validate the follow button from articles page
    [Documentation]  These test cases validate the follow button from articles page
    [Tags]  Smoke  Follow  Article   MansionUS-T9

    CommonFunctionality.Start Mansion Global Article
    MansionGlobalArticlePage.Validate Follow Button
    MansionGlobalArticlePage.Click Follow Button
    MansionGlobalArticlePage.Navigate to the homepage
    MansionGlobalArticlePage.Validate Sign In Modal
    MansionGlobalArticlePage.Click Sign In Button Modal
    Set Selenium Implicit Wait  10
    DefinedKeywords.Mansion Global Sign In Process
    Set Selenium Speed  0.5 seconds
    Set Selenium Implicit Wait  40
    Execute javascript  window.scrollTo(0,500)
    MansionGlobalArticlePage.Validate Following Button
    MansionGlobalArticlePage.Click Following Button

#US-T186
Validate the Mansion Global Preference Center page
    [Documentation]  This test case validates the mansion global preference center page
    [Tags]  Smoke  PreferenceCenter    TagMGPF
    MansionGlobalPreferenceCenterPage.Navigate Preference Center page
    DefinedKeywords.Sign In Process
    MansionGlobalPreferenceCenterPage.Validate Followed Authors
    MansionGlobalPreferenceCenterPage.Validate Following Toggle Feature
    MansionGlobalPreferenceCenterPage.Click Following Toggle Feature
    Execute javascript  window.scrollTo(0,500)
    MansionGlobalPreferenceCenterPage.Validate Following Toggle Alert Pop up
    MansionGlobalPreferenceCenterPage.Click Following Toggle Alert Pop up
    MansionGlobalPreferenceCenterPage.Validate Following Toggle Feature
    MansionGlobalPreferenceCenterPage.Click Following Toggle Feature
