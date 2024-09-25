*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${JSDeleteButtonMWPath}=  document.querySelector("#delete-alert-modal").shadowRoot.querySelector("ufc-modal > div > ufc-button:nth-child(1) > button")
${JSCloseButtonMWPath}=  document.querySelector("#edit-alert-modal > ufc-modal").shadowRoot.querySelector("div > div.modal > focus-trap > div.modal-header > button > ufc-icon")
*** Keywords ***
Validate Price and Volume Alert page
    Page Should Contain Element  //*[text()='Alerts']

Validate Newsletters option on MW Preference Center
    Wait Until Element is Visible  //*[@id='root']/div/div/div/div[1]/aside/nav/div[2]/ul/li[3]/a  #//html/body/div[2]/div/div/div/div[1]/aside/nav/div[2]/ul/li/[3]/a

Click Newsletters option on MW Preference Center
    Click Element  //*[@id='root']/div/div/div/div[1]/aside/nav/div[2]/ul/li[3]/a  #//html/body/div[2]/div/div/div/div[1]/aside/nav/div[2]/ul/li/[3]/a

Validation of subscription to Mutual Funds Weekly newsletters

  Wait Until Element is Visible  //*[@id="newsletter-card-container-704"]/div/div[2]/div/div/div[1]  #//html/body/div[2]/div/div/div/div[2]/div[1]/ufc-follow-newsletter-widget[3]
  Click Element  //*[@id="newsletter-card-container-704"]/div/div[2]/div/div/div[1]  #//html/body/div[2]/div/div/div/div[2]/div[1]/ufc-follow-newsletter-widget[3]  #//html/body/div[2]/div/div/div/div[2]/div[1]/ufc-follow-newsletter-widget[3]

Validation of Unsubscripton of Mutual Funds Weekly newsletters
  Wait Until Element is Visible  //*[@id='newsletter-card-container-704']/div/div[2]/div/div[2]/button[1]  #//*[@id="newsletter-card-container-704"]/div/div[2]/div/div/div[1]
  Click Element  //*[@id='newsletter-card-container-704']/div/div[2]/div/div[2]/button[1]
Click Edit option on Alerts page
    Click Element    //*[text()="Edit"]

Click Enter Volume threshold value
    Click Element  //html/body/div[2]/div[2]/div/div/div/ufc-edit-alert-modal/ufc-modal/form/ufc-alert-form/div[2]/div[1]/ufc-input/div/div/input

Click Save Alert Button
    Click Element  //*[text()="Save Alert"]

Click on Back Button
     Click Element  //*[text()="Back"]

Click on Delete Button
      Click Element  //*[text()="Delete"]

Validate Price and Volume Alerts
    Page Should Contain Element  //*[text()='Alerts']

Click Enter Volume search value
    Click Element  //html/body/div[2]/div[2]/div/div/div/ufc-edit-alert-modal/ufc-modal/form/ufc-alert-form/div[2]/div[1]/ufc-input/div/div/input
    Wait Until Element Is Visible  //html/body/div[2]/div[2]/div/div/div/ufc-edit-alert-modal/ufc-modal/form/ufc-alert-form/div[2]/div[1]/ufc-input/div/div
    #Input Text  //html/body/div[2]/div[2]/div/div/div/ufc-edit-alert-modal/ufc-modal/form/ufc-alert-form/div[2]/div[1]/ufc-input/div/div  0

Click Save Button
    Click Element  //*[text()="Save Alert"]

Click Close button icon
     Click Button  dom:${JSCloseButtonMWPath}

Click Delete Alert Button
    Click Element  //html/body/div[2]/div[2]/div/div/div/table/tbody/tr[1]/td[5]/button/p

Click Delete Alert Confirmation Button
   Click Button  dom:${JSDeleteButtonMWPath}

Click on GoldMan Sachs Investing stock on Quotes page
   Wait Until Element is Visible  //*[@id="__next"]/div[2]/div/div/div/table/tbody/tr[1]/td[1]/a/span  #//span[@class='css-n3dqwi']  #//*[@id="__next"]/div[2]/div/div/div/table/tbody/tr[1]/td[1]/a/span
   Click Element  //*[@id="__next"]/div[2]/div/div/div/table/tbody/tr[1]/td[1]/a/span  #//span[@class='css-n3dqwi']  #/html/body/div[2]/div[2]/div/div/div/table/tbody/tr[1]/td[1]/a/span  #//*[@id="__next"]/div[2]/div/div/div/table/tbody/tr[1]/td[1]/a/span

Click on Historical Quotes for GoldMan Sachs Investing stock
   Wait Until Element is Visible  //*[@id="maincontent"]/div[5]/div/div/li[5]  #//a[contains(@href,'https://www.stg.marketwatch.com/investing/stock/gs/download-data?mod=mw_quote_tab')]  #//*[@id="maincontent"]/div[5]/div/div/li[5]/a
   Click Element  //*[@id="maincontent"]/div[5]/div/div/li[5]  #//a[contains(@href,'https://www.stg.marketwatch.com/investing/stock/gs/download-data?mod=mw_quote_tab')]  #//*[@id="maincontent"]/div[5]/div/div/li[5]/a

Click On Search Quote option
      Click Element  //*[@id="searchticker"]
      Input text  Apple
      Click Element  //*[@id="maincontent"]/div[2]/div[2]/div/div[1]/div[1]/div/ul/li[1]/a  #//*[@id="maincontent"]/div[1]/div[2]/div/div[1]/div[1]/div/ul/li[1]/a

Click on Apple Investing stock on Quotes page
      Wait Until Element is Visible  //*[@id="maincontent"]/div[2]/div[2]/div/div[1]/div[1]/div/ul/li[1]/a  #//*[@id="maincontent"]/div[1]/div[2]/div/div[1]/div[1]/div/ul/li[1]/a
      Click Element  //*[@id="maincontent"]/div[2]/div[2]/div/div[1]/div[1]/div/ul/li[1]/a  #//*[@id="maincontent"]/div[1]/div[2]/div/div[1]/div[1]/div/ul/li[1]/a

Click on Historical Quotes for Apple Investing stock
      Wait Until Element is Visible  //a[contains(@href,'https://www.stg.marketwatch.com/investing/stock/aapl/download-data?mod=mw_quote_tab')]  #//*[@id="maincontent"]/div[5]/div/div/li[5]/a
      Click Element  //a[contains(@href,'https://www.stg.marketwatch.com/investing/stock/aapl/download-data?mod=mw_quote_tab')]  #//*[@id="maincontent"]/div[5]/div/div/li[5]/a

