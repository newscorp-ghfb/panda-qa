*** Settings ***
Library  SeleniumLibrary
Library    JSONLibrary
Resource  ../Resources/DefinedKeywords.robot

*** Variables ***
${BROWSERSTACK_USERNAME}=   newsroomdev.test.6@dowjones.com  #jansisasikumar_XRKqk6  #newsroomdevtest_xCBmjv
${BROWSERSTACK_ACCESS_KEY}=  iFzp4wb8qJpnUeL  #Lv2l3jg7pYbuCg2caMMgmfqVcsuv8g #ptazxpsTbsRFWhsEXpoM  #s3c1cGNU2UpLq5iJzNzx
${BROWSERSTACK_URL}=   https://automate.browserstack.com/dashboard/v2/builds/3263aa6a845e0b5e2d6e245b9107760e32c3105f?projectIds=2299596${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

${CookieValue1}=  x-dev-access-clientid
${ExpectedCookieValue1}=    quality-engineering

${CookieValue2}=       x-dev-access-token
${ExpectedCookieValue2}=   5Nnx9DUR7NQg8XPwvztud7o0OivfiKth

${Browser}=  ff  #headless, ff, chrome, edge, safari

${Env}=  prod  #dev, prod, stg

${Email_prod}=  barronsadvisorcs@gmail.com

${Password_prod}=  password1

${Email_dev}=  QABARRONSONLY  #priyanka.bhoomraogari@dowjones.com  #

${Password_dev}=  password1

${JSFollowButtonBarronsPath}=  document.querySelector('ufc-follow-author-widget').shadowRoot  #1
    ...  .querySelector('ufc-follow-widget')  #2
    ...  .querySelector('ufc-follow-button').shadowRoot  #3
    ...  .querySelector('button')  #4

${JSFollowButtonMGPath}=  document.querySelector('ufc-follow-author-widget').shadowRoot  #1
    ...  .querySelector('ufc-follow-button').shadowRoot  #2
    ...  .querySelector('button')  #3

${JSFollowButtonMWPath}=  document.querySelector('ufc-follow-author-widget').shadowRoot  #1
    ...  .querySelector('ufc-follow-widget')  #2
    ...  .querySelector('ufc-follow-button').shadowRoot  #3
    ...  .querySelector('button')  #3

${CookieManagerYesPath}=  //*[@id="notice"]/div[4]/div/div/button[2]

*** Keywords ***
Set Browser Options
        IF  "${Browser}" == "firefox"
             ${options} =    Evaluate    selenium.webdriver.FirefoxOptions()
            Call Method    ${options}    add_argument    --CreateProfile
            Call Method    ${options}    add_argument    --start-maximized
            Call Method    ${options}    add_argument    --disable-dev-shm-usage
            Call Method    ${options}    add_argument    --no-sandbox
            Call Method    ${options}    add_argument    --disable-gpu
            Call Method    ${options}    add_argument    --headless

            Call Method    ${options}    add_argument    --devtools.debugger.force-local
            Call Method    ${options}    add_argument    --devtools.debugger.remote-enabled
            Call Method    ${options}    add_argument    --devtools.chrome.enabled
            Call Method    ${options}    add_argument    --devtools.debugger.prompt-connection
            Call Method    ${options}    add_argument    --browser.dom.window.dump.enabled
            RETURN    ${options}
        ELSE IF  "${Browser}" == "chrome"
            ${options} =    Evaluate    selenium.webdriver.ChromeOptions()
            Call Method    ${options}    add_argument    --start-maximized
            Call Method    ${options}    add_argument    --disable-dev-shm-usage
            Call Method    ${options}    add_argument    --no-sandbox
            Call Method    ${options}    add_argument    --headless
            Call Method    ${options}    add_argument    --disable-gpu
            Call Method    ${options}    add_argument    --ignore-certificate-errors
            Call Method    ${options}    add_argument    --disable-extensions
            Call Method    ${options}    add_argument    --no-user-gesture-required
            Call Method    ${options}    add_argument    --no-first-run
            Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
            Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
            Call Method    ${options}    add_argument    --disable-sync
            RETURN    ${options}
        END

