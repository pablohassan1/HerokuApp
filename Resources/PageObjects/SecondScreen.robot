*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${seconScreenHeader}  //*[@id="root"]/header/h1/a
${seconScreenTopQuote}  //*[@id="root"]/div
${seconScreenUrlToShareBox}  //*[@id="root"]/div/input
${seconScreenIncorrectUrlToSharetext}  stfuandclick.com/
${secondScreenTable}  //*[@id="root"]/div/main/div[2]/div/table
${secondScreenTableRow}  4
${secondScreenTableColumn}  3
${secondScreenClickButton}  //*[@id="root"]/div/main/div[1]/button
${secondScreenClickButtonText}  CLICK!
${secondScreenTableQuote}  Want to be top? STFU and click!
${secondScreenBottomQuote}  If you don't like this page, it's Applifting's fault.
${secondScreenSelectedTeamClicks}  //div[2]//p[1]
${seconScreenUcorrectUrlToShare}  test-stfu-applifting.herokuapp.com/

*** Keywords ***
Verify Page
    Page Should Contain Element  ${seconScreenHeader}

Verify Existing Team Name And Clicks Count
    [Arguments]  ${existingName}  ${firstScreenClicksCount}
    Wait Until Element Contains  ${seconScreenTopQuote}  ${existingName}
    Element Attribute Value Should Be  ${seconScreenUrlToShareBox}  value  ${seconScreenIncorrectUrlToSharetext}${existingName}
    #Element Attribute Value Should Be  //*[@id="root"]/div/input  value  test-stfu-applifting.herokuapp.com/${existingName}
    Table Cell Should Contain  ${secondScreenTable}  ${secondScreenTableRow}  ${secondScreenTableColumn}  ${firstScreenClicksCount}

Verify Second Screen Page Content
    Page Should Contain Element  ${seconScreenHeader}
    Element Should Contain  ${secondScreenClickButton}   ${secondScreenClickButtonText}
    Page Should Contain  ${secondScreenTableQuote}
    Page Should Contain  ${secondScreenBottomQuote}

Verify New Team Name And Clicks Count
    [Arguments]  ${newName}
    Wait Until Element Contains  ${seconScreenTopQuote}  ${newName}
    Element Attribute Value Should Be  ${seconScreenUrlToShareBox}  value  ${seconScreenIncorrectUrlToSharetext}${newName}
    #Element Attribute Value Should Be  //*[@id="root"]/div/input  value  test-stfu-applifting.herokuapp.com/${newName}
    Wait Until Element Contains  ${secondScreenSelectedTeamClicks}  1

User Clicks on Second Screen
    Click Button  ${secondScreenClickButton}

Verify Clicks
    [Arguments]  ${clicksCount}
    ${clicksCount}  Convert to Integer  ${clicksCount}
    ${clicksCount}=  Evaluate  ${clicksCount}+1
    ${clicksCount}  Convert to String  ${clicksCount}
    Sleep  2s
    ${clicksCount2}  Get Text  ${secondScreenSelectedTeamClicks}
    ${clicksCount2}  Convert to Integer  ${clicksCount2}
    ${clicksCount2}  Convert to String  ${clicksCount2}
    Should Be Equal  ${clicksCount}  ${clicksCount2}

Check Team URL
    Element Should Contain  ${seconScreenUrlToShareBox}  ${seconScreenUcorrectUrlToShare}

Check Applifting Link
    Click Link  Applifting
    Sleep  2s
    Location Should Be  https://www.applifting.cz/
