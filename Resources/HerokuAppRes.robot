*** Settings ***
Library  String

Resource  ../Resources/PageObjects/FirstScreen.robot
Resource  ../Resources/PageObjects/SecondScreen.robot

*** Variables ***
${firstScreenTable}  //*[@id="root"]/div/main/div[2]/div[2]/table
${firstScreenTableRow}  4
${firstScreenTableNameColumn}  2
${firstScreenTableClicksColumn}  3
${newTeamNameLength}  8
${newTeamNameCharType}  [LETTERS][NUMBERS]
${secondScreenUserClicks}  //div[1]//p[1]
${secondScreenSelectedTeamClicks}  //div[2]//p[1]

*** Keywords ***
Open App
    FirstScreen.Load

Verify First Screen
    FirstScreen.Verify Page

Verify First Screen Elements
    FirstScreen.Verify Page Content

Verify Second Screen
    SecondScreen.Verify Page

Verify Second Screen Content
    SecondScreen.Verify Second Screen Page Content

Submit Existing Team Name
    Sleep  2s
    ${existingName}  Get Table Cell  ${firstScreenTable}  ${firstScreenTableRow}  ${firstScreenTableNameColumn}
    ${clicksCount}  Get Table Cell  ${firstScreenTable}  ${firstScreenTableRow}  ${firstScreenTableClicksColumn}
    FirstScreen.Submit Existing Team Name  ${existingName}
    SecondScreen.Verify Existing Team Name And Clicks Count  ${existingName}  ${clicksCount}

Submit New Team Name
    ${newName}  Generate Random String  ${newTeamNameLength}  ${newTeamNameCharType}
    FirstScreen.Type New Name Into Textbox  ${newName}
    SecondScreen.Verify New Team Name And Clicks Count  ${newName}

Click And Verify Click Count
    Wait Until Element Does Not Contain  ${secondScreenSelectedTeamClicks}  ''  15
    Sleep  1s
    ${clicksCount}  Get Text  ${secondScreenSelectedTeamClicks}
    SecondScreen.User Clicks on Second Screen
    SecondScreen.Verify Clicks  ${clicksCount}

Submit New Team Name Starting With Unsupported Characters
    FirstScreen.Type Incorrect Name Into Textbox

Verify Team URL
    SecondScreen.Check Team URL

Verify Applifting Link On First Screen
    FirstScreen.Check Applifting Link

Verify Applifting Link On Second Screen
    SecondScreen.Check Applifting Link

Verify Textbox Functionality
    FirstScreen.Click In And Out The Text Box
    FirstScreen.Verify No Warnings Are Thrown

Change State Of First Screen
    FirstScreen.Click In And Out The Text Box
    FirstScreen.Verify Warning Was Thrown

Verify The Link Functionality
    FirstScreen.Hit The Top Link
    FirstScreen.Verify The Page Was Reloaded





