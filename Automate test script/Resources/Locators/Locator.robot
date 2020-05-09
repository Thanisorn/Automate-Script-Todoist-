*** Settings ***
Documentation     Locator For Todoist

*** Variables ***

################# Register Page ##############################################################

${BtnSignup}                xpath=//a[@class='_1uuJG' and contains(text(),'Signup')]             
${TextboxEmail}             xpath=//input[@id='email']
${BtnSignupEmailOne}        xpath=//button[@id='step_one_submit']
${TextboxName}              xpath=//input[@id='full_name']
${TextboxPassword}          xpath=//input[@id='pwd']
${BtnSignupEmailTwo}        xpath=//button[@id='step_two_submit']
${BtnLetgo}                 xpath=//button[@class='tdo-button js-slide-load js-cta' and @data-slide-load='2']
${BtnCreate}                xpath=//button[@class='tdo-button js-slide-load js-cta' and @data-slide-load='3']
${BtnOpen}                  xpath=//a[@class='tdo-button js-cta js-cta-finish']

################# Login Page #################################################################

${ButtonLogin}              xpath=//a[@class='_1uuJG']//..//preceding::a[contains(text(),'Login')]
${LocatorEmail}             xpath=//input[@id='email']      
${LocatorPassword}          xpath=//input[@id='password'] 
${Login}                    xpath=//button[@class='submit_btn ist_button ist_button_red sel_login']
${IconHome}                 xpath=//button[@aria-label='Main menu']//..//preceding::button[@class='top_bar_btn']

################# Logout Page ################################################################

${IconSetting}              xpath=//button[@aria-owns='setting_menu']
${ButtonLogout}             xpath=//div[contains(text(),'Log out')]

################# New Task Page ##############################################################

${IconAddTask}              xpath=//span[@class='icon icon_add']
${TextboxTaskName}          xpath=//div[@class='notranslate public-DraftEditor-content']
${LocatorToday}             xpath=//div[@class='scheduler-suggestions-item-label' and contains(text(),'Today')]
${LocatorTomorrow}          xpath=//div[@class='scheduler-suggestions-item-label' and contains(text(),'Tomorrow')]
${LocatorNextWeek}          xpath=//div[@class='scheduler-suggestions-item-label' and contains(text(),'Next week')]
${LocatorNodate}            xpath=//div[@class='scheduler-suggestions-item-label' and contains(text(),'No Date')]
${BtnSaveTask}              xpath=//button[@class='item_editor_submit ist_button ist_button_red']
${TextboxDuedate}           xpath=//div[@class='item_editor_assign']

################# Update Task Page ##########################################################

${btnClosePopup}            xpath=//button[@class='item_detail_close']
${BtnPriority}              xpath=//button[@class='item_action item_actions_priority']
${LocatorPri1}              xpath=//span[@class='priority_picker_item_name' and contains(text(),'Priority 1') ]
${LocatorPri2}              xpath=//span[@class='priority_picker_item_name' and contains(text(),'Priority 2') ]
${LocatorPri3}              xpath=//span[@class='priority_picker_item_name' and contains(text(),'Priority 3') ]
${LocatorPri4}              xpath=//span[@class='priority_picker_item_name' and contains(text(),'Priority 4') ]

################# Delete Task Page ##########################################################

${btnMore}                  xpath=//button[@class='item_action item_actions_more']
${IconDeleteTask}           xpath=//div[@class='icon_menu_item__content' and contains(text(),'Delete task')]
${BtnDeleteTask}            xpath=//footer[@class='reactist_modal_box__actions confirm_dialog__actions']//..//..//button[@class='ist_button ist_button_red' and @type='submit']

################# Sort Task Page ############################################################
${MenuInbox}                xpath=//li[@id='filter_inbox']
${IconGear}                 xpath=//button[@class='gear_icon icon']
${BtnSorybyName}            xpath=//div[@class='menu_label' and contains(text(),'Sort by name')]
${BtnSorybyPriority}        xpath=//div[@class='menu_label' and contains(text(),'Sort by priority')]
${BtnSorybyDate}            xpath=//div[@class='menu_label' and contains(text(),'Sort by date')]

################# Delete Accout Page ############################################################

${IconSettingMenu}          xpath=//button[@aria-owns='setting_menu']
${MenuSettingDelete}        xpath=//div[@class='usermenu__row-label' and contains(text(),'Settings')]
${BtnDeleMyAccount}         xpath=//a[@class='ist_button_hallow delete_account']    
${TextboxCurrentPass}       xpath=//input[@class='current_password']
${BtnConfrimDele}           xpath=//a[@class='ist_button ist_button_big ist_button_red']