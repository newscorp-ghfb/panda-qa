*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot

*** Variables ***
${JSFollowButtonWSJPath}=  document.querySelector("#__next > div > main > div.article-container.css-5u49c7.e1ja801i8 > article > div.crawler.css-j6808u.etunnkc9 > div.enimwd21.css-hb9xd5 > div > div > div > div.css-1mfi1zu > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")  #document.querySelector('ufc-follow-author-widget').shadowRoot  #1
    #...  .querySelector('ufc-follow-button').shadowRoot  #2
    #...  .querySelector('button')  #3

${JSCustomFollowButtonWSJPath}=  document.querySelector("#__next > div > main > div.article-container.css-5u49c7.e1ja801i8 > article > div.crawler.css-j6808u.etunnkc9 > div.enimwd21.css-hb9xd5 > div > div > div > div.css-1mfi1zu > div > div > div > ufc-follow-author-widget").shadowRoot.querySelector("ufc-follow-widget > ufc-follow-button").shadowRoot.querySelector("button")  #document.querySelector('ufc-follow-custom-topic-widget').shadowRoot  #1
  #...  .querySelector('ufc-follow-button').shadowRoot  #2
    # ...  .querySelector('button')  #3

${JSUndoButtonWSJPath}=  document.querySelector('ufc-snackbar').shadowRoot  #1
    ...  .querySelector('div')  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('button')  #4

${JSPreferenceCenterLinkWSJPath}=  document.querySelector('ufc-snackbar').shadowRoot  #1
    ...  .querySelector('div')  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('span')  #4
    ...  .querySelector('a')  #5

${JSFollowSignInButtonPath}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.modal')  #4
    ...  .querySelector('div.footer')  #5
    ...  .querySelector('ufc-button')  #.shadowRoot  #6
    #...  .querySelector('button')  #7

${JSFollowSignInHeaderPath}=  document.querySelector('ufc-portal')  #1
    ...  .querySelector('ufc-signin-modal').shadowRoot  #2
    ...  .querySelector('div')  #3
    ...  .querySelector('div.body')  #4
    ...  .querySelector('p')  #5

${JSSignInButtonPath}=  document.querySelector('div')  #1
 ...  .querySelector('div')  #2
 ...  .querySelector('div')  #3
 ...  .querySelector('div:nth-child(1)')  #4
 ...  .querySelector('header')  #5
 ...  .querySelector('div:nth-child(1)')  #6
 ...  .querySelector('div')  #7
 ...  .querySelector('div:nth-child(2)')  #8
 ...  .querySelector('div')  #9
 ...  .querySelector('a:nth-child(2)')  #10

*** Keywords ***
Validate Follow Button
    Wait Until Element is Visible  dom:${JSFollowButtonWSJPath}
    Element Text Should Be  dom:${JSFollowButtonWSJPath}  Follow  timeout=30

Validate Custom Follow Button
    Wait Until Element is Visible  dom:${JSCustomFollowButtonWSJPath}
    Element Text Should Be  dom:${JSCustomFollowButtonWSJPath}  Follow  timeout=30

Validate WSJ Board Pack Exclusive Custom Follow Load More Button
    Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[2]/div/div/div/div[1]/div/div[2]/div/div

Reload Article Page
    Reload Page

Validate Following Button
    Set Focus To Element  //*[text()='John West']
    Scroll Down
    Wait Until Element is Visible  dom:${JSFollowButtonWSJPath}
    Wait Until Element Contains  dom:${JSFollowButtonWSJPath}  Following  timeout=15
    Element Text Should Be  dom:${JSFollowButtonWSJPath}  Following  timeout=15

