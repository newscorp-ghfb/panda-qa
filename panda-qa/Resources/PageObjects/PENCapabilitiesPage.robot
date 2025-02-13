*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot
Resource    PENCapabilitiesPage.robot

*** Variables ***
${JSFollowButtonBarronsPath}=  document.querySelector('ufc-follow-author-widget').shadowRoot  #1
    ...  .querySelector('ufc-follow-widget')  #2
    ...  .querySelector('ufc-follow-button').shadowRoot  #3
    ...  .querySelector('button')  #4


*** Keywords ***

Navigate Capabilities Dashboard page
    IF  "${Env}" == "prod"
        Go To  https://int-prod-capabilities-dashboard.vir.onservo.com/app
    ELSE IF  "${Env}" == "dev"
        Go To  https://int-int-capabilities-dashboard.vir-dev.onservo.com/app
    END

Click Login button
    IF  "${Env}" == "prod"
        Click Element    //*[@id="__next"]/div[1]/div/div
    ELSE IF  "${Env}" == "dev"
        Click Element    //*[@id="__next"]/div[1]/div/div
    END

Capabilities Dashboard Sign In Process
    Click Button    //input[@id='input28']
    Input Text  //input[@type='text']  newsroomdev.test.6@dowjones.com  #newsroomdev.test@dowjones.com  #akhilesh.khanduri@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //input[@type='password']   iFzp4wb8qJpnUeL   #B9oB6pTg4LO8obgDjsy6Gjj9vUE2fe
        #VTdnnCgCnny100g62    #AKpolarzx@2594  #68L91AbU?98&T-Ryk7h|c}Q:uX   #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    Set Selenium Implicit Wait  30s
    Wait Until Element Is Visible  //*[@id="input55"]   #//*[@id="password-login-password"]
    Input Text  //*[@id="input55"]  QA integration testing
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']

#Sign In Process
#    Wait Until Element Is Visible  //*[@type="password"]
#    Input Text  //*[@type="password"]  AKpolarszxi2594
#    Click Button    //input[@type='submit']
#    Sleep  30s

Click Author Tab
    Click Element  //*[@href="/app/follow/author/tab/dashboard"]/*[text()="Author"]
    Sleep    10s

Validate Author Page
         Page Should Contain  Dashboard
         Page Should Contain  Search
         Page Should Contain  All records

Validate Author tab
    Scroll Down
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[1]
        IF  "${Env}" == "prod"
            Page Should Contain  Andrew Bary
        ELSE IF  "${Env}" == "dev"
          Page Should Contain  Carleton English
      END
    Page Should Contain Element    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[3]/div/table/tbody/tr[2]/td[2]
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[2]
        IF  "${Env}" == "prod"
         Page Should Contain  Paul Clarke
        ELSE IF  "${Env}" == "dev"
         Page Should Contain  Sunita Adhikarla
     END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[3]
        IF "${Env}"  == "prod"
        Page Should Contain  Mansion Global Staff
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Mariana Nuñez
    END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[4]
     IF  "${Env}" == "prod"
        Page Should Contain  William Watts
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Angela Moore
    END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[5]
    IF  "${Env}" == "prod"
        Page Should Contain  Sebastian McCarthy
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Sunita Adhikarla
    END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[6]
    IF  "${Env}" == "prod"
        Page Should Contain  Joanna Stern
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Joanna Stern
    END

Generate Author Hotlink
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[5]
    Click Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[3]/div/table/tbody/tr[1]/td[1]/a
    Page Should Contain Element  //*[text()='About']
    Page Should Contain Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/h2[2]
    Page Should Contain Element  //*[text()='Generate Hotlink']
    Click Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/div[2]/button
    Click Element    //*[@id="penews"]
    Click Element    //*[@id="frequency_digest"]
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/div[2]/section/div/button
    Click Button    //*[@id="__next"]/div[3]/div/div/div[1]/div/button

Click Company Tab
    Click Element  //*[@href="/app/follow/company/tab/dashboard"]/*[text()="Company"]

Validate Company Page
         Page Should Contain  Dashboard
         Page Should Contain  Search
         Page Should Contain  All records

Validate Company tab
    Scroll Down
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[1]
    IF  "${Env}" == "prod"
        Page Should Contain  Amazon.com, Inc.
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Amazon Com Inc
    END
    Page Should Contain Element    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[3]/div/table/tbody/tr[2]/td[2]
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[2]
    IF  "${Env}" == "prod"
        Page Should Contain  BlackRock Inc.
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Blackrock Inc
    END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[3]
    IF  "${Env}" == "prod"
        Page Should Contain  Amazon.com, Inc.
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Amazon Com Inc
    END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[4]
    IF  "${Env}" == "prod"
        Page Should Contain  Amazon.com, Inc.
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Amazon Com Inc
    END
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[5]
    IF  "${Env}" == "prod"
        Page Should Contain  Apple Inc.
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Blackrock Inc
    END
    IF  "${Env}" == "dev"
        Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[6]
        Page Should Contain  Amazon Com Inc
    END

