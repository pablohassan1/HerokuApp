*** Settings ***
Documentation  Common functionality for Heroku App automated test suite

Library  SeleniumLibrary

*** Keywords ***
Start Test
    Open Browser  about:blank  ${browser}
    Maximize Browser Window

End Test
    Close Browser




