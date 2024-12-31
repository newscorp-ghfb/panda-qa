*** Settings ***
Documentation  Shadow DOM in Robot Framework
Library  SeleniumLibrary
Library    Process
Resource  ../Resources/CommonFunctionality.robot

*** Variables ***
${Email} =  Set Variable  ${EMPTY}
${Password} =  Set Variable  ${EMPTY}
${Barrons} =  document.querySelector("body > section > nav > nav-hat").shadowRoot.querySelector("#barrons-link > span")

*** Keywords ***

Set Implicit Wait
    Set Selenium Implicit Wait  50s

Sign In Process
    IF  "${Env}" == "prod"
        ${Email}=  Set Variable  ${Email_prod}
        ${Password}=  Set Variable  ${Password_prod}
    ELSE IF  "${Env}" == "dev"
        ${Email}=  Set Variable  ${Email_dev}
        ${Password}=  Set Variable  ${Password_dev}
    END
   Wait Until Element Is Visible  //*[@id="emailOrUsername"]
   Click Element  //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  60

WSJ Postback Page Sign In Process
   Wait Until Element Is Visible  //*[@id="emailOrUsername"]
   Click Element   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  60

FN Sign In Process
    IF  "${Env}" == "prod"
        ${Email}=  Set Variable  ${Email_prod}
        ${Password}=  Set Variable  ${Password_prod}
    ELSE IF  "${Env}" == "dev"
        ${Email}=  Set Variable  ${Email_dev}
        ${Password}=  Set Variable  ${Password_dev}
    END
   Wait Until Element Is Visible  //*[@id="emailOrUsername"]
   Click Element   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  10

Barrons Table Alignment Sign in Process
   Wait Until Element is Visible  //*[@id="root"]/div/div[1]/div/div[1]/header/div/div[1]/div[3]/div/div[1]/a
   Click Element  //*[@id="root"]/div/div[1]/div/div[1]/header/div/div[1]/div[3]/div/div[1]/a
   Wait Until Element Is Visible  //*[@id="emailOrUsername"]
   Click Element   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button

Barrons Quote Page Sign in Process
   Wait Until Element is Visible  //html/body/div[3]/div/div/header/div/div[1]/div[3]/div/a
   Click Element  //html/body/div[3]/div/div/header/div/div[1]/div[3]/div/a
   Wait Until Element Is Visible  //*[@id="emailOrUsername"]
   Click Element   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button

Barrons Stock Screener Sign in Process
   Wait Until Element is Visible  //html/body/div[3]/div/header/div/div[1]/div[3]/div/a
   Set Selenium Implicit Wait  2s
   Click Element  //html/body/div[3]/div/header/div/div[1]/div[3]/div/a
   Wait Until Element Is Visible  //*[@id="emailOrUsername"]
   Click Element   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  60

WSJ Postback Sign In Process
    IF  "${Env}" == "prod"
        ${Email}=  Set Variable  ${Email_prod}
        ${Password}=  Set Variable  ${Password_prod}
    ELSE IF  "${Env}" == "dev"
        ${Email}=  Set Variable  ${Email_dev}
        ${Password}=  Set Variable  ${Password_dev}
    END
    Wait Until Element is Visible  //html/body/div[11]/ufc-portal/ufc-signin-modal//div/div[2]/focus-trap/div[2]/ufc-button/button
    Click Element  //html/body/div[11]/ufc-portal/ufc-signin-modal//div/div[2]/focus-trap/div[2]/ufc-button/button
    Wait Until Element Is Visible  //input[@type='email']
    Click Button  //input[@type='email']
    Input Text  //input[@type='email']   qapandaautomation@hotmail.com
    Set Selenium Implicit Wait  10s
    Click Element  //span[text()="Continue"]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password-login-password"]
    Input Text  //*[@id="password-login-password"]   Testing.123
    Set Selenium Speed  1.0 seconds
    IF  "${Env}" == "prod"
        Click Element  //*[@id="password-login"]/div/form/div[5]/button    #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[@id="password-login"]/div/form/div[5]/button
    END
    Wait Until Element Is Not Visible  //*[@id="password-login"]/div/form/div/div[5]/div[1]/button

