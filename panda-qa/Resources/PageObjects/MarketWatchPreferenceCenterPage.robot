*** Settings ***
Library  SeleniumLibrary
Resource    BarronsQuotesPage.robot
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***

*** Keywords ***
Validate Preference Center page
    Page Should Contain  Follow Alerts

Navigate Preference Center page
    IF  "${Env}" == "prod"
        Go To  https://www.marketwatch.com/follow
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.marketwatch.com/follow
    END

Navigate Article page
    IF  "${Env}" == "prod"
        Go To  https://www.marketwatch.com/story/is-the-u-s-stock-market-closed-on-juneteenth-what-investors-need-to-know-11655230158
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.marketwatch.com/story/lisa-bb-test-11645706835
    END

Validate Followed Authors
    Page Should Contain  Authors

Validate Following Toggle Feature
    #Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div   timeout=20s
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table/tbody/tr/td[3]/div
    Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[2]/div/div/div/table/tbody/tr/td[3]/div  timeout=45s

Click Following Toggle Feature
    #IF  "${Env}" == "prod"
        #Click Element  //*[text()="Steve Goldstein"]/../../../../td[4]/div
    #ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="William Davis"]/../../../../td[4]/div
    #END

Validate Following Toggle Alert Pop up
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[3]/div/div/button  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[1]/div/div/a

Click Following Toggle Alert Pop up
    Click Button  //*[@id="root"]/div/div/div/div[3]/div/div/button  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[1]/div/div/a  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table/thead/tr/th/div/button

Validate Author Updates From Preference Center Reflected In Articles
    Click Button  //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/button

Add Author By Hotlink
    Go To  https://www.s.dev.marketwatch.com/follow?alert=author&id=15_MW

Validate Author Name
    Page Should Contain  Jonathan Burton

Validate Following Frequency
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[4]/span
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[4]/span  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[4]/td[4]/div/div

Validate All Tabs Displayed
    Page Should Contain  Barron's
    Page Should Contain  FN London
    Page Should Contain  Mansion Global
    Page Should Contain  MarketWatch
    Page Should Contain  PE News
    Page Should Contain  WSJ
    Page Should Contain  View All

Validate Author On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[1]/div/div/a  #//*[@id="root"]/div/div/div/div[2]/div/ul/li[7]
    #Page Should Contain  Jonathan Burton

Add Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.marketwatch.com/follow?alert=company&fcode=AMZCOM
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.marketwatch.com/follow?alert=company&fcode=AMZCOM
    END


Validate Followed Companies
    Page Should Contain Element  //html/body/div[1]/div/div/div/div[2]/div/div/div/table[3]/thead/tr/th[1]

Validate Company Frequency
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[4]  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[2]/div/label[1]/span[2]
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[4]/span[1]  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[2]/div/label[2]/span[2][2]


Validate Company Quote Link
    Page Should Contain Element   //*[text()="Amazon.com, Inc."]

Validate Company On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[7]
    Page Should Contain Element  //*[text()="Amazon.com, Inc."]/../*[text()="MarketWatch"]

Click Market Watch tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[4]

Validate Company Toggle Feature
    Wait Until Element is Visible  //*[text()="Amazon.com, Inc."]/../../..//*[@role="switch"]
    Page Should Contain Element  //*[text()="Amazon.com, Inc."]/../../..//*[@role="switch"]

Click Company Toggle Feature
    Click Element  //*[text()="Amazon.com, Inc."]/../../..//*[@role="switch"]

Add Breaking News By Hotlink
     IF  "${Env}" == "prod"
        Go To  https://www.marketwatch.com/follow?alert=news_alert&id=NewsAlertEmailTechnology
        ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.marketwatch.com/follow?alert=news_alert&id=NewsAlertEmailTechnology
     END

Validate Followed Breaking News
    Scroll Down
    Page Should Contain  News Alerts

Validate Breaking News Toggle Feature
    Wait Until Element is Visible  //*[text()="Technology"]/../../..//*[@role="switch"]
    Page Should Contain Element  //*[text()="Technology"]/../../..//*[@role="switch"]

Click Breaking News Toggle Feature
    Click Element  //*[text()="Technology"]/../../..//*[@role="switch"]

Validate Over Mouse On Notification Tooltip
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/thead/tr/th[3]/div/button/span
    Page Should Contain  Choose whether you want to receive alerts as soon as an article gets published or once a day as a digest.
