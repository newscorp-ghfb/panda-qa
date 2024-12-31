*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***
${JSSignInButtonWSJPath}=  document.querySelector("body > div:nth-child(37) > ufc-portal > ufc-signin-modal").shadowRoot.querySelector("div > div.modal > focus-trap > div.footer > ufc-button > button")
#${JSWSJPostbackSigninPath}=  document.querySelector("body > div:nth-child(36) > ufc-portal > ufc-signin-modal").shadowRoot.querySelector("div > div.modal > focus-trap > div.footer > ufc-button > button")
${JSFollowAuthorButtonWSJPath}=  document.querySelector("#__next > div > main > div.article-container.css-11dgf.e1wkb4h46 > article > div.crawler.css-j6808u.e1noyqgz9 > div.eui4bu22.css-hb9xd5 > div > div > div > div.css-1mfi1zu > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")
${EXPECTED_COLOR}=  rgb(235, 235, 236)
${ELEMENT}=  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[2]/div[1]/div[3]/div[1]/div[2]/ufc-delivery-pref-dropdown

*** Keywords ***
Validate the Selection color
    ${bg_color}=    Get Element Attribute    ${ELEMENT}    style
    Should Contain    ${bg_color}    background-color: ${EXPECTED_COLOR}

Validate the follow function for AI alerts prod
     IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts?alert=section&id=tech%2Fai
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=section&id=tech%2Fai
    END

Navigate to the Sections&Topics Prod
    Wait Until Element is Visible  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[1]/div[2]/nav/ul/li[4]/button/span
    Click Element  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[1]/div[2]/nav/ul/li[4]/button/span

Validate Preference Center page
    Page Should Contain  Follow Alerts

Navigate Sign in logo
    Wait Until Element is Visible  //*[contains(text(), 'Jonathan')]    #//*[@id="headlessui-popover-button-:r12:"]
    Click Element  //*[contains(text(), 'Jonathan')]  #//*[@id="headlessui-popover-button-:r12:"]

Click Email & Alerts
    Wait Until Element is Visible  //*[contains(text(), 'Emails')]    #//*[@id="headlessui-popover-panel-:r15:"]/div/ul/li[8]/a/span  10s
    Click Element  //*[contains(text(), 'Emails')]    #//*[@id="headlessui-popover-panel-:r15:"]/div/ul/li[8]/a/span  10s

Navigate Author page prod env
    Wait Until Element is Visible  //*[@id="__next"]/div[2]/div/div[1]/div[1]/div[2]/nav/ul/li[2]/button  10s
    #Page Should Contain Element  //*[@id="__next"]/div[2]/div/div[1]/div[1]/div[2]/nav/ul/li[2]/button
    Click Element  //*[@id="__next"]/div[2]/div/div[1]/div[1]/div[2]/nav/ul/li[2]/button

Navigate Author Secetion Prod Env
    Click Element  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[1]/div[2]/nav/ul/li[2]/button

Click Author option
    Click Element  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[2]/div[1]/div[3]/div[1]/div[2]/ufc-delivery-pref-dropdown

Navigate Preference Center page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts
    END

Navigate Newsletters Page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/newsletters
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/newsletters
    END

Navigate Article page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/articles/mass-vaccination-sites-for-covid-19-are-back-11641646804
    END

Navigate Letters Article page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/articles/mary-eberstadt-furman-university-wsj-scott-yenor-campus-protest-speech-869ce29b
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/articles/mass-vaccination-sites-for-covid-19-are-back-11641646804
    END
Navigate Editorials Article page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/articles/chicago-mayor-wisconsin-supreme-court-election-paul-vallas-brandon-johnson-janet-protasiewicz-dan-kelly-3673d166
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/articles/mass-vaccination-sites-for-covid-19-are-back-11641646804
    END
Navigate Commentary Article page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/articles/medicare-drug-price-controls-will-make-america-sicker-research-innovation-negotiations-private-insurers-b503b4ba
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/articles/mass-vaccination-sites-for-covid-19-are-back-11641646804
    END
