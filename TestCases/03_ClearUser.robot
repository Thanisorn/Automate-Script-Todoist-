*** Settings ***
Documentation           This Testcase of Todoist
Test Setup              Test Setup Step
Resource                ..//Resources//init.txt
Resource                ..//TestData//InputData.robot 
Resource                ..//Resources//Locators//Locator.robot  
         
*** Test Cases ***
#ตรวจสอบการแสดงผล หน้าลบบัญชีผู้ใช้งาน
TC001_Delete User Success
    [Documentation]     Testcase Name : Delete User Successs | Description : ตรวจสอบการแสดงผล หน้าลบบัญชีผู้ใช้งาน
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Delete User Success                         ${PasswordLogin}
    Close All Browsers