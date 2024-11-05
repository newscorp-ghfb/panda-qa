*** Settings ***
Library  SeleniumLibrary
Documentation  WSJ Smoke Tests
Force Tags  WSJ
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/DefinedKeywords.robot
Resource  ../../../Resources/PageObjects/WSJArticlePage.robot
Resource  ../../../Resources/PageObjects/WSJAuthorsPage.robot
Resource  ../../../Resources/PageObjects/WSJPreferenceCenterPage.robot

Test Setup  CommonFunctionality.Start WSJ Article
Test Teardown  CommonFunctionality.Finish Testcase
*** Variables ***

*** Test Cases ***
#US-T159
#US-T24
#US-T23
#US-T21
#US-T22
Validate the follow button from articles page
    [Documentation]  This test case validates the follow button from articles page
    [Tags]  Smoke  Follow  Article  21
    IF  "${Env}" == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  "${Env}" == "dev"
       DefinedKeywords.WSJ Sign In Process
        DefinedKeywords.Sign In Process
    END
    WSJArticlePage.Validate Follow Button
    WSJArticlePage.Click Follow Button
    WSJArticlePage.Validate Sign In Modal
    WSJArticlePage.Click Sign In Button Modal
    IF  "${Env}" == "prod"
        DefinedKeywords.Market Watch Sign In Process
    ELSE IF  "${Env}" == "dev"
        DefinedKeywords.Sign In Process
    END

    Set Selenium Speed  0.2 seconds
    WSJArticlePage.Scroll Down
    WSJArticlePage.Validate Following Button
    WSJArticlePage.Scroll Down
    IF  "${Env}" == "prod"
        Set Selenium Speed  0.1 seconds
    ELSE IF  "${Env}" == "dev"
        Set Selenium Speed  0.35 seconds
    END
    WSJArticlePage.Click Following Button
    WSJArticlePage.Click Undo Link
    WSJArticlePage.Validate Following Button
    WSJArticlePage.Click Following Button
    WSJArticlePage.Validate Follow Button
    WSJArticlePage.Click Follow Button
    WSJArticlePage.Click Preference Center link
    WSJPreferenceCenterPage.Validate Preference Center page
#US-T159
#US-T47
#US-T48
#US-T49
#US-T50

Validate the follow button from authors page
    [Documentation]  This test case validates the follow button from authors page
    [Tags]  Smoke  Follow  Authors  47

    WSJArticlePage.Validate author hyperlink
    WSJArticlePage.Click author hyperlink
    DefinedKeywords.Set Implicit Wait
    WSJAuthorsPage.Validate Authors Page
    #WSJAuthorsPage.Validate Follow Button
#US-T159
#US-T97
#US-T255
#US-T256
Validate the WSJ Preference Center page
    [Documentation]  This test case validates the barrons preference center page
    [Tags]  Smoke  PreferenceCenter   US-T97

    Set Selenium Speed  0.2 seconds
    WSJPreferenceCenterPage.Navigate Preference Center page
    #IF  "${Env}" == "prod"
        #DefinedKeywords.Market Watch Sign In Process
    #ELSE IF  "${Env}" == "dev"
        #DefinedKeywords.Sign In Process
    #END

    WSJPreferenceCenterPage.Validate Followed Authors
    WSJPreferenceCenterPage.Validate Following Toggle Feature
    WSJPreferenceCenterPage.Click Following Toggle Feature
    WSJPreferenceCenterPage.Validate Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Click Following Toggle Alert Pop up
    WSJPreferenceCenterPage.Navigate Article page
    DefinedKeywords.WSJ Sign In Process
    WSJArticlePage.Scroll Down
    Set Selenium Speed  0.4 seconds
    WSJArticlePage.Validate Follow Button