Mansion Global Sign In Process
    Click Button  //input[@type='email']
    Input Text  //input[@type='email']   QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #priyanka.bhoomraogari@dowjones.com  #isaias.iniguez@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password-login-password"]
    Input Text  //*[@id="password-login-password"]   password1  #AKpolarzx@2594  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Not Visible  //*[@id="password-login"]/div/form/div/div[5]/div[1]/button

Barrons Article Sign in Process
   Wait Until Element is Visible  //*[@id="__next"]/header/div/div[1]/div[3]/div/a
   Click Element  //*[@id="__next"]/header/div/div[1]/div[3]/div/a
   Wait Until Element is Visible  //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button

Barrons Newsletter Sign in Process
   Wait Until Element is Visible  //*[@id='__next']/div/div/header/div/div[1]/div[3]/div/a
   Click Element  //*[@id='__next']/div/div/header/div/div[1]/div[3]/div/a
   Wait Until Element is Visible  //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button

Barrons Stock Pick Sign In Process
   Wait Until Element is Visible  //*[@id="__next"]/div/header/div/div[1]/div[3]/div/a  #//html/body/div[3]/div/div/header/div/div[1]/div[3]/div/a
   Click Element  //*[@id="__next"]/div/header/div/div[1]/div[3]/div/a  #//html/body/div[3]/div/div/header/div/div[1]/div[3]/div/a
   Wait Until Element is Visible  //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button

Market Watch Sign In Process
   Click Element   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
  # Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button

MarketWatch Test User Sign In Process
    #Click Button  //html/body/div[11]/div/div[2]/div[2]/button[1]
    #Wait Until Element is visible  //html/body/section/nav/header/div[4]/label
    #Click Element   //html/body/section/nav/header/div[4]/label
    Wait Until Element is visible  //*[@id="maincontent"]/div/div/section/div[1]/div[3]/div/a  #//html/body/section/nav/header/div[4]/ul/li[2]/a
    Click Element  //*[@id="maincontent"]/div/div/section/div[1]/div[3]/div/a  #//html/body/section/nav/header/div[4]/ul/li[2]/a
    Click Button  //*[@id="emailOrUsername"]
    Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #isaias.iniguez@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-continue-btn"]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password"]
    Input Text  //*[@id="password"]  password1  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-pass-submit-btn"]
    Set Selenium Implicit Wait  10s
    Wait Until Element is visible  //html/body/section/nav/header/ul/li[2]/a
    Click Element  //html/body/section/nav/header/ul/li[2]/a

MarketWatch Alerts User Sign In Process
    Wait Until Element is Visible  //*[@id="__next"]/div[2]/div/div/div/div/a/span  #//html/body/div[2]/div[2]/div/div/div/div/a
    Click Element  //*[@id="__next"]/div[2]/div/div/div/div/a/span  #//html/body/div[2]/div[2]/div/div/div/div/a
    Click Button  //*[@id="emailOrUsername"]  #//input[@type='email']
    Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #isaias.iniguez@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-continue-btn"]  #//span[text()='Continue']/..
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password"]  #//*[@id="password-login-password"]
    Input Text  //*[@id="password"]  password1  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-pass-submit-btn"]  #//section[@id='password-login']/div/form/div[5]/button

WSJ Sign In Process
    Wait Until Element is visible  //*[@id="__next"]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
    Click Element  //*[@id="__next"]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]  #//*[@id="__next"]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
    Click Button  //*[@id="emailOrUsername"]
    Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #isaias.iniguez@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-continue-btn"]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password"]
    Input Text  //*[@id="password"]  password1  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-pass-submit-btn"]  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button

New WSJ Sign In Process
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  newsroomdev.test.6@dowjones.com  #newsroomdev.test@dowjones.com  #akhilesh.khanduri@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="input61"]  #//input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //*[@id="input61"]   password1  #B9oB6pTg4LO8obgDjsy6Gjj9vUE2fe
        #VTdnnCgCnny100g62    #AKpolarzx@2594  #68L91AbU?98&T-Ryk7h|c}Q:uX   #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    Set Selenium Implicit Wait  30s
    Wait Until Element Is Visible  //*[@id="input86"]   #//*[@id="password-login-password"]
    Input Text  //*[@id="input86"]  QA integration testing
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']
#    Wait Until Element is Visible  //html/body/div[2]/div[2]/main/div[2]/div/div/div[2]/form/div[2]/div/div[1]/div[2]/div[2]/a
#    CLick Element   //html/body/div[2]/div[2]/main/div[2]/div/div/div[2]/form/div[2]/div/div[1]/div[2]/div[2]/a
#    Set Selenium Implicit Wait  30s
#    Wait Until Element Is Visible  //*[@id="input86"]   #//*[@id="password-login-password"]
#    Input Text  //*[@id="input86"]  QA integration testing
#    Set Selenium Implicit Wait  10s
#    Click Button  //input[@type='submit']

