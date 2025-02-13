*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***
${JSLogInSailthruPath}=  document.querySelector("body > div.page-wrap > header > div > div.cta-wrap > a.cta.log-in.desktop-only")  #1

${JSSailthruSignInButtonPath}=  document.querySelector("body > div > main > section > div > div > div > div > div > form > div.c60ff0df8 > button")  #1

${JSSailthruUsersButtonPath}=  //html/body/div[3]/div/div[2]/div[5]/a/div  #document.querySelector("#sidebar_item_user > div")  #document.querySelector("#header_nav_links > li:nth-child(3)")

${JSSailthruUsersLookupButtonPath}=  //html/body/div[3]/div/div[2]/div[5]/div/a[1]/div[2]  #document.querySelector("#analytics_sidebar > div:nth-child(5) > div > a:nth-child(1) > div.sidebar_subnav_item_title.analytics_sidebar")

${JSSailthruUsersSearchPath}=  //html/body/div[3]/div/div[2]/section/div[3]/div[2]/button  #document.querySelector("#userprofile > div.mw6.center > div.mt4 > button")

${JSCustomFieldsPath}=  //html/body/div[3]/div/div[2]/section/div[3]/div[1]/ul/li[4]  #document.querySelector("#userprofile > div.legacy-components-Tabs-src---Tabs-tabs--2m_wY > div.legacy-components-Tabs-src---Tabs-tabs-navigation-container--21xrU > ul > li:nth-child(4)")

#${JSEditAuthorArrayPath}=  document.querySelector("#userprofile > div.legacy-components-Tabs-src---Tabs-tabs--2m_wY > div.legacy-components-Tabs-src---Tabs-tab-content--GUDSN > div.legacy-components-Tabs-src---Tabs-tab-panel-active--2qyFC > table > tbody > tr:nth-child(1) > td:nth-child(3) > div > table > tbody > tr > td > div.hover-overlay.pr2.absolute.top-0.right-0.bottom-0.h-100.f4.flex.items-center.invisible.stui-bg-gray-i > div:nth-child(2) > i")

${JSEditAuthorsArrayButton}=  //html/body/div[3]/div/div[2]/section/div[3]/div[2]/div[4]/table/tbody/tr[1]/td[3]/div/table/tbody/tr/td/div[2]/div[2]/i

${JSEditAuthorArrayListSaveButton}=   //*[@id="modalApplyButton"]

${JSWSJSignInWithGoogleButton}=   //*[@id="socialbtn-google-wrapper"]/button/span

*** Keywords ***
Validate SailthruLogIn Button
    Wait Until Element is Visible ${JSLogInSailthruPath}
    Wait Until Element Contains  ${JSLogInSailthruPath}  Follow  timeout=15
    Element Text Should Be  ${JSLogInSailthruPath}  Follow  timeout=15

Validate SailthruSignIn Button
    Wait Until Element is Visible  ${JSSailthruSignInButtonPath}   timeout=15
    Wait Until Element Contains  ${JSSailthruSignInButtonPath}  Follow  timeout=15
    Element Text Should Be  ${JSSailthruSignInButtonPath}  Follow  timeout=15

Click SailthruLogIn Button
    Click Button  ${JSLogInSailthruPath}

Click SailthruSignIn Button
    Click Button  ${JSSailthruSignInButtonPath}     timeout=15

Click SailthruUsers Button
     Click Button  //html/body/div[3]/div/div[2]/div[5]/a/div  #document.querySelector("#sidebar_item_user > div")  #document.querySelector("#header_nav_links > li:nth-child(3)")

Click Sailthru UsersLookup Button
      Click Button  //html/body/div[3]/div/div[2]/div[5]/div/a[1]/div[2]  #document.querySelector("#analytics_sidebar > div:nth-child(5) > div > a:nth-child(1) > div.sidebar_subnav_item_title.analytics_sidebar")

Click Sailthru UsersSearchField Path
      Click Button  //input[@type='text']
      Input Text  //input[@type='text']  QABARRONSONLY
      Wait Until Element is Visible  //html/body/div[3]/div/div[2]/section/div[3]/div[2]/button
      Click Button  //html/body/div[3]/div/div[2]/section/div[3]/div[2]/button

Click UsersCutomFields Path
      Wait Until Element is Visible  //html/body/div[3]/div/div[2]/section/div[3]/div[1]/ul/li[4]
      Click Button  //html/body/div[3]/div/div[2]/section/div[3]/div[1]/ul/li[4]

Click EditAuthorsArray Button
      Click Button  //html/body/div[3]/div/div[2]/section/div[3]/div[2]/div[4]/table/tbody/tr[1]/td[3]/div/table/tbody/tr/td/div[2]/div[2]/i

Click EditAuthorArrayListSave Button
      Click Button  //*[@id="modalApplyButton"]

Navigate to WSJ Preference Center page
    IF  "${Env}" == "dev"
        Go To  https://www.s.dev.wsj.com/
    Click WSJ Sign In With Google Button  dom:${JSWSJSignInWithGoogleButton}
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  QABARRONSONLY  #jansi.sasikumar@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="basic-login"]/div[1]/form/div[5]/div[1]/button[2]/span  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //input[@type='password']  password1  #AKpolarzx@2594  #VTdnnCgCnny100g61 #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="password-login"]/div/form/div[5]/button
     Open Browser  https://www.s.dev.wsj.com  ${Browser}  options=${options}
     Go To  https://www.dev.wsj.com/preference-center/alerts
    END