Start Barrons Article
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
       Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.barrons.com/articles/wendys-wen-stock-earnings-51652268634
    ELSE IF  "${Env}" == "dev"
       Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.barrons.com/articles/buy-under-armour-stock-pick-51650672000
    END
    Wait Until Page Contains Element  dom:${JSFollowButtonBarronsPath}
    Maximize Browser Window

Start Mansion Global Article
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.mansionglobal.com  ${Browser}  options=${options}
        Go To  https://www.mansionglobal.com/articles/are-there-tax-breaks-on-agricultural-land-in-pennsylvania-01648119848
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.mansionglobal.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.mansionglobal.com/articles/article-long-text-01643043212
    END
    Wait Until Page Contains Element  dom:${JSFollowButtonMGPath}
    Maximize Browser Window

Start FN Article
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.fnlondon.com  ${Browser}  options=${options}
        Go To  https://www.fnlondon.com/articles/complaints-commissioner-fca-transparency-20220615
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.fnlondon.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.fnlondon.com/articles/testing-article-timestamp-20231102
        Execute javascript  window.scrollTo(0,500)
    END
    Execute javascript  window.scrollTo(0,500)
    Wait Until Element Is Visible  //ufc-follow-author-widget[@author-id='8680_FN']
    Maximize Browser Window

Start Sailthru Page
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://my.sailthru.com/  ${Browser}  options=${options}     #https://www.sailthru.com/u/login/identifier?state=hKFo2SBzVlExaTIyc3FUbGQtT2l2NE0zbkhSMVlxN083OWNJc6Fur3VuaXZlcnNhbC1sb2dpbqN0aWTZIDdqQmpDZ3duMEp2SE11aDduU1JLSzJ3WTRqT1E2RGFGo2NpZNkgeEtmRXhYazVyeGZTN01pbzJkcFRadzI1eHp5UHF4bjM  #https://www.sailthru.com/?doing_wp_cron=1709648423.2007079124450683593750  ${Browser}  options=${options}
        Go To   https://my.sailthru.com/  #https://login.sailthru.com/u/login/identifier?state=hKFo2SBzVlExaTIyc3FUbGQtT2l2NE0zbkhSMVlxN083OWNJc6Fur3VuaXZlcnNhbC1sb2dpbqN0aWTZIDdqQmpDZ3duMEp2SE11aDduU1JLSzJ3WTRqT1E2RGFGo2NpZNkgeEtmRXhYazVyeGZTN01pbzJkcFRadzI1eHp5UHF4bjM
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://my.sailthru.com/  ${Browser}  options=${options}    #https://login.sailthru.com/u/login/identifier?state=hKFo2SBzVlExaTIyc3FUbGQtT2l2NE0zbkhSMVlxN083OWNJc6Fur3VuaXZlcnNhbC1sb2dpbqN0aWTZIDdqQmpDZ3duMEp2SE11aDduU1JLSzJ3WTRqT1E2RGFGo2NpZNkgeEtmRXhYazVyeGZTN01pbzJkcFRadzI1eHp5UHF4bjM  ${Browser}  options=${options}
        Go To  https://my.sailthru.com/  #https://login.sailthru.com/u/login/identifier?state=hKFo2SBzVlExaTIyc3FUbGQtT2l2NE0zbkhSMVlxN083OWNJc6Fur3VuaXZlcnNhbC1sb2dpbqN0aWTZIDdqQmpDZ3duMEp2SE11aDduU1JLSzJ3WTRqT1E2RGFGo2NpZNkgeEtmRXhYazVyeGZTN01pbzJkcFRadzI1eHp5UHF4bjM
    END
    Maximize Browser Window

Start WSJ Article
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
    Maximize Browser Window

Start Market Watch Article
    Set Selenium Speed  0.1 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.marketwatch.com  ${Browser}  options=${options}
        Go To  https://www.marketwatch.com/story/is-the-u-s-stock-market-closed-on-juneteenth-what-investors-need-to-know-11655230158
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.marketwatch.com  ${Browser}  options=${options}
        Go To  https://www.dev.marketwatch.com/author/Catey-Hill
    END
    Maximize Browser Window