Navigate Elections Article page
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/articles/kyrsten-sinema-joe-manchin-fail-to-attract-small-donors-for-potential-re-election-campaigns-d77506e7
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/articles/mass-vaccination-sites-for-covid-19-are-back-11641646804
    END

Validate Followed Authors
    Page Should Contain  Authors

Validate Sign in for Followed Custom Topics
    Page Should Contain  Sections and Topics

Validate Following Toggle Feature
    Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div

Validate Custom Topics Following Toggle Feature
    Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[3]/div
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[2]/tbody/tr[1]/td[3]/div

Click Following Toggle Feature
    IF  "${Env}" == "prod"
        Click Element  //*[text()="John West"]/../../../../td[4]/div
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="Joanna Stern"]/../../../../td[4]/div
    END

Click Letters Following Toggle Feature
    IF  "${Env}" == "prod"
        Click Element  //*[text()="Opinion: Letters to the Editor"]/../td[4]/div
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="Joanna Stern"]/../../../../td[4]/div
    END

Click WSJ Preference Center Sign In Button
       Click Button  dom:${JSSignInButtonWSJPath}

Validate WSJ Author Follow Button for Commentary Page
    Page Should Contain  dom:${JSFollowAuthorButtonWSJPath}

Click WSJ Author Follow Button for Commentary Page
       Click Button  dom:${JSFollowAuthorButtonWSJPath}

Click Editorials Following Toggle Feature
    IF  "${Env}" == "prod"
        Click Element  //*[text()="Opinion: Editorials"]/../td[4]/div
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="Jennifer Levitz"]/../../../../td[4]/div
    END

Click Commentary Following Toggle Feature
    IF  "${Env}" == "prod"
        Click Element  //*[text()="Opinion: Commentary"]/../td[4]/div
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="Joanna Stern"]/../../../../td[4]/div
    END

Validate WSJ New Preference Center Sign In Button
   Wait Until Element is Visible  //html/body/div[3]/footer/div[1]/div[1]/div/ul/li[3]/div/span[2]/a

Click WSJ New Preference Center Sign In Button
   Click Element  //html/body/div[3]/footer/div[1]/div[1]/div/ul/li[3]/div/span[2]/a

Click Elections Following Toggle Feature
    IF  "${Env}" == "prod"
        Click Element  //*[text()="U.S. Elections"]/../td[4]/div
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[text()="Jennifer Levitz"]/../../../../td[4]/div
    END

Validate Following Toggle Alert Pop up
    Page Should Contain Element  //*[@id="root"]/div[1]/div/div/div/div/div/div/table[1]/tbody/tr/td[4]/div/div  #//*[@id="root"/div/div/div/div[3]/div/span

Click Following Toggle Alert Pop up
    Click Button  //*[@id="root"]/div[1]/div/div/div/div/div/div/table[1]/tbody/tr/td[4]/div/div

Validate Author Updates From Preference Center Reflected In Articles
    Click Button  //*[@id="root"]/div/div/div/div[2]/div/div

Add Author By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/follow?alert=author&id=7872
        Go To  https://www.wsj.com/follow?alert=author&id=8736
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/follow?alert=author&id=7872
    END

Navigate Author Secetion
    Page Should Contain Element  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[1]/div[2]/nav/ul/li[2]/button
    Click Element  //*[@id="__next"]/div[2]/div/div[2]/main/div[2]/div/div[1]/div[2]/nav/ul/li[2]/button

Validate Author Name
    Page Should Contain  Joanna Stern

Validate Following Frequency
    Page Should Contain Element  //html/body/div[1]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr/td[4]/div/div[1]  #div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[2]/div/label[1]/span[2]
    Page Should Contain Element  //html/body/div[1]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr/td[4]/div/div[1]  #//*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[2]/div/label[2]/span[2]

Validate All Tabs Displayed
    Page Should Contain  Barron's
    Page Should Contain  FN London
    Page Should Contain  Mansion Global
    Page Should Contain  MarketWatch
    Page Should Contain  PE News
    Page Should Contain  WSJ
    Page Should Contain  View All

