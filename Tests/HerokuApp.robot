*** Settings ***
Documentation  Heroku App automated test suite

Resource  ../Resources/CommonFunctionality.robot
Resource  ../Resources/HerokuAppRes.robot

Test Setup  CommonFunctionality.Start Test
Test Teardown  CommonFunctionality.End Test

*** Variables ***
${browser}  chrome

*** Test Cases ***
Test Case 1 - App should open at the first screen
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen

Test Case 2 - First screen contains required elements
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Verify First Screen Elements

Test Case 3 - User can create new team
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit New Team Name
    HerokuAppRes.Verify Second Screen

Test Case 4 - Second screen contains required elements
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit Existing Team Name
    HerokuAppRes.Verify Second Screen
    HerokuAppRes.Verify Second Screen Content

Test Case 5 - Existing team can start accumulating clicks
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit Existing Team Name
    HerokuAppRes.Verify Second Screen
    HerokuAppRes.Click And Verify Click Count

Test Case 6 - New team can start accumulating clicks
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit New Team Name
    HerokuAppRes.Verify Second Screen
    HerokuAppRes.Click And Verify Click Count

Test Case 7 - First screen text box does not allow special characters
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit New Team Name Starting With Unsupported Characters

Test Case 8 - First screen gets refreshed when clicking the top STFUANDCLICK.COM link
    [Tags]  bugs
    # This is supposed to fail since the link doesn't refresh the page
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Change State Of First Screen
    HerokuAppRes.Verify The Link Functionality

Test Case 9 - Second screen team-URL is correct
    [Tags]  bugs
    # This is supposed to fail since the link provided in the app is incorrect
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit Existing Team Name
    HerokuAppRes.Verify Second Screen
    HerokuAppRes.Verify Team URL

Test Case 10 - First screen Applifting link navigates to Applifting website
    [Tags]  bugs
    # This is supposed to fail since the link provided in the app is incorrect
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Verify Applifting Link On First Screen

Test Case 11 - Second screen Applifting link navigates to Applifting website
    [Tags]  bugs
    # This is supposed to fail since the link provided in the app is incorrect
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Submit New Team Name
    HerokuAppRes.Verify Second Screen
    HerokuAppRes.Verify Applifting Link On Second Screen

Test Case 12 - User can click in and out of the first screen text without seeing any warnings
    [Tags]  bugs
    # This is supposed to fail since the warning should not be thrown in this case
    HerokuAppRes.Open App
    HerokuAppRes.Verify First Screen
    HerokuAppRes.Verify Textbox Functionality