Start MarketWatch Newsletter
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    #IF  "${Env}" == "prod"
        Open Browser  https://www.marketwatch.com  ${Browser}  options=${options}
        Go To  https://www.marketwatch.com/follow
    #ELSE IF  "${Env}" == "dev"
        #Open Browser  https://www.dev.marketwatch.com  ${Browser}  options=${options}
       # Go To  https://www.stg.marketwatch.com/picks/i-am-not-rich-by-any-means-im-63-and-on-a-limited-budget-but-in-great-need-of-a-financial-adviser-is-there-help-for-me-214a114c?mod=mw_latestnews
    #END
    Maximize Browser Window

Start MarketWatch Newsletter Follow
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    #IF  "${Env}" == "prod"
        Open Browser  https://www.marketwatch.com  ${Browser}  options=${options}
        Go To  https://www.marketwatch.com/follow
    #ELSE IF  "${Env}" == "dev"
        #Open Browser  https://www.dev.marketwatch.com  ${Browser}  options=${options}
       # Go To  https://www.stg.marketwatch.com/picks/i-am-not-rich-by-any-means-im-63-and-on-a-limited-budget-but-in-great-need-of-a-financial-adviser-is-there-help-for-me-214a114c?mod=mw_latestnews
    #END
    Maximize Browser Window

Start Barrons Newsletter
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
       IF  "${Env}" == "prod"
        Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.barrons.com/newsletters
    ELSE IF  "${Env}" == "dev"
       Open Browser  https://www.s.dev.barrons.com  ${Browser}  options=${options}
        Go To   https://www.s.dev.barrons.com/market-data/stocks/amzn
        END
    Maximize Browser Window

Start PEN Article
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.penews.com  ${Browser}  options=${options}
        Go To  https://www.penews.com/articles/lp-survey-warns-brace-for-some-high-profile-fundraising-failures-20220622
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.penews.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.penews.com/articles/test-3testing-wsj-full-bleed-3k-words-20220215
    END
    Wait Until Element Is Visible  dom:${JSFollowButtonMGPath}
    Wait Until Page Contains Element  dom:${JSFollowButtonMGPath}
    Maximize Browser Window

Start Barrons Article without byline
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.barrons.com/articles/how-to-handle-an-uncertain-market-buy-weakness-sell-strength-f145c306
        Execute javascript  window.scrollTo(0,500)
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.barrons.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.barrons.com/articles/buy-under-armour-stock-pick-51650672000
    END
    Maximize Browser Window

Start FN Article without byline
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.fnlondon.com  ${Browser}  options=${options}
        Go To  https://www.fnlondon.com/articles/meet-the-twenty-most-influential-in-investment-banking-20230326?cx_testId=174&cx_testVariant=cx_3&cx_artPos=0#cxrecs_s
        Execute javascript  window.scrollTo(0,500)
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.fnlondon.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.fnlondon.com/articles/testing-article-timestamp-20231102
    END
    Maximize Browser Window

Start Mansion Global Article without byline
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.mansionglobal.com  ${Browser}  options=${options}
        Go To  https://www.mansionglobal.com/articles/what-property-tax-changes-are-in-store-for-luxury-home-owners-in-edmonton-canada-e0d92933
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.mansionglobal.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.mansionglobal.com/articles/article-long-text-01643043212
    END
    Maximize Browser Window

Start Market Watch Article without byline
    Set Selenium Speed  1 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.marketwatch.com  ${Browser}  options=${options}
        Go To  https://www.marketwatch.com/story/is-the-u-s-stock-market-closed-on-juneteenth-what-investors-need-to-know-11655230158
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.marketwatch.com  ${Browser}  options=${options}
        Go To  https://www.dev.marketwatch.com/author/Catey-Hill
    END
    Maximize Browser Window

Start PEN Article without byline
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.penews.com  ${Browser}  options=${options}
        Go To  https://www.penews.com/articles/dickson-minto-merger-driven-by-americanisation-of-private-equity-law-20221214
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.penews.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.penews.com/articles/test-3testing-wsj-full-bleed-3k-words-20220215
    END
    Maximize Browser Window

Start WSJ Article without byline
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/let-desantis-fight-trump-before-putin-bakhmut-offensive-cease-fire-settlement-kremlin-weapons-b127514a?cx_testId=3&cx_testVariant=cx_171&cx_artPos=1&mod=WTRN#cxrecs_s
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}

        Go To  https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
    Maximize Browser Window

