*** Settings ***
Documentation           This Testcase of Todoist
Test Setup              Test Setup Step
Resource                ..//Resources//init.txt
Resource                ..//TestData//InputData.robot 
Resource                ..//Resources//Locators//Locator.robot  
         
*** Test Cases ***
#ตรวจสอบการแสดงผล หน้าลงทะเบียนสำเร็จ
TC001_Register with Email and Password Success
    [Documentation]     Testcase Name : Register with Email and Password Success | Description : ตรวจสอบการแสดงผล หน้าลงทะเบียนสำเร็จ
    Register with Email and Password            ${EmailRegis}       ${UserNameRegis}      ${PasswordRegist}
    Close All Browsers