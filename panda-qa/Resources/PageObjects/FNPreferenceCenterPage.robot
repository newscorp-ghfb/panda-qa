*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot
Resource    BarronsQuotesPage.robot

*** Variables ***

*** Keywords ***

Validate Preference Center page
    Page Should Contain  Follow Alerts

Navigate Preference Center page
    IF  "${Env}" == "prod"
        Go To  https://www.fnlondon.com/follow
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.fnlondon.com/follow
    END

Navigate Article page
    IF  "${Env}" == "prod"
        Go To  https://www.fnlondon.com/articles/complaints-commissioner-fca-transparency-20220615
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.fnlondon.com/articles/testpanda-test-wsj-digest-2-20211020
    END

Validate Followed Authors
    Page Should Contain  Authors

Validate Following Toggle Feature
    Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr/td[4]/div/div
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr/td[4]/div/div  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div

Click Following Toggle Feature
    IF  "${Env}" == "prod"
        Click Element  //*[text()="Paul Clarke"]/../../../../td[4]/div
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="Sunita Adhikarla"]/../../../../td[4]/div
    END

Validate Following Toggle Alert Pop up
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[3]/div/div/button

Click Following Toggle Alert Pop up
    Click Button  //*[@id="root"]/div/div/div/div[3]/div/div/button

Validate Author Updates From Preference Center Reflected In Articles
    Click Button  //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/button

Add Author By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.fnlondon.com/follow?alert=author&id=9004_FN&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.fnlondon.com/follow?alert=author&id=8680_FN&frequency=realtime
        Set Selenium Speed  0.5 seconds
    END

Validate Author Name
    IF  "${Env}" == "prod"
        Page Should Contain  Paul Clarke
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Sunita Adhikarla
    END

Validate Following Frequency
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[4]/div/div/div  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[2]/div/label[1]/span[2]
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[4]/div/div/div  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[2]/div/label[2]/span[2]

Validate All Tabs Displayed
    Page Should Contain  Barron's
    Page Should Contain  FN London
    Page Should Contain  Mansion Global
    Page Should Contain  MarketWatch
    Page Should Contain  PE News
    Page Should Contain  WSJ
    Page Should Contain  View All

Validate Author On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[7]
    IF  "${Env}" == "prod"
        Page Should Contain  Paul Clarke
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Sunita Adhikarla
    END

Add Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.fnlondon.com/follow?alert=company&fcode=AMZCOM
        Go To  https://www.fnlondon.com/follow?alert=company&fcode=BLAMAN
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.fnlondon.com/follow?alert=company&fcode=AMZCOM
        Go To  https://www.s.dev.fnlondon.com/follow?alert=company&fcode=BLAMAN
    END

Validate Followed Companies
    Page Should Contain  Companies

Validate Company Frequency
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[4]/span
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[4]/span

Validate Company Quote Link
    Page Should Contain Element  //a[text()="Amazon.com Inc."]

Validate Company On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[7]
    Page Should Contain Element  //*[text()="Amazon.com Inc."]

Click FN tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[2]

Validate Company Toggle Feature
    Wait Until Element is Visible  //*[text()="Amazon.com Inc."]/../../..//*[@role="switch"]
    Page Should Contain Element  //*[text()="Amazon.com Inc."]/../../..//*[@role="switch"]

Click Company Toggle Feature
    Click Element  //*[text()="Amazon.com Inc."]/../../..//*[@role="switch"]

Add Breaking News By Hotlink
     IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow?alert=news_alert&id=NewsAlertEmailTechnology
        ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.fnlondon.com/follow?alert=news_alert&id=NewsAlertEmailTechnology
     END

Validate FN Followed Breaking News
    Page Should Contain  News Alerts

Validate Breaking News Toggle Feature
    Wait Until Element is Visible  //*[text()="Technology"]/../../..//*[@role="switch"]
    Page Should Contain Element  //*[text()="Technology"]/../../..//*[@role="switch"]

Click Breaking News Toggle Feature
    Click Element  //*[text()="Technology"]/../../..//*[@role="switch"]

Validate Over Mouse On Notification Tooltip
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/thead/tr/th[3]/div/button/span
    Page Should Contain  Choose whether you want to receive alerts as soon as an article gets published or once a day as a digest.