<<<<<<< HEAD
*** Settings ***
Test Setup        Open Chrome
Library           Selenium2Library

*** Variables ***
${host}           http://172.20.1.169/
${browser}        chrome
${user}           araknis
${defpswd}        araknis
${newpswd}        aaaa
${newfwpath}      C:${/}Users${/}102710.SNGROUP01${/}Desktop${/}1909_SnapAV${/}AN-310-SW-16-POE_FW${/}an-310-sw-16-poe_fw_1.2.07_190808-1521.bix
${oldfwpath}      C:${/}Users${/}102710.SNGROUP01${/}Desktop${/}1909_SnapAV${/}AN-310-SW-16-POE_FW${/}an-310-sw-16-poe_fw_1.2.06_190808-1703.bix
${blockUI}        xpath=//div[@class='blockUI']
${i}              1
${re}             5
${fwVersionID}    fw_version

*** Test Cases ***
Do Firmware Upgrade
    Proceed With Login Page
    Turn Page to Upgrade
    Choose File To Upgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Upload firmware file finish.
    Reboot
    Log    Now Reboot.

Do Firmware Downgrade
    Proceed With Login Page
    Turn Page to Upgrade
    Choose File To Downgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Upload firmware file finish.
    Reboot
    Log    Now Reboot.

Repeat Up And Down
    : FOR    ${i}    IN RANGE    1    ${re}
    \    Proceed With Login Page
    \    Get Current FW Version    ${fwVersionID}
    \    Turn Page to Upgrade
    \    Choose File To Upgrade
    \    Double Check And Wait
    \    Upgrade Confirm
    \    Log    Loading finish.
    \    Reboot
    \    Log    Reboot finish, then downgrade, it's round ${i}.
    \    Proceed With Login Page
    \    Get Current FW Version    ${fwVersionID}
    \    Turn Page to Upgrade
    \    Choose File To Downgrade
    \    Double Check And Wait
    \    Upgrade Confirm
    \    Log    Loading finish.
    \    Reboot
    \    Log    Reboot finish, then upgrade, it's round ${i}.

Login and get fw ver.
    Proceed With Login Page
    Get Current FW Version    ${fwVersionID}

*** Keywords ***
Open Chrome
    Open Browser    ${host}    ${browser}

Proceed With Login Page
    Wait Until Page Contains Element    name=usr    300
    Input text    name=usr    ${user}
    Input password    name=pswrd    ${newpswd}
    Click button    id=btnPwd
    #---第一次登入的時候要更改預設密碼
    #Run Keyword If Page Should Contain Element
    #---------------------------------
    Wait Until Page Contains Element    ${blockUI}    10    #------------網頁第一次載入，在進度條出現前有段空檔，所以要等進度條出現
    Wait Until Page Does Not Contain Element    ${blockUI}    10    #---等待進度條出現後再等待它消失
    log    login finish

Turn Page to Upgrade
    Click Element    xpath=//*[@id="accordion"]/ul/li[3]/ul/li[3]/a[@url='mai_filemg.html']
    #Click Element
    Log    Page jump to Upgrade
    Wait Until Page Contains Element    ${blockUI}    10
    Wait Until Page Does Not Contain Element    ${blockUI}    10

Choose File To Upgrade
    Choose file    upgradefile    ${newfwpath}

Choose File To Downgrade
    Choose file    upgradefile    ${oldfwpath}

Double Check And Wait
    Click Element    id=fwUpBtn
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
=======
*** Settings ***
Test Setup        Open Chrome
Library           Selenium2Library

*** Variables ***
${host}           http://172.20.1.169/
${browser}        chrome
${user}           araknis
${defpswd}        araknis
${newpswd}        aaaa
${newfwpath}      C:${/}Users${/}102710.SNGROUP01${/}Desktop${/}1909_SnapAV${/}AN-310-SW-16-POE_FW${/}an-310-sw-16-poe_fw_1.2.07_190808-1521.bix
${oldfwpath}      C:${/}Users${/}102710.SNGROUP01${/}Desktop${/}1909_SnapAV${/}AN-310-SW-16-POE_FW${/}an-310-sw-16-poe_fw_1.2.06_190808-1703.bix
${blockUI}        xpath=//div[@class='blockUI']
${i}              1
${re}             5
${fwVersionID}    fw_version

*** Test Cases ***
Do Firmware Upgrade
    Proceed With Login Page
    Turn Page to Upgrade
    Choose File To Upgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Upload firmware file finish.
    Reboot
    Log    Now Reboot.

Do Firmware Downgrade
    Proceed With Login Page
    Turn Page to Upgrade
    Choose File To Downgrade
    Double Check And Wait
    Upgrade Confirm
    Log    Upload firmware file finish.
    Reboot
    Log    Now Reboot.

Repeat Up And Down
    : FOR    ${i}    IN RANGE    1    ${re}
    \    Proceed With Login Page
    \    Get Current FW Version    ${fwVersionID}
    \    Turn Page to Upgrade
    \    Choose File To Upgrade
    \    Double Check And Wait
    \    Upgrade Confirm
    \    Log    Loading finish.
    \    Reboot
    \    Log    Reboot finish, then downgrade, it's round ${i}.
    \    Proceed With Login Page
    \    Get Current FW Version    ${fwVersionID}
    \    Turn Page to Upgrade
    \    Choose File To Downgrade
    \    Double Check And Wait
    \    Upgrade Confirm
    \    Log    Loading finish.
    \    Reboot
    \    Log    Reboot finish, then upgrade, it's round ${i}.

Login and get fw ver.
    Proceed With Login Page
    Get Current FW Version    ${fwVersionID}

*** Keywords ***
Open Chrome
    Open Browser    ${host}    ${browser}

Proceed With Login Page
    Wait Until Page Contains Element    name=usr    300
    Input text    name=usr    ${user}
    Input password    name=pswrd    ${newpswd}
    Click button    id=btnPwd
    #---第一次登入的時候要更改預設密碼
    #Run Keyword If Page Should Contain Element
    #---------------------------------
    Wait Until Page Contains Element    ${blockUI}    10    #------------網頁第一次載入，在進度條出現前有段空檔，所以要等進度條出現
    Wait Until Page Does Not Contain Element    ${blockUI}    10    #---等待進度條出現後再等待它消失
    log    login finish

Turn Page to Upgrade
    Click Element    xpath=//*[@id="accordion"]/ul/li[3]/ul/li[3]/a[@url='mai_filemg.html']
    #Click Element
    Log    Page jump to Upgrade
    Wait Until Page Contains Element    ${blockUI}    10
    Wait Until Page Does Not Contain Element    ${blockUI}    10

Choose File To Upgrade
    Choose file    upgradefile    ${newfwpath}

Choose File To Downgrade
    Choose file    upgradefile    ${oldfwpath}

Double Check And Wait
    Click Element    id=fwUpBtn
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
>>>>>>> Update files.
