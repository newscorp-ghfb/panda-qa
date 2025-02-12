*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***
${JSFollowButtonGMPath}=  document.querySelector("#mg-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")  #document.querySelector('ufc-follow-author-widget').shadowRoot  #1
    #...  .querySelector('ufc-follow-button').shadowRoot  #2
    #...  .querySelector('button')  #3
${signinmodal}=  document.querySelector("#mg-article > div:nth-child(40) > ufc-portal > ufc-freereg-signup-modal").shadowRoot.querySelector("div > div.ufc-freereg--modal > focus-trap > div > div.ufc-freereg--modal-body.ufc-freereg--modal-signin > p > a")
${JSUndoButtonGlobalMansionPath}=  document.querySelector("#mg-article > ufc-snackbar").shadowRoot.querySelector("div > div > button")

${JSFollowSignInButtonPath}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.modal')  #4
    ...  .querySelector('div.footer')  #5
    ...  .querySelector('ufc-button').shadowRoot  #6
    ...  .querySelector('button')  #7

${JSFollowSignInButton2Path}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.modal')  #4
    ...  .querySelector('focus-trap')  #5
    ...  .querySelector('div.footer')  #6
    ...  .querySelector('ufc-button')  #7
    ...  .querySelector('button')  #8

${JSFollowSignInHeaderPath}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.body')  #4
    ...  .querySelector('p')  #5

${JSPreferenceCenterLinkGlobalMansionPath}=  document.querySelector("#mg-article > ufc-snackbar").shadowRoot.querySelector("div > div > span > a")

*** Keywords ***
Validate Follow Button
    Wait Until Element is Visible  dom:${JSFollowButtonGMPath}
    Element Text Should Be  dom:${JSFollowButtonGMPath}  Follow  timeout=60s

Validate Following Button
    Wait Until Element is Visible  dom:${JSFollowButtonGMPath}
    Element Text Should Be  dom:${JSFollowButtonGMPath}  Follow  timeout=60s

Click Follow Button
    Click Button  dom:${JSFollowButtonGMPath}

Navigate to the homepage
    Go To   https://www.mansionglobal.com/articles/are-there-tax-breaks-on-agricultural-land-in-pennsylvania-01648119848
    #https://www.s.dev.mansionglobal.com/articles/article-long-text-01643043212

Click Following Button
    Click Button  dom:${JSFollowButtonGMPath}

Validate Sign In Modal
    Wait Until Element is Visible  //*[@id="header-wrapper"]/div[1]/div/div[3]/div/div/a  #dom:${JSFollowSignInHeaderPath}
    Page Should Contain Element  //*[@id="header-wrapper"]/div[1]/div/div[3]/div/div/a  #dom:${JSFollowSignInHeaderPath}

Click Sign In Button Modal
    Wait Until Element is Visible  //a[text()='SIGN IN']  #//*[@id="header-wrapper"]/div[1]/div/div[3]/div/div/a  #dom:${JSFollowSignInHeaderPath}
    IF  "${Env}" == "prod"
        Click Button  //a[text()='SIGN IN']  #//*[@id="header-wrapper"]/div[1]/div/div[3]/div/div/a  #dom:${JSFollowSignInButtonPath}
    ELSE IF  "${Env}" == "dev"
        Click Element  //a[text()='SIGN IN']  #//*[@id="header-wrapper"]/div[1]/div/div[3]/div/div/a  #dom:${JSFollowSignInButton2Path}
    END



Click Undo Link
    Wait Until Element is Visible  dom:${JSUndoButtonGlobalMansionPath}
    Click Button  dom:${JSUndoButtonGlobalMansionPath}
    Wait Until Element is Not Visible  dom:${JSUndoButtonGlobalMansionPath}

Click Preference Center Link
    Wait Until Element is Visible  dom:${JSPreferenceCenterLinkGlobalMansionPath}
    Click Element  dom:${JSPreferenceCenterLinkGlobalMansionPath}

Validate Author Label
    Wait Until Element is Visible  //*[@id="mg-pre-body-article-wrap"]/div[3]/div/div/strong
    Page Should Contain Element  //*[@id="mg-pre-body-article-wrap"]/div[3]/div/div/strong

Validate author without byline
    Page Should Contain Element  //div/div/strong[contains(., 'Mariana Nuñez')]
