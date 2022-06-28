*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***

*** Keywords ***

Validate Preference Center page
    Page Should Contain  Follow Alerts

Navigate Preference Center page
    IF  ${Env} == "prod"
        Go To  https://www.barrons.com/follow
    ELSE IF  ${Env} == "stg"
        Go To  https://www.stg.internal.barrons.com/follow
    ELSE IF  ${Env} == "dev"
        Go To  https://www.s.dev.barrons.com/follow
    END
Navigate Article page
    IF  ${Env} == "prod"
        Go To  https://www.barrons.com/articles/twitter-stock-pick-ceo-51638548530
    ELSE IF  ${Env} == "stg"
        Go To  https://www.stg.internal.barrons.com/articles/twitter-stock-pick-ceo-51638548530
    ELSE IF  ${Env} == "dev"
        Go To  https://www.s.dev.barrons.com/articles/twitter-stock-pick-ceo-51638548530
    END
Validate Followed Authors
    Page Should Contain  Authors

Validate Following Toggle Feature
    Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div

Click Following Toggle Feature
    Click Element  //*[@id="root"]/div/div/div/div[2]/div/div/div/table[1]/tbody/tr[1]/td[3]/div

Validate Following Toggle Alert Pop up
    Page Should Contain Element  //*[@id="root"]/div/div/div/div[3]/div/span

Click Following Toggle Alert Pop up
    Click Button  //*[@id="root"]/div/div/div/div[3]/div/div/button

Validate Author Updates From Preference Center Reflected In Articles
    Click Button  //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/button