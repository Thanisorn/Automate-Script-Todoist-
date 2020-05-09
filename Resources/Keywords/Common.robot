*** Settings ***
Documentation     Common Keyword For Automated Test [Todoist]

*** Keywords ***

#Keyword  Description       : Test Setup Step
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return 
#Keywords Create by         : Biw 09/05/2020
Test Setup Step
    Open Web Todoist

#Keyword  Description       : Test TearDown Step
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return 
#Keywords Create by         : Biw 09/05/2020
Test TearDown Step
    Logout Web Todoist
    Close All Browsers

#Keyword  Description       : Open Web Todoist
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Open Web Todoist
    Open Browser                ${URL}                             ${BROWSER}
    Sleep                       2s 
    Maximize Browser Window
    ${flagHomePage}             Run Keyword And Return Status      Wait Until Page Contains                 todoist            3s
    Run Keyword If              '${flagHomePage}' == 'True'        Log              Passed, Open Web Todoist Success.
    ...  ELSE                   Fail                               Failed, Can Not Open Web Todoist.

#Keyword  Description       : Logout Web Todoist 
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Logout Web Todoist 
    Sleep                         5s
    ${flagButtonLogoutFound}      Run Keyword And Return Status             Click Element        ${IconSetting}
    Run Keyword If                '${flagButtonLogoutFound}' != 'True'      Fail                 Failed, Don't Find Icon Setting.                  
    Set Focus To Element          ${ButtonLogout}
    Click Element                 ${ButtonLogout}  
    ${flagLogout}                 Run Keyword And Return Status             Wait Until Page Contains      todoist                    3s         
    Run keyword if                '${flagLogout}' == 'True'       Log       Passed, Logout success
    ...       ELSE                Fail           Failed, Cannot Logout

#Keyword  Description       : Register with Email and Password
#Keyword  Require Argument  : ${EmailRegis},${UserNameRegis}, ${PasswordRegis}
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Register with Email and Password            
    [Arguments]                 ${EmailRegis}      ${UserNameRegis}       ${PasswordRegis}
    ${flagFoundRegist}          Run Keyword And Return Status             Wait Until Element Is Visible       ${BtnSignup}             5s
    Run Keyword If              '${flagFoundRegist}' != 'True'            Fail                                Failed, Don't Find Button Register.
    Click Element               ${BtnSignup}
    Sleep                       2s
    Input Text                  ${TextboxEmail}                 ${EmailRegis}
    Click Element               ${BtnSignupEmailOne}
    Wait Until Element Is Visible       ${TextboxName}          3s
    Input Text                  ${TextboxName}                  ${UserNameRegis}
    Input Text                  ${TextboxPassword}              ${PasswordRegis}
    Click Element               ${BtnSignupEmailTwo}
    Wait Until Element Is Visible       ${BtnLetgo}             3s 
    Click Element               ${BtnLetgo}
    Wait Until Element Is Visible       ${BtnCreate}            3s 
    Click Element               ${BtnCreate}
    Wait Until Element Is Visible       ${BtnOpen}              3s 
    Click Element               ${BtnOpen}
    ${flagRegistSuccess}        Run Keyword And Return Status       Wait Until Page Contains               Welcome               3s
    Run Keyword If              '${flagRegistSuccess}' != 'True'    Fail      Failed, Register Not Success.

#Keyword  Description       : Login with Email and Password
#Keyword  Require Argument  : ${EmailLogin} ,${PasswordLogin}
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Login with Email and Password
    [Arguments]                 ${EmailLogin}              ${PasswordLogin}
    ${flagFoundLogin}           Run Keyword And Return Status            Wait Until Element Is Visible       ${ButtonLogin}     3s
    Run Keyword If              '${flagFoundLogin}' != 'True'            Fail       Failed, Don't Find Button Login.
    Click Element               ${ButtonLogin}
    Wait Until Element Is Visible          ${LocatorEmail}               3s 
    Input Text                  ${LocatorEmail}             ${EmailLogin}  
    Input Text                  ${LocatorPassword}          ${PasswordLogin} 
    Click Element               ${Login} 
    Sleep                       3s
    ${flagClicked}              Run Keyword And Return Status          Wait Until Page Contains            Today        3s
    Run Keyword If              '${flagClicked}' == 'True'             Log     Passed, Login Web Success.
    ...  ELSE                   Fail       Failed, Login Web Not Success.