Start WSJ Article for Letters breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/mary-eberstadt-furman-university-wsj-scott-yenor-campus-protest-speech-869ce29b
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
       Go To  https://www.dev.wsj.com/articles/test-oil-demand-will-fall-by-a-fifth-in-april-opec-forecasts-11587072843  #https://www.dev.wsj.com/articles/test-headline-on-wrongful-6697d68c  #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
    Maximize Browser Window

Start importing Access Tokens and Cookies
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Browser}" == "firefox"
    from selenium import webdriver
    import selenium.webdriver.FirefoxOptions()
    from selenium import webdriver
    driver = webdriver.Firefox(executable_path=r'D:\Users\khanduria\AppData\Local\Programs\Python\Python311\geckodriver-v0.33.0-win64\geckodriver.exe')
    driver.get("https://www.dev.wsj.com")   # Navigate to url
    driver.add_cookie({"name": "x-dev-access-clientid", "value": "quality-engineering"})
    driver.add_cookie({"name": "x-dev-access-token", "value": "5Nnx9DUR7NQg8XPwvztud7o0OivfiKth"})
    print(driver.get_cookies())                                                    # Get all available cookies
    END

CookieTestWSJ
    Open Browser    https://www.dev.wsj.com/client   ${browser}
    Add Cookie    ${CookieValue1}    quality-engineering
    Add Cookie    ${CookieValue2}    5Nnx9DUR7NQg8XPwvztud7o0OivfiKth
#    ${CookieValue1}    Get CookieValue1
#    ${CookieValue2}    Get CookieValue2
#    Should Be Equal    ${CookieValue1}    ${ExpectedCookieValue1}    "Cookie is equal"
#    Should Be Equal    ${CookieValue2}    ${ExpectedCookieValue2}    "Cookie is equal"

Start WSJ Letters for Letters breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/test-oil-demand-will-fall-by-a-fifth-in-april-opec-forecasts-11587072843  #https://www.wsj.com/news/types/letters?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/test-oil-demand-will-fall-by-a-fifth-in-april-opec-forecasts-11587072843  #https://www.dev.wsj.com/articles/test-headline-on-wrongful-6697d68c  #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
#    Wait Until Element Is Visible  //span[text()="Dave Michaels"]
#    Set Focus To Element  //*[text()="Letters"]
#    Maximize Browser Window

Start WSJ Article for Editorials breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/chicago-mayor-wisconsin-supreme-court-election-paul-vallas-brandon-johnson-janet-protasiewicz-dan-kelly-3673d166
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/economy/global/dollars-rise-spells-trouble-for-global-economies-38d3d986?mod=world_lead_pos1  #https://www.dev.wsj.com/articles/test-headline-on-wrongful-6697d68c  #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END

Start WSJ Editorials for Editorials breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/news/types/review-outlook-u-s?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
#    Wait Until Element Is Visible  //span[text()="Dave Michaels"]
#    Set Focus To Element  //*[text()="Review & Outlook (U.S.)"]
#    Wait Until Element Is Visible  dom:${JSFollowButtonMGPath}  30s
#    Maximize Browser Window

Start WSJ Article for Commentary breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/medicare-drug-price-controls-will-make-america-sicker-research-innovation-negotiations-private-insurers-b503b4ba
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/test-oil-demand-will-fall-by-a-fifth-in-april-opec-forecasts-11587072843  #https://www.dev.wsj.com/articles/test-headline-on-wrongful-6697d68c  #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
    Maximize Browser Window

Start WSJ Commentary for Commentary breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/news/types/commentary-u-s?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
    #Wait Until Element Is Visible  //span[text()="Dave Michaels"]
    #Set Focus To Element  //*[text()="Commentary (U.S.)"]
    #Wait Until Element Is Visible  dom:${JSFollowButtonMGPath}  30s
    Maximize Browser Window

Start WSJ Article for Elections breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/mike-pompeo-says-he-wont-run-for-president-in-2024-5406e61c
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/test-headline-on-wrongful-6697d68c  #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
#    #Wait Until Element Is Visible  //span[text()="Dave Michaels"]
#    Set Focus To Element  //*[text()="Election 2024"]
#    #Wait Until Element Is Visible  dom:${JSFollowButtonMGPath}  30s
    Maximize Browser Window

