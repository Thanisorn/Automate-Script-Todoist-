*** Settings ***
Documentation           This Testcase of Todoist
Test Setup              Test Setup Step
Test Teardown           Test TearDown Step
Resource                ..//Resources//init.txt
Resource                ..//TestData//InputData.robot 
Resource                ..//Resources//Locators//Locator.robot  
         
*** Test Cases ***
   
#ตรวจสอบการแสดงผล หน้าเข้าสู่ระบบสำเร็จ
TC001_Login with Email and Password Success
    [Documentation]     Testcase Name : Login with Email and Password Success | Description : ตรวจสอบการแสดงผล หน้าเข้าสู่ระบบสำเร็จ    
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}

#ตรวจสอบการแสดงผล หน้าสร้าง task สำเร็จ
TC002_Create New Task Success 
    [Documentation]     Testcase Name : Create New Task Success | Description : ตรวจสอบการแสดงผล หน้าสร้าง task สำเร็จ   
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Create New Task     ${ListNewTask} 

#ตรวจสอบการแสดงผล หน้าอัพเดรต task สำเร็จ
TC003_Update Task Success 
    [Documentation]     Testcase Name : Update Task Success  | Description : ตรวจสอบการแสดงผล หน้าอัพเดรต task สำเร็จ   
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Update Task         ${ListUpdateTask}

#ตรวจสอบการแสดงผล หน้าลบ task สำเร็จ
TC004_Delete Task Success 
    [Documentation]     Testcase Name : Delete Task Success  | Description : ตรวจสอบการแสดงผล หน้าลบ task สำเร็จ   
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Delete Task         ${ListDeleteTask}

#ตรวจสอบการแสดงผล หน้าเรียงลำดับ task จากชื่อสำเร็จ
TC005_Sort Task List by Name Success 
    [Documentation]     Testcase Name : Sort Task List by Name  | Description : ตรวจสอบการแสดงผล หน้าเรียงลำดับ task จากชื่อสำเร็จ  
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Sort Task List by Name        

#ตรวจสอบการแสดงผล หน้าเรียงลำดับ task จากลำดับความสำคัญสำเร็จ
TC006_Sort Task List by Priority Success 
    [Documentation]     Testcase Name : Sort Task List by Priority  | Description : ตรวจสอบการแสดงผล หน้าเรียงลำดับ task จากลำดับความสำคัญสำเร็จ 
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Sort Task List by Priority        
  
#ตรวจสอบการแสดงผล หน้าเรียงลำดับ task จากเวลาสำเร็จ
TC007_Sort Task List by Date Success 
    [Documentation]     Testcase Name : Sort Task List by Date  | Description : ตรวจสอบการแสดงผล หน้าเรียงลำดับ task จากเวลาสำเร็จ 
    Login with Email and Password               ${EmailLogin}       ${PasswordLogin}
    Sort Task List by Date   