#Keyword  Description       : Create New Task
#Keyword  Require Argument  : ${ListNewTask} ==> List Task  Exp.  Test1,Today  Test2,Tomorrow
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Create New Task
    [Arguments]                 ${ListNewTask} 
    Sleep                       5s
    Click Element               ${IconAddTask} 
    ${LenList}                  Get Length                      ${ListNewTask}
    FOR    ${i}    IN RANGE     ${LenList}
        ${GetData}                  Set Variable                ${ListNewTask[${i}]}
        @{Str_NewTask}              Split String                ${GetData}                 ,
        ${TaskName}                 Set Variable                ${Str_NewTask[0]} 
        ${Duedate}                  Set Variable                ${Str_NewTask[1]} 
        Sleep                       2s
        Input Text                  ${TextboxTaskName}          ${TaskName}
        ${Duedate}         Set Variable If
        ...          '${Duedate}' == 'Today'                    ${LocatorToday}
        ...          '${Duedate}' == 'Tomorrow'                 ${LocatorTomorrow}
        ...          '${Duedate}' == 'NextWeek'                 ${LocatorNextWeek}
        ...          '${Duedate}' == 'NoDate'                   ${LocatorNodate}                      
        Click Element               ${TextboxDuedate}
        Click Element               ${Duedate}
        Click Element               ${BtnSaveTask}
        ${flagClicked}              Run Keyword And Return Status          Wait Until Page Contains             ${TaskName}             3s
        Run Keyword If              '${flagClicked}' == 'True'             Log     Passed, Create New Task Success.
        ...  ELSE                   Fail       Failed, Create New Task Not Success.
    END

#Keyword  Description       : Update Task
#Keyword  Require Argument  : ${ListUpdateTask} ==> List Task  Exp.  TaskEdit,NewTask,NewDate,NewPriority  [กรณีไม่ต้องการแก้ไข Priority ใส่คำว่า null]
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Update Task
    [Arguments]                 ${ListUpdateTask}
    Sleep                       5s
    ${LenList}                  Get Length                      ${ListUpdateTask}
    FOR    ${i}    IN RANGE     ${LenList}
        ${GetData}                  Set Variable                ${ListUpdateTask[${i}]}
        @{Str_NewTask}              Split String                ${GetData}                 ,
        ${TaskName}                 Set Variable                ${Str_NewTask[0]} 
        ${UpdateTaskName}           Set Variable                ${Str_NewTask[1]} 
        ${UpdateDuedate}            Set Variable                ${Str_NewTask[2]}
        ${UpdatePriority}           Set Variable                ${Str_NewTask[3]}
        Click Element               //div[@class='task_item_content_text' and contains(text(),'${TaskName}')]
        Click Element               //span[contains(text(),'${TaskName}')]
        Sleep                       2s
        Input Text                  ${TextboxTaskName}          ${UpdateTaskName}
        ${UpdateDuedate}         Set Variable If
        ...          '${UpdateDuedate}' == 'Today'              ${LocatorToday}
        ...          '${UpdateDuedate}' == 'Tomorrow'           ${LocatorTomorrow}
        ...          '${UpdateDuedate}' == 'NextWeek'           ${LocatorNextWeek}
        ...          '${UpdateDuedate}' == 'NoDate'             ${LocatorNodate}                      
        Click Element               ${TextboxDuedate}
        Click Element               ${UpdateDuedate}
        Click Element               ${BtnSaveTask}
        Sleep                       2s
        Run Keyword If              '${UpdatePriority}' != 'null'          Select Priority Task        ${UpdatePriority}
        ${flagClicked}              Run Keyword And Return Status          Click Element               ${btnClosePopup}   
        Run Keyword If              '${flagClicked}' == 'True'             Log     Passed, Update Task Success.
        ...  ELSE                   Fail       Failed, Update Task Not Success.
    END

