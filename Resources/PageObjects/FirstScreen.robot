*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${timeout}  10
${url}  https://test-stfu-applifting.herokuapp.com
${firstScreenHeader}  //*[@id="root"]/header/h1/a
${firstScreenClickButton}  //button[@class='sc-bdVaJa sc-bxivhb kjyjjl']
${firstScreenClickButtonLabel}  Click!
${firstScreenBlockQuote}  //*[@id="root"]/div/blockquote
${firstScreenTextbox}  id=name
${firstScreenTextboxTitle}  Enter your team name
${firstScreenTableTitle}  TOP 10 Clickers
${firstScreenTable}  //table[@class='sc-jTzLTM ciUzJU']
${firstScreenTableHeader1}  Team
${firstScreenTableHeader2}  Clicks
${firstScreenTableQuote}  Want to be top? STFU and click!
${firstScreenBottomQuote}  If you don't like this page, it's Applifting's fault.
${firstPageWarning}  Team name contains forbidden characters
${wrongName}
@{unsupportedCharacters}  @  ,  .  /  '  ;  ]  [  =  -  *  `  !  ?  "  |  }  ]  {  [  +  _  %  ^  &  (  )  #  $
${firstScreenTopLink}  STFUANDCLICK.COM
*** Keywords ***
Load
    Go To  ${url}

Verify Page
    Wait Until Page Contains  ${firstScreenTextboxTitle}  ${timeout}

Verify Page Content
    Page Should Contain Element  ${firstScreenHeader}
    Page Should Contain Element  ${firstScreenClickButton}
    Page Should Contain Element  ${firstScreenBlockQuote}
    Page Should Contain Element  ${firstScreenTextbox}
    Page Should Contain  ${firstScreenTextboxTitle}
    Page Should Contain  ${firstScreenClickButtonLabel}
    Page Should Contain  ${firstScreenTableTitle}
    Page Should Contain Element  ${firstScreenTable}
    Page Should Contain  ${firstScreenTableHeader1}
    Page Should Contain  ${firstScreenTableHeader2}
    Page Should Contain  ${firstScreenTableQuote}
    Page Should Contain  ${firstScreenBottomQuote}

Submit Existing Team Name
    [Arguments]  ${existingName}
    Input Text  ${firstScreenTextbox}  ${existingName}
    Click Button  ${firstScreenClickButton}

Type New Name Into Textbox
    [Arguments]  ${newName}
    Input Text  ${firstScreenTextbox}  ${newName}
    Click Button  ${firstScreenClickButton}

Type Incorrect Name Into Textbox
    :For  ${wrongName}  IN  @{unsupportedCharacters}
        Input Text  ${firstScreenTextbox}  ${wrongName}
        Sleep  2s
        Click Button  ${firstScreenClickButton}
        Wait Until Page Contains  ${firstPageWarning}  15
        Press Keys  ${firstScreenTextbox}  BACKSPACE
    END

Check Applifting Link
    Click Link  Applifting
    Sleep  2s
    Location Should Be  https://www.applifting.cz/

Click In And Out The Text Box
    Click Element  ${firstScreenTextbox}
    Click Element  ${firstScreenBlockQuote}

Verify No Warnings Are Thrown
    Wait Until Page Contains  ${firstPageWarning}
    Page Should Not Contain  ${firstPageWarning}

Verify Warning Was Thrown
    Wait Until Page Contains  ${firstPageWarning}

Hit The Top Link
    Click Link  ${firstScreenTopLink}

Verify The Page Was Reloaded
    Page Should Not Contain  ${firstPageWarning}