Validate Custom Following Button
    Wait Until Element is Visible  //*[@id="__next"]/div/main/div[2]/article/div[1]/div[1]/div/div/div/div[1]/div/div/div/ufc-follow-author-widget  #dom:${JSCustomFollowButtonWSJPath}  #Follow  timeout=15
    #Wait Until Element Contains  //*[@id="__next"]/div/main/div[2]/article/div[1]/div[1]/div/div/div/div[1]/div/div/div/ufc-follow-author-widget  #dom:${JSCustomFollowButtonWSJPath}
    #Element Text Should Be  //*[@id="__next"]/div/main/div[2]/article/div[1]/div[1]/div/div/div/div[1]/div/div/div/ufc-follow-author-widget  #dom:${JSCustomFollowButtonWSJPath}

Click Follow Button
    Click Button  dom:${JSFollowButtonWSJPath}

Validate World News Option
   Page Should Contain   World

Validate Opinion Option
  Page Should Contain   Opinion

Click Custom Follow Button
    Click Button  dom:${JSCustomFollowButtonWSJPath}

Click Following Button
    Click Button  dom:${JSFollowButtonWSJPath}

Click Custom Following Button
     Click Button  dom:${JSCustomFollowButtonWSJPath}
#      Wait Element is Visible  //html/body/div[2]/div/div/div/div[2]/div/div/div[2]/div[2]/div[2]/a/h2/span[2]
#      Click Element  //html/body/div[2]/div/div/div/div[2]/div/div/div[2]/div[2]/div[2]/a/h2/span[2]

Click WSJ Board Pack Exclusive Custom Follow Load More Button
      Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[2]/div/div/div/div[1]/div/div[2]/div/div
      Click Element  //html/body/div[2]/div/div/div/div[2]/div/div/div/div[1]/div/div[2]/div/div

Validate Sign In Modal
    Wait Until Element is Visible  dom:${JSFollowSignInHeaderPath}
    Page Should Contain Element  dom:${JSFollowSignInHeaderPath}

Click Sign In Button Modal
    Wait Until Element is Visible  //*[@id="root"]/div/div/div/div[1]/div[1]/header/div[1]/div[3]/a[2]  #dom:${JSFollowSignInHeaderPath}  20s
    Click Element  //*[@id="root"]/div/div/div/div[1]/div[1]/header/div[1]/div[3]/a[2]  #dom:${JSFollowSignInButtonPath}

Click Undo Link
    Wait Until Element is Visible  dom:${JSUndoButtonWSJPath}
    Click Button  dom:${JSUndoButtonWSJPath}

Click Preference Center Link
    Wait Until Element is Visible  dom:${JSPreferenceCenterLinkWSJPath}
    Click Element  dom:${JSPreferenceCenterLinkWSJPath}

#Click Board Pack Exclusive Newsletter Button
Click Board Pack Exclusive Button
     Wait Until Element is visible  //html/body/div[3]/div/div[2]/div/header[1]/div[5]/section/ul/li[4]
     Click Element  //html/body/div[3]/div/div[2]/div/header[1]/div[5]/section/ul/li[4]
#    Click Button  dom:${JSCustomFollowButtonWSJPath}  #This should be the user name
#    Click Button  dom:${JSCustomFollowButtonWSJPath}  #This should be the Board Pack Exclusive Button

Click Education Button
    Click Button  dom:${JSCustomFollowButtonWSJPath}
    Click Button  dom:${JSCustomFollowButtonWSJPath}

Click heard on the street Button
    Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[1]/header/nav/ul/li[8]/div/div/div[2]/ul/li[1]/a
    Click Element   //html/body/div[2]/div/div/div/div[1]/header/nav/ul/li[8]/div/div/div[2]/ul/li[1]/a
#    Click Button  dom:${JSCustomFollowButtonWSJPath}
#    Click Button  dom:${JSCustomFollowButtonWSJPath}

Validate Markets & Finance Option
    Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[1]/header/nav/ul/li[8]/a

Validate Lifestyle Option
   Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[1]/header/nav/ul/li[11]/a

Hover Markets & Finance Option
    Hover on Element  //html/body/div[2]/div/div/div/div[1]/header/nav/ul/li[8]/a

Validate Preference Center page for heard on the street
    Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[3]/div/div/div[2]/div[2]/div[3]/a/div/span[2]