Start WSJ Elections for Elections breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/news/types/election-2024?mod=breadcrumb
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/test-headline-on-wrongful-6697d68c  #https://www.dev.wsj.com/articles/twitter-elon-musk-to-argue-over-trial-timetable-to-force-44-billion-takeover-11658223001?cx_testId=3&cx_testVariant=cx_5&cx_artPos=6&mod=WTRN#cxrecs_s
    END
#    #Wait Until Element Is Visible  //span[text()="Dave Michaels"]
#    Set Focus To Element  //*[text()="Election 2024"]
#    #Wait Until Element Is Visible  dom:${JSFollowButtonMGPath}  30s
    Maximize Browser Window

Start Barrons Stock Picks for Stock Picks breadcrumb
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.barrons.com/market-data/stocks/stock-picks?mod=BOL_TOPNAV
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.barrons.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.barrons.com/market-data/stocks/stock-picks?mod=BOL_TOPNAV
    END
    Set Focus To Element  //*[@id="__next"]/div/div[2]/div[1]/h1  #//*[text()="Barron's Latest Stock Picks"]
    Maximize Browser Window

Start Barrons Stock Picks
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
       Open Browser  https://www.s.dev.barrons.com  ${Browser}  options=${options}
        Go To   https://www.s.dev.barrons.com/market-data/stocks/stock-picks?mod=BOL_TOPNAV
    Maximize Browser Window

Start Barrons Stock Screener Page for Featured Preset Screener
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.barrons.com/market-data/barrons-stock-screener?mod=stock_screener_internal
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.barrons.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.barrons.com/market-data/barrons-stock-screener?mod=stock_screener_internal
    END

Start Barrons Stock Picks for Stock Picks in article
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.barrons.com  ${Browser}  options=${options}
        Go To  https://www.barrons.com/articles/buy-rockwell-automation-stock-pick-price-cc120733?mod=stock_picks_lp
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.barrons.com  ${Browser}  options=${options}
        Go To  https://www.s.dev.barrons.com/articles/buy-rockwell-automation-stock-pick-price-cc120733?mod=stock_picks_lp
    END
    Maximize Browser Window

Start Barrons for Newsletters page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/newsletters
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/newsletters
    END
    Maximize Browser Window

Start Barrons for Watchlist page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/watchlist
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/watchlist
    END
    Maximize Browser Window


Start WSJ for Watchlist page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/watchlist
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/watchlist
    END
    Maximize Browser Window

#Workaround URL:   https://sso.int.accounts.dowjones.com/login-page?client_id=iSKWPA8krOgQVA2np1HMPezSjhjrzKMb&redirect_uri=https%3A%2F%2Fwww.s.dev.wsj.com%2Fclient%2Fauth&response_type=code&scope=openid%20idp_id%20roles%20tags%20email%20given_name%20family_name%20uuid%20djid%20djUsername%20djStatus%20trackid%20prts%20updated_at%20created_at%20offline_access&ui_locales=en-us-x-wsj-223-2&nonce=ff161ed1-b55e-41e6-9631-a018c5364c5f&state=ru1pA5eFV4BuK_P8.VUC4sjj7ltYd7Fctl72oCdFCmXBmIXmZh6dQPIhu3V9bghDO4bd7W81z4eJ4v_lI&resource=http%253A%252F%252Fwww.dev.wsj.com%252Fwatchlist&protocol=oauth2&client=iSKWPA8krOgQVA2np1HMPezSjhjrzKMb#!/signin-password
Start WSJ for Newsletters page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.wsj.com/newsletters
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.dev.wsj.com/newsletters
    END
    Maximize Browser Window

Start MarketWatch for Watchlist page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.marketwatch.com/watchlist?mod=top_nav
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.stg.marketwatch.com
        Go To  https://www.stg.marketwatch.com/welcome-watchlist
    END
    Maximize Browser Window

Start MarketWatch for Price and Volume Alerts page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.marketwatch.com/alerts
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.stg.marketwatch.com/alerts
    END
    Maximize Browser Window

