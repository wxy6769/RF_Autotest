*** Settings ***
Library           Selenium2Library

*** Variables ***
${host}           http://192.168.0.239/
${browser}        chrome
${user}           admin
${pswd}           password
${newfwpath}      C:${/}Users${/}102710.SNGROUP01${/}Desktop${/}Robot Framework${/}ECS-RTL83xx_fw_1.1.13-2.01.055_20190912-1723.imag
${oldfwpath}      C:${/}Users${/}102710.SNGROUP01${/}Desktop${/}Robot Framework${/}ECS-RTL83xx_fw_1.1.12-2.01.053_20190904-1359.imag
${blockUI}        xpath=//div[@class='blockUI']
${i}              0
${re}             5
${fwVersionID}    fw_version

*** Test Cases ***
case_login
    Proceed With Login Page

Login and get fw ver.
    Proceed With Login Page
    Get Current FW Version    ${fwVersionID}

Do Firmware Upgrade
    Proceed With Login Page
    Turn Page to Upgrade
    Choose File To Upgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Upgrade finish.
    Reboot
    Log    Reboot finish.

Do Firmware Downgrade
    Proceed With Login Page
    Turn Page to Upgrade
    Choose File To Downgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Downgrade finish.
    Reboot
    Log    Reboot finish.

Repeat Up And Down
    #-------------------------------------------------------------------
    #----想辦法改成for-loop-case----------------------------------------
    #-------------------------------------------------------------------
    FOR    ${i}    IN RANGE    0    ${re}
    Proceed With Login Page
    Get Current FW Version    ${fwVersionID}
    Turn Page to Upgrade
    Choose File To Upgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Loading finish.
    Reboot
    Log    Reboot finish, then downgrade, it's round ${i}.
    Proceed With Login Page
    Get Current FW Version    ${fwVersionID}
    Turn Page to Upgrade
    Choose File To Downgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Loading finish.
    Reboot
    Log    Reboot finish, then upgrade, it's round ${i}.

for loop test
    #Open browser    ${host}    ${browser}
    FOR    ${i}    IN RANGE    0    ${re}
    Log    ${i}

*** Keywords ***
Open Chrome
    Open Browser    ${host}    ${browser}

Proceed With Login Page
    Wait Until Page Contains Element    id=usr    300
    Input text    id=usr    ${user}
    Input password    id=pswrd    ${pswd}
    Click button    id=btnPwd
    Wait Until Page Contains Element    ${blockUI}    10    #網頁第一次載入，在進度條出現前有段空檔，所以要等進度條出現
    Wait Until Page Does Not Contain Element    ${blockUI}    10    #等待進度條出現後再等待它消失

Turn Page to Upgrade
    Click Element    xpath=//*[@id="toolbtns"]/button[2]/i[@class='icon-download']
    Log    Page jump to Upgrade
    Wait Until Page Contains Element    ${blockUI}    10
    Wait Until Page Does Not Contain Element    ${blockUI}    10

Choose File To Upgrade
    Choose file    upgradefile    ${newfwpath}

Choose File To Downgrade
    Choose file    upgradefile    ${oldfwpath}

Double Check And Wait
    Click element    id=btnApply
    Click element    xpath=//*[contains(@id, "cnf_okbtn")]

Upgrade Confirm
    Wait Until Element Is Visible    id=upgrade    300
    Click Element    id=upgrade

Reboot
    Wait Until Element Is Visible    id=reboot    300
    Click Element    id=reboot

Get Current FW Version
    [Arguments]    ${fwVersionID}
    ${fwVersion}    Get Text    id=${fwVersionID}
    [Return]    ${fwVersion}