Generate Company Hotlink
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[2]/button[5]
    Click Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/section[2]/div[3]/div/table/tbody/tr[1]/td[1]/a
    Page Should Contain Element  //*[text()='Primary Region:']
    Page Should Contain Element  //*[text()='Code:']
    Page Should Contain Element  //*[text()='Generate Hotlink']
    Scroll Down
    Click Element   //*[@id="__next"]/div[3]/div/div/div[2]/div/div[3]/button
    Scroll Down
    Click Element   //*[@id="frequency_digest"]
    Scroll Down
    Click Element   //*[@id="__next"]/div[3]/div/div/div[2]/div/div[3]/div/div[1]/label[5]/div  #//input[@id="penews"]
    Click Button    //*[@id="__next"]/div[3]/div/div/div[2]/div/div[3]/section/div/button
    Click Button    //*[@id="__next"]/div[3]/div/div/div[1]/div/button

Click Custom Topic Tab
    Click Button  //*[@href="/app/follow/custom_topic/tab/dashboard"]/*[text()="Custom Topic"]

Click Industry Tab
    Click Button  //*[@href="/app/follow/industry/tab/dashboard"]/*[text()="Industry"]

Click Inflation Tab
    Click Button  //*[@href="/app/follow/inflation_basket/tab/dashboard"]/*[text()="Inflation"]

Click Real State Search Tab
    Click Button  //*[@href="/app/follow/real_estate_search/tab/dashboard"]/*[text()="Real Estate Search"]

Validate Following Button
    Wait Until Element is Visible  dom:${JSFollowButtonBarronsPath}
    Wait Until Element Contains  dom:${JSFollowButtonBarronsPath}  Following  timeout=15
    Element Text Should Be  dom:${JSFollowButtonBarronsPath}  Following  timeout=15

Validate Authors Reflected On Dashboard
    ${Totalauthorsubs} = Get Value  //*[text()="Total subscriptions"]/../div[2]
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow?alert=author&id=8572_BARRONS&frequency=realtime
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/follow?alert=author&id=8572_BARRONS&frequency=realtime
    END

    ${Totalauthorsubs2} = Get Value  //*[text()="Total subscriptions"]/../div[2]
    ${Totalauthorsubs2} == ${Totalauthorsubs} + 1
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/follow
    END
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  "${Env}" == "dev"
        Click Button  //*[@href="https://www.s.dev.barrons.com/authors/8572?mod=followUI"]/../../../../*/*[@role="switch"]
    END

Validate Authors On Search Tab
    Click Button  //*[text()='Search']
    Click Button  //*[@placeholder="Author name"]
    IF  "${Env}" == "prod"
        Input Text   //*[@placeholder="Author name"]  Mark Latham
        Click Element  //*[text()="Mark Latham"]
        Page Should Contain  Followers
    ELSE IF  "${Env}" == "dev"
        Input Text   //*[@placeholder="Author name"]  John Smith
        Click Element  //*[text()="John Smith"]
        Element Text Should Be  //*[text()="About"]/../h2[2]  2 Followers
    END
    Click Element  //*[@id="__next"]/div[3]/div/div/div[1]/div/button


Validate Follow Hotlink for Authors
    Click Author Tab
    Click Button  //*[text()='Follow Hotlinks']
    Click Button  //*[@placeholder="Author name"]
    Input Text   //*[@placeholder="Author name"]  John Smith
    Wait Until Element is Visible  //button[text()="Copy"]
    Click Button  //*[text()='All records']

Click on All records tab
    Click Element  //*[@id="__next"]/div[3]/div/div/div[1]/button[3]

Click on Author hyperlink from All records tab
    Sleep  10s
    Click Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[1]/a
    Sleep  10s
    Page Should Contain Element  //*[text()='About']
    Page Should Contain Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/h2[2]
    Page Should Contain Element  //*[text()='Generate Hotlink']

Click on Company hyperlink from All records tab
    Sleep  10s
    Click Element  //*[@id="__next"]/div[3]/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[1]/a
    Sleep  10s
    Page Should Contain Element  //*[text()='Address:']
    Page Should Contain Element  //*[text()='Code:']
    Page Should Contain Element  //*[text()='Generate Hotlink']

Validate Custom Topic On Dashboard
    Click Custom Topic Tab
    Element Text Should Be  //*[text()="Follow"]  Follow  timeout=15

Validate Company Reflected On Dashboard
    ${Totalauthorsubs} = Get Value  //*[text()="Total subscriptions"]/../div[2]
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow?alert=company&fcode=SGPM
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/follow?alert=company&fcode=SGPM
    END

    ${Totalauthorsubs2} = Get Value  //*[text()="Total subscriptions"]/../div[2]
    ${Totalauthorsubs2} == ${Totalauthorsubs} + 1
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/follow
    END
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  "${Env}" == "dev"
        Click Button  //*[@href="https://www.s.dev.barrons.com/market-data/stocks/eQSGO"]/../../../*/*[@role="switch"]
    END