Start Barrons for Quotes page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/market-data/indexes/djia
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/market-data/indexes/djia
    END
    Execute javascript  window.scrollTo(0,500)
    Maximize Browser Window

Start Barrons for Market Data page
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/market-data
    ELSE IF  "${Env}" == "dev"
        Go To  https://www.s.dev.barrons.com/market-data
    END
    Execute javascript  window.scrollTo(0,500)
    Maximize Browser Window

Start WSJ Article for Board Pack Exclusive
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/articles/what-the-board-needs-to-know-acec160b?mod=panda_wsj_custom_topic_alert
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/articles/what-the-board-needs-to-know-acec160b?mod=panda_wsj_custom_topic_alert
    END
    Maximize Browser Window

Start WSJ Article for Education
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/us-news/education?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/us-news/education?mod=nav_top_subsection
    END
    Maximize Browser Window

Start WSJ Article for heard on the street
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/news/types/heard-on-the-street?mod=breadcrumb
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/types/heard-on-the-street?mod=breadcrumb
    END
    Maximize Browser Window

Start WSJ Article for heard on the street page
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/heard-on-the-street?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/heard-on-the-street?mod=nav_top_subsection
    END
    Maximize Browser Window

Start WSJ Article for On Wine
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/news/types/on-wine-lettie-teague?mod=bigtop-breadcrumb
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/types/on-wine-lettie-teague?mod=bigtop-breadcrumb
    END
    Maximize Browser Window

Start WSJ Article for On Wine Page
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/author/lettie-teague?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/author/lettie-teague?mod=nav_top_subsection
    END
    Maximize Browser Window

Start WSJ Homepage
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.wsj.com/  ${Browser}  options=${options}
    END
    Maximize Browser Window

Start follow function AI
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com/preference-center/alerts?alert=section&id=tech%2Fai  ${Browser}  options=${options}
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com/preference-center/alerts?alert=section&id=tech%2Fai  ${Browser}  options=${options}
    END
    Maximize Browser Window

Start WSJ Preference Center Page
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com/preference-center/alerts  ${Browser}  options=${options}
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com/preference-center/alerts  ${Browser}  options=${options}
    END
    Maximize Browser Window


Start WSJ Preference Center Page Newsletter
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com/preference-center/newsletters  ${Browser}  options=${options}
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com/preference-center/newsletters  ${Browser}  options=${options}
    END
    Maximize Browser Window

Start WSJ Article for Personal Finance
    Set Selenium Speed  10 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/personal-finance?mod=breadcrumb
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/personal-finance?mod=breadcrumb
    END
    Maximize Browser Window

Start WSJ Article for Personal Technology
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/tech/personal-tech?mod=breadcrumb
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/tech/personal-tech?mod=breadcrumb
    END
    Maximize Browser Window

Start WSJ Article for Puzzles
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/news/puzzle?mod=breadcrumb
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/news/puzzle?mod=breadcrumb
    END
    Maximize Browser Window

Start WSJ Article for Energy
    Set Selenium Speed  0.5 seconds
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.wsj.com  ${Browser}  options=${options}
        Go To  https://www.wsj.com/business/energy-oil?mod=nav_top_subsection
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.dev.wsj.com  ${Browser}  options=${options}
        Go To  https://www.dev.wsj.com/business/energy-oil?mod=nav_top_subsection
    END
    Maximize Browser Window

Click Sign In
    Click Button  //a[text()="Sign In"]

Finish Testcase
    Close Browser


Start CMS page for Barrons
    Set Selenium Speed  0.5 seconds
    IF  "${Env}" == "prod"
        Go To  https://www.barrons.com/watchlist
    ELSE IF  "${Env}" == "dev"
        Go To  https://newspress.int.dowjones.io/barrons/wp-admin/post-new.php  #https://www.s.dev.barrons.com/watchlist
    END
    Maximize Browser Window

Start Preference Center
    ${options} =  Set Browser Options
    IF  "${Env}" == "prod"
        Open Browser  https://www.barrons.com/follow  ${Browser}  options=${options}
    ELSE IF  "${Env}" == "dev"
        Open Browser  https://www.s.dev.barrons.com/follow  ${Browser}  options=${options}
    END
    Maximize Browser Window