#Keyword  Description       : Select Priority Task
#Keyword  Require Argument  : ${UpdatePriority}
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Select Priority Task
    [Arguments]                 ${UpdatePriority}
    Click Element               ${BtnPriority}
    ${SelectPriority}           Set Variable If
        ...          '${UpdatePriority}' == '1'             ${LocatorPri1}
        ...          '${UpdatePriority}' == '2'             ${LocatorPri2}
        ...          '${UpdatePriority}' == '3'             ${LocatorPri3}
        ...          '${UpdatePriority}' == '4'             ${LocatorPri4} 
    Sleep                       2s
    Click Element               ${SelectPriority} 

#Keyword  Description       : Delete Task
#Keyword  Require Argument  : ${ListDeleteTask}
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Delete Task
    [Arguments]                 ${ListDeleteTask}
    Sleep                       5s  
    @{ListDelete}               Split String            ${ListDeleteTask}     ,
    ${LenList}                  Get Length              ${ListDelete} 
    FOR    ${i}    IN RANGE     ${LenList}
        Click Element           //div[@class='task_item_content_text' and contains(text(),'${ListDelete[${i}]}')]
        Sleep                   3s
        Click Element           ${btnMore}
        Click Element           ${IconDeleteTask} 
        ${flagClicked}          Run Keyword And Return Status           Click Element           ${BtnDeleteTask} 
        Run Keyword If          '${flagClicked}' == 'True'              Log     Passed, Delete Task Success.
        ...  ELSE               Fail       Failed, Delete Task Not Success.
    END

#Keyword  Description       : Sort Task List by Name 
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
#[เนื่องจากทำการ get leght จากหน้าจอแล้ว ตัว robot get จำนวนมาได้ไม่เท่ากับที่หาจาก xpath เลยใช้วิธีการแคปรูปภาพไปก่อน]
Sort Task List by Name
    Sleep                       2s
    Click Element               ${MenuInbox}
    Sleep                       2s
    Click Element               ${IconGear} 
    Click Element               ${BtnSorybyName}
    Capture Page Screenshot

#Keyword  Description       : Sort Task List by Priority 
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
#[เนื่องจากทำการ get leght จากหน้าจอแล้ว ตัว robot get จำนวนมาได้ไม่เท่ากับที่หาจาก xpath เลยใช้วิธีการแคปรูปภาพไปก่อน]
Sort Task List by Priority 
    Sleep                       2s
    Click Element               ${MenuInbox}
    Sleep                       2s
    Click Element               ${IconGear} 
    Click Element               ${BtnSorybyPriority}
    Capture Page Screenshot

#Keyword  Description       : Sort Task List by Date 
#Keyword  Require Argument  : Not Argument
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
#[เนื่องจากทำการ get leght จากหน้าจอแล้ว ตัว robot get จำนวนมาได้ไม่เท่ากับที่หาจาก xpath เลยใช้วิธีการแคปรูปภาพไปก่อน]
Sort Task List by Date
    Sleep                       2s
    Click Element               ${MenuInbox}
    Sleep                       2s
    Click Element               ${IconGear} 
    Click Element               ${BtnSorybyDate}
    Capture Page Screenshot

#Keyword  Description       : Delete User Success 
#Keyword  Require Argument  : ${PasswordLogin}
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Delete User Success 
    [Arguments]                 ${PasswordLogin}
    Sleep                       2s
    Click Element               ${IconSettingMenu} 
    Click Element               ${MenuSettingDelete}
    Scroll To Element           ${BtnDeleMyAccount}
    Wait Until Element Is Visible       ${BtnDeleMyAccount}        2s
    Click Element               ${BtnDeleMyAccount}
    Input Text                  ${TextboxCurrentPass}              ${PasswordLogin}
    Click Element               ${BtnConfrimDele} 
    ${flagDeleSuccess}          Run Keyword And Return Status           Wait Until Page Contains               Log in               3s
    Run Keyword If          '${flagDeleSuccess}' == 'True'              Log     Passed, Delete Account Success.
    ...  ELSE               Fail       Failed, Delete Account Not Success.

#Keyword  Description       : Scroll To Element 
#Keyword  Require Argument  : ${xpath}
#Keyword  Return            : Not Return
#Keywords Cretae by         : Biw 09/05/2020
Scroll To Element 
	[Arguments]             ${xpath}
	${xpath1} =             Replace String      ${xpath}        xpath=    ${EMPTY}
    Execute Javascript      document.evaluate("${xpath1}",document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.scrollIntoView(true);
