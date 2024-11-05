*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${JSFollowButtonPENPath}=  document.querySelector("#pen-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")  #document.querySelector("#pen-pre-body-article-wrap > div.clearfix.byline-wrap > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")

${JSUndoButtonPENPath}=  document.querySelector('ufc-snackbar').shadowRoot  #1
    ...  .querySelector('div')  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('button')  #4

${JSPreferenceCenterLinkPENPath}=  document.querySelector('ufc-snackbar').shadowRoot  #1
    ...  .querySelector('div')  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('span')  #4
    ...  .querySelector('a')  #5

${JSFollowSignInButtonPath}=  document.querySelector('ufc-portal')
  ...  .querySelector('ufc-signin-modal').shadowRoot
 ...  .querySelector('div')
 ...  .querySelector('focus-trap')
 ...  .querySelector('div.footer')
 ...  .querySelector('button')


#document.querySelector('ufc-portal')  #1
  #  ...  .querySelector('ufc-signin-modal').shadowRoot  #2
   # ...  .querySelector('div')  #3
    #...  .querySelector('div.modal')  #4
  #  ...  .querySelector('div.footer')  #5
  #  ...  .querySelector('ufc-button').shadowRoot  #6
  #  ...  .querySelector('button.primary')  #7

${JSFollowSignInHeaderPath}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.body')  #4
    ...  .querySelector('p')  #5

*** Keywords ***
Validate Follow Button
    Execute javascript  window.scrollTo(0,500)
    Wait Until Element is Visible  dom:${JSFollowButtonPENPath}
   # Wait Until Element Contains  dom:${JSFollowButtonPENPath}  Follow  timeout=15
    #Element Text Should Be  dom:${JSFollowButtonPENPath}  Follow  timeout=30

Validate Following Button
    Wait Until Element is Visible  dom:${JSFollowButtonPENPath}
    Wait Until Element Contains  dom:${JSFollowButtonPENPath}  Following  timeout=15
    Element Text Should Be  dom:${JSFollowButtonPENPath}  Following  timeout=15

Click Follow Button
    Wait Until Element Contains  dom:${JSFollowButtonPENPath}  Follow  timeout=15
    Click Button  dom:${JSFollowButtonPENPath}

Click Following Button
    Wait Until Element Contains  dom:${JSFollowButtonPENPath}  Following  timeout=15
    Click Button  dom:${JSFollowButtonPENPath}
    Wait Until Element Contains  dom:${JSFollowButtonPENPath}  Follow  timeout=15

Validate Sign In Modal
    Wait Until Element is Visible  dom:${JSFollowSignInHeaderPath}
    Page Should Contain Element  dom:${JSFollowSignInHeaderPath}

Click Sign In Button Modal
    Wait Until Element is Visible  dom:${JSFollowSignInHeaderPath}
    Wait Until Element is Visible  dom:${JSFollowSignInButtonPath}
    Click Element  dom:${JSFollowSignInButtonPath}

Click Undo Link
    Wait Until Element is Visible  dom:${JSUndoButtonPENPath}
    Click Element  dom:${JSUndoButtonPENPath}

Click Preference Center Link
    Wait Until Element is Visible  dom:${JSPreferenceCenterLinkPENPath}
    Click Element  dom:${JSPreferenceCenterLinkPENPath}

Validate author hyperlink
    Page Should Contain Element  //*[@id="pen-pre-body-article-wrap"]/div[3]/div/div/span/a

Click author hyperlink
    Click Element  //*[@id="pen-pre-body-article-wrap"]/div[3]/div/div/span/a

Validate author without byline
    Page Should Contain Element  //div/div/div[3]/div/div/span/a    #//*[text()="Sunita Adhikarla"]

