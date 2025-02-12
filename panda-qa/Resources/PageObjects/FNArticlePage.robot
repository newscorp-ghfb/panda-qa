*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***
${JSFollowButtonFNPath}=  document.querySelector("#fn-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")  #document.querySelector("#fn-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")

${JSFollowingButtonFNPath}=  document.querySelector("#fn-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")

${JSUndoButtonFNPath}=  document.querySelector("#fn-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")

${JSPreferenceCenterLinkFNPath}=  document.querySelector('ufc-snackbar').shadowRoot  #1
    ...  .querySelector('div')  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('span')  #4
    ...  .querySelector('a')  #5

${JSFollowSignInButtonPath}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.modal')  #4
    ...  .querySelector('div.footer')  #5
    ...  .querySelector('ufc-button').shadowRoot  #6
    ...  .querySelector('button')  #7

${JSFollowSignInButton2Path}=  document.querySelector('ufc-signin-modal[isopen]')  #1
    ...  .shadowRoot.querySelector('div')  #2
    ...  .querySelector('div.modal')  #3
    ...  .querySelector('focus-trap')  #4
    ...  .querySelector('div.footer')  #5
    ...  .querySelector('ufc-button')  #6
    ...  .querySelector('button')  #7


${JSFollowSignInHeaderPath}=  document.querySelector("#fn_header > div > div > div > div > div:nth-child(1) > div.FinancialNewsTheme--header-wrapper-21uWacmaHS4kl0INshwy1D > div > header > div.FinancialNewsTheme--nav-container-GCn-Wz2pkb15qIzD52H5g > nav > div.FinancialNewsTheme--login-container-t_wwz1yXj1SjqfPPPf2JE > a.FinancialNewsTheme--login-button-3xVYhu15u78inI6hd0EEkd.typography--theinhardt-medium-tF2MBUPnY_4ois8rCBh0Y")

*** Keywords ***
Validate Follow Button
    Set Selenium Implicit Wait  10s
    Wait Until Element is Visible  /html/body/div[1]/layout/div[4]/div[1]/div[1]/div/div/div[2]/div/ufc-follow-author-widget    #dom:${JSFollowButtonFNPath}

Scroll Down
    Execute javascript  window.scrollTo(0,500)

Validate Following Button
    Wait Until Element is Visible  dom:${JSFollowingButtonFNPath}
    Wait Until Element Contains  dom:${JSFollowingButtonFNPath}  Following  timeout=15
    Element Text Should Be  dom:${JSFollowingButtonFNPath}  Following  timeout=15

Click Follow Button

    Click Button  /html/body/div[1]/layout/div[4]/div[1]/div[1]/div/div/div[2]/div/ufc-follow-author-widget   #dom:${JSFollowButtonFNPath}

Click Following Button
    Click Button  dom:${JSFollowingButtonFNPath}

Validate Sign In Modal
    Wait Until Element is Visible  //*[@id="__next"]/layout/div[2]/div[1]/div/header/div[1]/div[2]/div/div[2]/a[1]  #dom:${JSFollowSignInHeaderPath}
    Page Should Contain Element  //*[@id="__next"]/layout/div[2]/div[1]/div/header/div[1]/div[2]/div/div[2]/a[1]  #dom:${JSFollowSignInHeaderPath}

Click Sign In Button Modal
    Wait Until Element is Visible  //*[@id="__next"]/layout/div[2]/div[1]/div/header/div[1]/div[2]/div/div[2]/a[1]  20s
    Set Selenium Speed  0.4 seconds
    IF  "${Env}" == "prod"
       Click Element  //*[@id="__next"]/layout/div[2]/div[1]/div/header/div[1]/div[2]/div/div[2]/a[1]  #dom:${JSFollowSignInHeaderPath}
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[@id="__next"]/layout/div[2]/div[1]/div/header/div[1]/div[2]/div/div[2]/a[1]  #dom:${JSFollowSignInHeaderPath}
    END
    Set Selenium Speed  0.2 seconds

Click Undo Link
    Wait Until Element is Visible  dom:${JSUndoButtonFNPath}
    Click Button  dom:${JSUndoButtonFNPath}

Click Preference Center Link
    Wait Until Element is Visible  dom:${JSPreferenceCenterLinkFNPath}
    Click Element  dom:${JSPreferenceCenterLinkFNPath}

Validate author hyperlink
    Page Should Contain Element  //*[@id="fn-pre-body-article-wrap"]/div[3]/div/div/div/span/a

Validate author without byline
    IF  "${Env}" == "prod"
    Page Should Contain Element  //*[@id="__next"]/layout/div[4]/div[1]/div[1]/div/div/div[2]/p
    ELSE IF  "${Env}" == "dev"
    Page Should Contain Element  //*[@id="fn-article-wrap"]/div[2]/p[5]/strong/em/a
    END

Click author hyperlink
     IF  "${Env}" == "prod"
       Page Should Contain Element  //span[@class="css-1wc2zh5" and text()="Justin Cash"]
    ELSE IF  "${Env}" == "dev"
       Page Should Contain Element  //*[@id="fn-pre-body-article-wrap"]/div[3]/div/div/div/span/a
       END

Click author hyperlink new
    IF  "${Env}" == "prod"
       Click Element  //span[@class='css-1wc2zh5']
    ELSE IF  "${Env}" == "dev"
        Click Element  //a[@class="author-link"]
    END
    