PE News Capabilities Dashoard Sign In Process
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  newsroomdev.test@dowjones.com  #newsroomdev.test@dowjones.com  #akhilesh.khanduri@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //input[@type='password']   B9oB6pTg4LO8obgDjsy6Gjj9vUE2fe
        #VTdnnCgCnny100g62    #AKpolarzx@2594  #68L91AbU?98&T-Ryk7h|c}Q:uX   #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    Set Selenium Implicit Wait  30s
    Wait Until Element Is Visible  //*[@id="input55"]   #//*[@id="password-login-password"]
    Input Text  //*[@id="input55"]  QA integration testing
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']

New WSJ Test User Sign In Process
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  newsroomdev.test@dowjones.com  #akhilesh.khanduri@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//html/body/div[2]/div[2]/main/div[2]/div/div/div[2]/form/div[2]/input  #//*[@id="form20"]/div[2]/input  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //input[@type='password']  B9oB6pTg4LO8obgDjsy6Gjj9vUE2fe  #VTdnnCgCnny100g65   #AKpolarzx@2594  #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']
    Wait Until Element Is Visible  //*[@id="input144"]   #//*[@id="password-login-password"]
    Input Text  //*[@id="input144"]  QA integration testing
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button

WSJ Breadcrumbs Sign In Process
   Wait Until Element is Visible  //html/body/div[3]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
   Click Element  //html/body/div[3]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
   Click Button   //*[@id=":r5:-form-item"]
   Input Text  //*[@id=":r5:-form-item"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id=":r8:-form-item"]
   Input Text  //*[@id=":r8:-form-item"]  password1
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  60

WSJ New Preference Center Page Log In
   Click Button   //*[@id=":r5:-form-item"]
   Input Text  //*[@id=":r5:-form-item"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Implicit Wait  10s
   Wait Until Element Is Visible  //*[@id=":r8:-form-item"]
   Input Text  //*[@id=":r8:-form-item"]  password1
   Set Selenium Implicit Wait  10
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  60

WSJ Breadcrumbs Article Sign In Process
    Wait Until Element is Visible  //html/body/div[3]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
    Click Element  //html/body/div[3]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
    Click Button  //*[@id=":r9:-form-item"]  #//input[@type='email']
    Input Text  //*[@id=":r9:-form-item"]  QABARRONSONLY  #isaias.iniguez@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  /html/body/div/section/div/div[2]/form/button[1]  #//span[text()='Continue']/..
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id=":rc:-form-item"]
    Input Text  //*[@id=":rc:-form-item"]  password1  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //html/body/div/section/div/div[2]/form/button  #//section[@id='password-login']/div/form/div[5]/button

WSJ New Breadcrumbs Sign In Process
   Wait Until Element is Visible  //*[@id="__next"]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
   Click Element  //*[@id="__next"]/div/div[2]/div[2]/div/div/header[1]/div[1]/div/div[1]/a[2]
   Click Button  //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   Set Selenium Speed  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1  #AKpolarsxzi2594
   Set Selenium Speed  10s
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   Set Selenium Implicit Wait  60

WSJ Alerts Sign In Process
   Wait Until Element is Visible  //a[text()="Sign In"]
   Click Element  //a[text()="Sign In"]
   Click Button   //*[@id="emailOrUsername"]
   Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #//*[@id=":r5:-form-item"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
   Set Selenium Implicit Wait  10s
   Click Button  //html/body/div/section/div/div[2]/form/button[1]
   #Set Selenium Speed  10s
   Wait Until Element Is Visible  //*[@id="password"]
   Input Text  //*[@id="password"]  password1
   #Set Selenium Speed  10s
   Wait Until Element is Visible  //html/body/div/section/div/div[2]/form/button
   Click Element  //html/body/div/section/div/div[2]/form/button  #//html/body/main/div[2]/section[16]/div/form/div[5]/button
   #Set Selenium Implicit Wait  60