Validate Author On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[3]/div/ul/li[7]
    Page should contain element  //*[@id="author-card"]/div/div[3]/div/ufc-follow-author-widget//ufc-follow-widget/ufc-follow-button
    Page Should Contain  Joanna Stern

Add Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=AMZCOM  #https://www.dev.wsj.com/follow?alert=company&fcode=AMZCOM
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=AMZCOM  #https://www.dev.wsj.com/follow?alert=company&fcode=AMZCOM
    END

Add Company GE By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts?alert=company&fcode=GNELC&frequency=realtime  #https://www.dev.wsj.com/follow?alert=company&fcode=AMZCOM
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=GNELC&frequency=realtime  #https://www.dev.wsj.com/follow?alert=company&fcode=AMZCOM
    END

Add Tesla Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI&frequency=realtime  #https://www.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    END

Add Personal Finance Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts?alert=section&id=personal-finance  #https://www.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=section&id=personal-finance  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    END

Add Education Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts?alert=section&id=us-news/education  #https://www.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=section&id=us-news/education #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    END

Add Energy Company By Hotlink
    IF  "${Env}" == "prod"
        Go To   https://www.wsj.com/preference-center/alerts?alert=section&id=business/energy-oil  #https://www.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=section&id=business/energy-oil  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    END

Add Personal Technology Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/preference-center/alerts?alert=section&id=personal-finance  #https://www.wsj.com/preference-center/alerts?alert=company&fcode=TESLMI  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=section&id=personal-finance  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    END

Add Facebook Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=ONLNFR  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=ONLNFR  #https://www.dev.wsj.com/follow?alert=company&fcode=TESLMI&frequency=realtime
    END

Add Goldman Sachs Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=GLDMNS
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/preference-center/alerts?alert=company&fcode=GLDMNS
    END

Validate Followed Companies
    Page Should Contain  Companies

Validate Company Frequency
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[3]/tbody/tr[1]/td[2]/div/label[1]/span[2]
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[3]/tbody/tr[1]/td[2]/div/label[2]/span[2]

Validate Company Quote Link
    Page Should Contain Element  //a[text()="Amazon.com, Inc."]

Validate Company On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[7]
    Page Should Contain Element  //*[text()="Amazon.com, Inc."]/../*[text()="The Wall Street Journal"]

Validate Breaking News On All Tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[7]
    Page Should Contain Element  //*[text()="Technology"]/../*[text()="The Wall Street Journal"]

Click WSJ tab
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/ul/li[6]

Validate Company Toggle Feature
    Wait Until Element is Visible  //*[text()="Amazon.com, Inc."]/../../..//*[@role="switch"]
    Page Should Contain Element  //*[text()="Amazon.com, Inc."]/../../..//*[@role="switch"]

Validate Breaking News Toggle Feature
    Wait Until Element is Visible  //*[text()="Technology"]/../../..//*[@role="switch"]
    Page Should Contain Element  //*[text()="Technology"]/../../..//*[@role="switch"]

Click Company Toggle Feature
    Click Element  //*[text()="Amazon.com, Inc."]/../../..//*[@role="switch"]

Click Breaking News Toggle Feature
    Click Element  //*[text()="Technology"]/../../..//*[@role="switch"]

Add Legacy Company By Hotlink
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/follow?alert=company&fcode=AMZCOM
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/follow?alert=company&fcode=AMZCOM
    END

Add Breaking News By Hotlink
    Go To  https://www.dev.wsj.com/preference-center/alerts?alert=news_alert&id=NewsAlertEmailTechnology  #https://www.dev.wsj.com/follow?alert=news_alert&id=NewsAlertEmailTechnology

Validate Followed Breaking News
    Page Should Contain  NEWS ALERTS

Validate Sign in for Postback
    Page Should Contain Element  //*[text()='Sign In']

Click Sign In Button for Postback
  Click Element  //*[text()='Sign In']

Validate Over Mouse On Notification Tooltip
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/thead/tr/th[3]/div/button/span
    Page Should Contain  Choose whether you want to receive alerts as soon as an article gets published or once a day as a digest.
