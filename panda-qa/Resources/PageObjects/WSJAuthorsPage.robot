*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot
*** Variables ***
${JSFollowButtonWSJPath}=  document.querySelector("#author-card > div > div.style--ufc-wrapper--DdGJ5TQW > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")  #document.querySelector('ufc-follow-author-widget').shadowRoot  #1
   # ...  .querySelector('ufc-follow-button').shadowRoot  #2
  #  ...  .querySelector('button')  #3

*** Keywords ***
Validate Authors Page
    IF  "${Env}" == "prod"
        Page Should Contain  John West
    ELSE IF  "${Env}" == "dev"
        Page Should Contain  Dave Michaels
    END

Validate Follow Button
    Wait Until Element is Visible  dom:${JSFollowButtonWSJPath}
    Element Text Should Be  dom:${JSFollowButtonWSJPath}  Follow  timeout=30