WSJ Watchlist Sign In Process
    Click Button  //*[@id="password-login-username"]
    Input Text  //*[@id="password-login-username"]  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password-login-password"]
    Input Text  //*[@id="password-login-password"]  password1
    Set Selenium Implicit Wait  10s
    Wait Until Element is Visible  //html/body/main/div[2]/section[16]/div/form/div[5]/button
    Click Element  //html/body/main/div[2]/section[16]/div/form/div[5]/button

WSJ Preference Center Page Sign In Process
#    Wait Until Element is Visible  //*[text()='View All']
#    Click Element  //*[text()='View All']
    Wait Until Element is Visible  //*[@id="__next"]/div/div[1]/div[3]/header[1]/div[1]/div/div[1]/a[2]
    Click Element  //*[@id="__next"]/div/div[1]/div[3]/header[1]/div[1]/div/div[1]/a[2]
    Click Button  //*[@id=":r5:-form-item"]
    Input Text  //*[@id=":r5:-form-item"]  QABARRONSONLY  #isaias.iniguez@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //html/body/div/section/div/div[2]/form/button[1]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id=":r8:-form-item"]
    Input Text  //*[@id=":r8:-form-item"]  password1  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //html/body/div/section/div/div[2]/form/button

WSJ Newsletters Page Sign In Process

    Click Element  //*[@id="__next"]/div[1]/header/div/button


Sailthru User Sign In Process
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  newsroomdev.test@dowjones.com  #akhilesh.khanduri@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //html/body/div/main/section/div/div/div/div/div/form/div[2]/button  #//*[@id="form20"]/div[2]/input  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  newsroomdev.test@dowjones.com
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="form20"]/div[2]/input  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //input[@type='password']  B9oB6pTg4LO8obgDjsy6Gjj9vUE2fe  #AKpolarzx@2594  #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']

#Sailthru Sign In Process
#    Click Button  //input[@type='text']
#    Input Text  //input[@type='text']  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
#    Set Selenium Implicit Wait  10s
#    Click Button  //html/body/div/main/section/div/div/div/div/div/form/div[2]/button  #//*[@id="form20"]/div[2]/input  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
#    Set Selenium Implicit Wait  10s
#    Click Button  //input[@type='text']
#    Input Text  //input[@type='text']  QABARRONSONLY  #akhilesh.khanduri@dowjones.com
#    Set Selenium Implicit Wait  10s
#    Click Button  //*[@id="form20"]/div[2]/input  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
#    Set Selenium Implicit Wait  10s
#    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
#    Input Text  //input[@type='password']  password1  #AKpolarsxzi2594  #//*[@id="password-login-password"]  #Cuceis19841234!
#    Set Selenium Implicit Wait  10s
#    Click Button  //input[@type='submit']
#    Sleep  30s
#    Set Selenium Implicit Wait  0.01s
#    Wait Until Element Is Not Visible  //input[@type='submit']

MarketWatch PreferenceCenter User Sign In Process
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="emailOrUsername"]
    Input Text  //*[@id="emailOrUsername"]  QABARRONSONLY  #isaias.iniguez@dowjones.com
    Click Button  //*[@id="signin-continue-btn"]
    #Click Button  //span[text()='Continue']/..
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password"]  #//*[@id="password-login-password"]
    Input Text  //*[@id="password"]  password1  #January2024  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="signin-pass-submit-btn"]  #//section[@id='password-login']/div/form/div[5]/button
    Wait Until Element Is Not Visible  //*[@id="signin-pass-submit-btn"]  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button


Test User Sign In Process
    Click Button  //input[@type='text']
    Input Text  //input[@type='text']  QABARRONSONLY
    Set Selenium Implicit Wait  10s
    Click Button  //*[@id="form20"]/div[2]/input  #//*[@id="basic-login"]/div[1]/form/div[2]/div[6]/div[1]/button[2]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //input[@type='password']  #//*[@id="password-login-password"]
    Input Text  //input[@type='password']  password1  #//*[@id="password-login-password"]  #Cuceis19841234!
    Set Selenium Implicit Wait  10s
    Click Button  //input[@type='submit']  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    Sleep  30s
    Set Selenium Implicit Wait  0.01s
    Wait Until Element Is Not Visible  //input[@type='submit']  #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button

Accept Cookies
    Click Button  //*[@id="notice"]/div[4]/div/div[2]/button[2]

