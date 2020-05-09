*** Variables ***

################# Register Page ########################################################################
${EmailRegis}               biw@jenosize.com
${UserNameRegis}            Automate
${PasswordRegist}           Test0123456 

################# Login Page ###########################################################################
${EmailLogin}               biw@jenosize.com
${PasswordLogin}            Test0123456 

################# New Task Page #######################################################################
@{ListNewTask}              Task1,Today   Task2,Today   Active,Today    Sharing,Today   Knowlege,Today

################# Update Task Page ####################################################################
@{ListUpdateTask}           Task1,(Edit),Today,null    Task2,(Edit),Today,null   Active,Leanning,Tomorrow,2    Sharing,(Edit),Today,1   Knowlege,(Edit),Today,3

################# Delete Task Page ####################################################################
${ListDeleteTask}           Task1(Edit),Task2(Edit)