Click Preference Center link for heard on the street
    Click ELement   //html/body/div[2]/div/div/div/div[3]/div/div/div[2]/div[2]/div[3]/a/div/span[2]

Click On Wine Button
     Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[3]/div/div/div[2]/div[1]/main/div[2]/article[4]/div/div[1]/h2/a/span
     Click Element  //html/body/div[2]/div/div/div/div[3]/div/div/div[2]/div[1]/main/div[2]/article[4]/div/div[1]/h2/a/span
#    Click Button  dom:${JSCustomFollowButtonWSJPath}
#    Click Button  dom:${JSCustomFollowButtonWSJPath}

Validate Personal Finance Button
    Wait Until Element is Visible  //html/body/div[3]/div/div[1]/div[3]/header[1]/nav/ul/li[13]/a/span

Click Personal Finance Button
    Click Element  //html/body/div[3]/div/div[1]/div[3]/header[1]/nav/ul/li[13]/a/span
#    Click Button  dom:${JSCustomFollowButtonWSJPath}
#    Click Button  dom:${JSCustomFollowButtonWSJPath}

Validate Personal Technology Button
     Wait Until Element is Visible  //html/body/div[3]/div/div[1]/div[3]/header[1]/nav/ul/li[7]/a/span

Click Personal Technology Button
     Click Element  //html/body/div[3]/div/div[1]/div[3]/header[1]/nav/ul/li[7]/a/span
#    Click Button  dom:${JSCustomFollowButtonWSJPath}
#    Click Button  dom:${JSCustomFollowButtonWSJPath}

Click Load all Puzzles Button
     Wait Until Element is Visible  //*[text()='Load More']
     Click Element  //*[text()='Load More']
#    Click Button  dom:${JSCustomFollowButtonWSJPath}
#    Click Button  dom:${JSCustomFollowButtonWSJPath}

Validate Preference Center page for Puzzle
   Wait Until Element is Visible  //html/body/div[2]/div/div/div/div[2]/div/div/div[2]/div[2]/div[2]/a/h2/span[2]  #//html/body/div[2]/div/div/div/div[2]/div/div/div[2]/div[2]/div[2]/a/h2/span[2]

Click Preference Center link for Puzzle alerts
   Click Element  //html/body/div[2]/div/div/div/div[2]/div/div/div[2]/div[2]/div[2]/a/h2/span[2]

Validate Business Tab is present for Energy Button
  Wait Until Element is Visible  //html/body/div[3]/div/div[1]/div[3]/header[2]/nav/ul/li[3]/a/span

Validate Enegery Button Title at Header
   Wait Until Element is Visible  //html/body/div[3]/div/main/div[2]/div[1]/div/div/div/div/div/div[2]/h1

Click Energy Button
    Click Element    //html/body/div[3]/div/main/div[2]/div[1]/div/div/div/div/div/div[2]/h1
#    Click Button  dom:${JSCustomFollowButtonWSJPath}
#    Click Button  dom:${JSCustomFollowButtonWSJPath}

Click on Load More button to load Enery related news
     Wait Until Element is Visible  //html/body/div[3]/div/main/div[2]/div[4]/div[2]/div/div[2]/div[17]/div/button  #//*[text()='Load More']
     Click Element  //html/body/div[3]/div/main/div[2]/div[4]/div[2]/div/div[2]/div[17]/div/button  #//*[text()='Load More']

Validate author hyperlink
    Page Should Contain Element  //*[text()='Dave Michaels']

Validate Author
    Page Should Contain Element  //html/body/div[3]/div/main/div[2]/article/div[1]/div[1]/div/div/div/div[1]/div/div/a/span/span

Click author hyperlink
    Click Element  //*[text()='Dave Michaels']

Scroll Down
    IF  "${Env}" == "prod"
        Set Focus To Element  //*[text()='John West']
    ELSE IF  "${Env}" == "dev"
        Set Focus To Element  //*[text()='Joanna Stern']
    END

Validate author without byline
    Page Should Contain Element   //*[text()="Dave Michaels"]
