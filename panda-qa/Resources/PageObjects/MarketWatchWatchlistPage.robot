*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Validate Watchlist Page
    Click Element  //*[@id="__next"]/div[1]/div/nav/header/div[3]/ul[2]/li/a
    #Page Should Contain Element  //*[text()="Add Symbol"]

Click Sign in
    Click Element  /html/body/main/div/div/section/div[1]/div[3]/div/a  #//a[text()="Sign in"]

Validate Default New Watchlist
    Click Element  //*[@id="symbol-search"]
    Input Text   //*[@id="symbol-search"]  mi
    Click Element  //*[@id="main-app"]/div/div[3]/section/div[1]/div[3]/ul/li[2]/div[1]
    #Page Should Contain Element  //button[text()="annalise"]

Click Add Symbol Input
    Click Element  //input[@id="symbol-search"]

Type Symbol
    Input Text  //input[@id="symbol-search"]  Microsoft

Select Symbol
    Click Element  //div[text()="MSFT"]

Validate Symbol in Default New Watchlist
    Page Should Contain Element  //div[@class="item-symbol-inner"]/a[text()="MSFT"]

#Validate No Symbol in Default New Watchlist
#    Page Should Not Contain Element  //div[@class="item-symbol-inner"]/a[text()="MSFT"]

Create Watchlist Name
    Click Element  //button[@class="watchlist__title i-down"]

Edit Watchlist Name
    Click Element  //html/body/div[4]/section/div[2]/div/div[3]/section/div[1]/div[1]/div/ul/li[1]/div/button[2]
    Input Text  //html/body/div[4]/section/div[2]/div/div[3]/section/div[1]/div[1]/div/ul/li[1]/div/input  Test
    Click Element  //button[text()="Save"]

Validate Symbol in Created Watchlist
    Page Should Contain Element  //div[@class="item-symbol-inner"]/a[text()="MSFT"]

Delete Watchlists
    Click Element  //button[@class="watchlist__title i-down"]
    Click Element  //button[@class="btn btn--icon i-close u-floatRight"]
    Click Element  //button[text()="Delete"]
    Click Element  //button[@class="btn btn--icon i-close u-floatRight"]
    Click Element  //button[text()="Delete"]