Validate Company On Search Tab
    Click Button  //*[text()='Search']
    Click Button  //*[@placeholder="Company name"]
    Input Text   //*[@placeholder="Company name"]  Compagnie de Saint-Gobain SA
    IF  "${Env}" == "prod"
    Click Element  //*[text()="Compagnie de Saint-Gobain SA"]
    ELSE IF  "${Env}" == "dev"
    Click Element   //*[text()="Compagnie de Saint Gobain SA"]
    END
    Element Text Should Be  //*[text()="Aliases:"]/../../h2  1 Followers
    Click Element  //*[@id="__next"]/div[3]/div/div/div[1]/div/button

Validate Industry Reflected On Dashboard
    ${Totalauthorsubs} = Get Value  //*[text()="Total subscriptions"]/../div[2]
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow?alert=industry&fcode=indcera
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/follow?alert=industry&fcode=indcera
    END

    ${Totalauthorsubs2} = Get Value  //*[text()="Total subscriptions"]/../div[2]
    ${Totalauthorsubs2} == ${Totalauthorsubs} + 1
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/follow
    END
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  "${Env}" == "dev"
        Click Button  //*[text()="Industrial Ceramics"]/../../*/*[@role="switch"]
    END

Validate Industry On Search Tab
    Click Button  //*[text()='Search']
    Click Button  //*[@placeholder="Industry"]
    Input Text   //*[@placeholder="Industry"]  Indigestion Remedies
    Click Button  //*[text()="Indigestion Remedies"]
    Element Text Should Be  //*[text()="Aliases:"]/../../h2  0 Followers

Capabilities Dashboard PEN Menu
    Click Button  //*[text()="Private Equity News"]/../../a
    Wait Until Element Is Visible  //h1[text()="Private Equity News"]
    Wait Until Element Is Visible  //*[text()="Alert type:"]
    Wait Until Element Is Visible  //option[text()="All"]
    Wait Until Element Is Visible  //option[text()="Digest"]
    Wait Until Element Is Visible  //option[text()="Author"]
    Wait Until Element Is Visible  //option[text()="Company"]
    Wait Until Element Is Visible  //option[text()="Custom Topic"]
    Wait Until Element Is Visible  //option[text()="Industry"]
    Wait Until Element Is Visible  //option[text()="Inflation"]
    Wait Until Element Is Visible  //*[text()="From:"]
    Wait Until Element Is Visible  //*[text()="To:"]
    Wait Until Element Is Visible  //th[text()="Stats"]
    Wait Until Element Is Visible  //th[text()="Engagement"]
    Wait Until Element Is Visible  //span[text()="Product"]
    Wait Until Element Is Visible  //span[text()="Sent"]
    Wait Until Element Is Visible  //span[text()="Bounced"]
    Wait Until Element Is Visible  //span[text()="Bounced %"]
    Wait Until Element Is Visible  //span[text()="Clicked"]
    Wait Until Element Is Visible  //span[text()="Clicked %"]
    Wait Until Element Is Visible  //td[text()="Private Equity News"]
    IF  //td[text()="Private Equity News"]/../*[@data-label="Sent"] >= 0
        Log  Private Equity News Sent value is not null
    ELSE
        Log  Error on Private Equity News Sent value
    END
    IF  //td[text()="Private Equity News"]/../*[@data-label="Bounced"] >= 0
        Log  Private Equity News Bounced value is not null
    ELSE
        Log  Error on Private Equity News Bounced value
    END
    IF  //td[text()="Private Equity News"]/../*[@data-label="Clicked"] >= 0
        Log  Private Equity News Clicked value is not null
    ELSE
        Log  Error on Private Equity News Clicked value
    END
    Click Button  //button[text()="Message timeline"]
    Wait Until Element Is Visible  //*[text()="Alert type:"]
    Wait Until Element Is Visible  //*[text()="Status:"]
    Wait Until Element Is Visible  //*[text()="Num results:"]
    Wait Until Element Is Visible  //option[text()="All"]/../../*[@name="status"]
    Wait Until Element Is Visible  //option[text()="Delivered"]
    Wait Until Element Is Visible  //option[text()="Bounced"]
    Wait Until Element Is Visible  //option[text()="Spam"]
    Wait Until Element Is Visible  //option[text()="Digest"]
    Wait Until Element Is Visible  //option[text()="All"]/../../*[@name="alertType"]
    Wait Until Element Is Visible  //option[text()="Author"]
    Wait Until Element Is Visible  //option[text()="Company"]
    Wait Until Element Is Visible  //option[text()="Custom Topic"]
    Wait Until Element Is Visible  //option[text()="Industry"]
    Wait Until Element Is Visible  //option[text()="Inflation"]
    Wait Until Element Is Visible  //option[text()="200"]/../../*[@name="count"]
    Wait Until Element Is Visible  //option[text()="100"]
    Wait Until Element Is Visible  //option[text()="50"]
    IF  //tr[1]/td[5] >= 0
        Log  Private Equity Clicked value is not null
    ELSE
        Log  Error on Private Equity Clicked value
    END