Capabilities Dashboard Main Menu
    IF  "${Env}" == "prod"
        Open Browser  https://int-prod-capabilities-dashboard.vir.onservo.com/app  ${Browser}
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://int-int-capabilities-dashboard.vir-dev.onservo.com/app  ${Browser}
    END
    Wait Until Element Is Visible  //h1[text()="Dashboard"]
    Wait Until Element Is Visible  //*[text()="Total subscriptions"]
    Wait Until Element Is Visible  //*[text()="Sent"]
    Wait Until Element Is Visible  //*[text()="Bounced"]
    Wait Until Element Is Visible  //*[text()="Delivered"]
    Wait Until Element Is Visible  //*[text()="Clicked"]
    Wait Until Element Is Visible  //div[text()="Campaign Monitor"]/../div[text()="Last month"]
    Click Button  //*[text()="Follow Dashboard"]/../a
    Wait Until Element Is Visible  //h1[text()="Follow Dashboard"]
    Wait Until Element Is Visible  //*[text()="Total subscriptions"]
    Wait Until Element Is Visible  //*[text()="Product"]
    Wait Until Element Is Visible  //*[text()="Alert"]
    Wait Until Element Is Visible  //td[text()="Barron's"]
    IF  //td[text()="Barron's"]/../*[@data-label="Subscriptions"] >= 0
        Log  Barrons value is not null
    ELSE
        Log  Error on Barrons value
    END
    Wait Until Element Is Visible  //td[text()="Financial News"]
    IF  //td[text()="Financial News"]/../*[@data-label="Subscriptions"] >= 0
        Log  Financial News value is not null
    ELSE
        Log  Error on Financial News value
    END
    Wait Until Element Is Visible  //td[text()="Mansion Global"]
    IF  //td[text()="Mansion Global"]/../*[@data-label="Subscriptions"] >= 0
        Log  Mansion Global value is not null
    ELSE
        Log  Error on Mansion Global value
    END
    Wait Until Element Is Visible  //td[text()="MarketWatch"]
    IF  //td[text()="MarketWatch"]/../*[@data-label="Subscriptions"] >= 0
        Log  MarketWatch value is not null
    ELSE
        Log  Error on MarketWatch value
    END
    Wait Until Element Is Visible  //td[text()="Private Equity News"]
    IF  //td[text()="Private Equity News"]/../*[@data-label="Subscriptions"] >= 0
        Log  Private Equity News value is not null
    ELSE
        Log  Error on Private Equity News value
    END
    Wait Until Element Is Visible  //td[text()="The Wall Street Journal"]
    IF  //td[text()="The Wall Street Journal"]/../*[@data-label="Subscriptions"] >= 0
        Log  The Wall Street Journal value is not null
    ELSE
        Log  Error on The Wall Street Journal value
    END
    Wait Until Element Is Visible  //td[text()="Executive Edition"]
    IF  //td[text()="Executive Edition"]/../*[@data-label="Subscriptions"] >= 0
        Log  Executive Edition value is not null
    ELSE
        Log  Error on Executive Edition value
    END
    Wait Until Element Is Visible  //td[text()="Author"]
    IF  //td[text()="Executive Edition"]/../*[@data-label="Subscriptions"] >= 0
        Log  Author value is not null
    ELSE
        Log  Error on Author value
    END
    Wait Until Element Is Visible  //td[text()="Company"]
    IF  //td[text()="Company"]/../*[@data-label="Subscriptions"] >= 0
        Log  Company value is not null
    ELSE
        Log  Error on Company value
    END
    Wait Until Element Is Visible  //td[text()="Custom Topic"]
    IF  //td[text()="Custom Topic"]/../*[@data-label="Subscriptions"] >= 0
        Log  Custom Topic value is not null
    ELSE
        Log  Error on Custom Topic value
    END
    Wait Until Element Is Visible  //td[text()="Industry"]
    IF  //td[text()="Industry"]/../*[@data-label="Subscriptions"] >= 0
        Log  Industry value is not null
    ELSE
        Log  Error on Industry value
    END
    Wait Until Element Is Visible  //td[text()="Inflation"]
    IF  //td[text()="Inflation"]/../*[@data-label="Subscriptions"] >= 0
        Log  Inflation value is not null
    ELSE
        Log  Error on Inflation value
    END
    Wait Until Element Is Visible  //td[text()="Real Estate Search"]
    IF  //td[text()="Real Estate Search"]/../*[@data-label="Subscriptions"] >= 0
        Log  Real Estate Search value is not null
    ELSE
        Log  Error on Real Estate Search value
    END
    Click Button  //*[text()="Campaign Monitor"]/../a
    Wait Until Element Is Visible  //h1[text()="Campaign Monitor Dashboard"]
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
    Wait Until Element Is Visible  //th[text()="Product"]
    Wait Until Element Is Visible  //th[text()="Sent"]
    Wait Until Element Is Visible  //th[text()="Bounced"]
    Wait Until Element Is Visible  //th[text()="Bounced %"]
    Wait Until Element Is Visible  //th[text()="Clicked"]
    Wait Until Element Is Visible  //th[text()="Clicked %"]
    Wait Until Element Is Visible  //td[text()="Barron's"]
    IF  //td[text()="Barron's"]/../*[@data-label="Sent"] >= 0
        Log  Barrons Sent value is not null
    ELSE
        Log  Error on Barrons Sent value
    END
    Wait Until Element Is Visible  //td[text()="Financial News"]
    IF  //td[text()="Financial News"]/../*[@data-label="Sent"] >= 0
        Log  Financial News Sent value is not null
    ELSE
        Log  Error on Financial News Sent value
    END
    Wait Until Element Is Visible  //td[text()="Mansion Global"]
    IF  //td[text()="Mansion Global"]/../*[@data-label="Sent"] >= 0
        Log  Mansion Global Sent value is not null
    ELSE
        Log  Error on Mansion Global Sent value
    END
    Wait Until Element Is Visible  //td[text()="MarketWatch"]
    IF  //td[text()="MarketWatch"]/../*[@data-label="Sent"] >= 0
        Log  MarketWatch Sent value is not null
    ELSE
        Log  Error on MarketWatch Sent value
    END
    Wait Until Element Is Visible  //td[text()="Private Equity News"]
    IF  //td[text()="Private Equity News"]/../*[@data-label="Sent"] >= 0
        Log  Private Equity News Sent value is not null
    ELSE
        Log  Error on Private Equity News Sent value
    END
    Wait Until Element Is Visible  //td[text()="The Wall Street Journal"]
    IF  //td[text()="The Wall Street Journal"]/../*[@data-label="Sent"] >= 0
        Log  The Wall Street Journal Sent value is not null
    ELSE
        Log  Error on The Wall Street Journal Sent value
    END
    Wait Until Element Is Visible  //td[text()="Executive Edition"]
    IF  //td[text()="Executive Edition"]/../*[@data-label="Sent"] >= 0
        Log  Executive Edition Sent value is not null
    ELSE
        Log  Error on Executive Edition Sent value
    END
    Wait Until Element Is Visible  //td[text()="Barron's"]
    IF  //td[text()="Barron's"]/../*[@data-label="Bounced"] >= 0
        Log  Barrons Bounced value is not null
    ELSE
        Log  Error on Barrons Bounced value
    END
    Wait Until Element Is Visible  //td[text()="Financial News"]
    IF  //td[text()="Financial News"]/../*[@data-label="Bounced"] >= 0
        Log  Financial News Bounced value is not null
    ELSE
        Log  Error on Financial News Bounced value
    END
    Wait Until Element Is Visible  //td[text()="Mansion Global"]
    IF  //td[text()="Mansion Global"]/../*[@data-label="Bounced"] >= 0
        Log  Mansion Global Bounced value is not null
    ELSE
        Log  Error on Mansion Global Bounced value
    END
    Wait Until Element Is Visible  //td[text()="MarketWatch"]
    IF  //td[text()="MarketWatch"]/../*[@data-label="Bounced"] >= 0
        Log  MarketWatch Bounced value is not null
    ELSE
        Log  Error on MarketWatch Bounced value
    END
    Wait Until Element Is Visible  //td[text()="Private Equity News"]
    IF  //td[text()="Private Equity News"]/../*[@data-label="Bounced"] >= 0
        Log  Private Equity News Bounced value is not null
    ELSE
        Log  Error on Private Equity News Bounced value
    END
    Wait Until Element Is Visible  //td[text()="The Wall Street Journal"]
    IF  //td[text()="The Wall Street Journal"]/../*[@data-label="Bounced"] >= 0
        Log  The Wall Street Journal Bounced value is not null
    ELSE
        Log  Error on The Wall Street Journal Bounced value
    END
    Wait Until Element Is Visible  //td[text()="Executive Edition"]
    IF  //td[text()="Executive Edition"]/../*[@data-label="Bounced"] >= 0
        Log  Executive Edition Bounced value is not null
    ELSE
        Log  Error on Executive Edition Bounced value
    END
    Wait Until Element Is Visible  //td[text()="Barron's"]
    IF  //td[text()="Barron's"]/../*[@data-label="Clicked"] >= 0
        Log  Barrons Clicked value is not null
    ELSE
        Log  Error on Barrons Clicked value
    END
    Wait Until Element Is Visible  //td[text()="Financial News"]
    IF  //td[text()="Financial News"]/../*[@data-label="Clicked"] >= 0
        Log  Financial News Clicked value is not null
    ELSE
        Log  Error on Financial News Clicked value
    END
    Wait Until Element Is Visible  //td[text()="Mansion Global"]
    IF  //td[text()="Mansion Global"]/../*[@data-label="Clicked"] >= 0
        Log  Mansion Global Clicked value is not null
    ELSE
        Log  Error on Mansion Global Clicked value
    END
    Wait Until Element Is Visible  //td[text()="MarketWatch"]
    IF  //td[text()="MarketWatch"]/../*[@data-label="Clicked"] >= 0
        Log  MarketWatch Clicked value is not null
    ELSE
        Log  Error on MarketWatch Clicked value
    END
    Wait Until Element Is Visible  //td[text()="Private Equity News"]
    IF  //td[text()="Private Equity News"]/../*[@data-label="Clicked"] >= 0
        Log  Private Equity News Clicked value is not null
    ELSE
        Log  Error on Private Equity News Clicked value
    END
    Wait Until Element Is Visible  //td[text()="The Wall Street Journal"]
    IF  //td[text()="The Wall Street Journal"]/../*[@data-label="Clicked"] >= 0
        Log  The Wall Street Journal Clicked value is not null
    ELSE
        Log  Error on The Wall Street Journal Clicked value
    END
    Wait Until Element Is Visible  //td[text()="Executive Edition"]
    IF  //td[text()="Executive Edition"]/../*[@data-label="Clicked"] >= 0
        Log  Executive Edition Clicked value is not null
    ELSE
        Log  Error on Executive Edition Clicked value
    END

    Sign In Process
    IF  "${Env}" == "prod"
        ${Email}=  Set Variable  ${Email_prod}
        ${Password}=  Set Variable  ${Password_prod}
    ELSE IF  "${Env}" == "dev"
        ${Email}=  Set Variable  ${Email_dev}
        ${Password}=  Set Variable  ${Password_dev}
    END
    Wait Until Element Is Visible  //input[@type='email']
    Click Button  //input[@type='email']
    Input Text  //input[@type='email']  ${Email}
    Set Selenium Implicit Wait  10s
    Click Element  //span[text()="Continue"]
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  //*[@id="password-login-password"]
    Input Text  //*[@id="password-login-password"]  ${Password}
    Set Selenium Speed  1.0 seconds
    IF  "${Env}" == "prod"
        Click Element  //*[@id="password-login"]/div/form/div[5]/button    #//*[@id="password-login"]/div/form/div/div[5]/div[1]/button
    ELSE IF  "${Env}" == "dev"
        Click Element  //*[@id="password-login"]/div/form/div[5]/button
    END
    Wait Until Element Is Not Visible  //*[@id="password-login"]/div/form/div/div[5]/div[1]/button

Sign In Process for Preference Center

    Wait Until Element Is Visible  //*[@id="emailOrUsername"]
    Click Button  //*[@id="emailOrUsername"]
    Input Text  //*[@id="emailOrUsername"]  archana.saini@dowjones.com
    Set Selenium Speed  1.0 seconds
    Click Element  //*[@id="signin-continue-btn"]
    Set Selenium Speed  1.0 seconds
    Wait Until Element Is Visible  //*[@id="password"]
    Input Text  //*[@id="password"]  Lactomania@123
    Set Selenium Speed  1.0 seconds
    Click Element  (//span[@title='Sign In'])[2]/..
    Wait Until Element Is Visible  //li[text()='View All']


