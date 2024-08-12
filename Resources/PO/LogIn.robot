*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNIN_PAGE_VERIFIER_HEADING} =       css = .mr-5
${SIGNIN_PAGE_VERIFIER_ELEMENTS_1} =    xpath = //label[.='E-Posta']
${SIGNIN_PAGE_VERIFIER_ELEMENTS_2} =    xpath = //label[.='Şifre']
${USER_EMAIL_ELEMENT} =                 xpath=//*[@id="login-email"]
${USER_PASSWORD_ELEMENT} =              xpath=//*[@id="login-password-input"]
${SUBMIT_BUTTON} =                      css = .q-primary
${errorMessaage}
${user}
${email}

*** Keywords ***
Verify Page Loaded
    page should contain element     ${SIGNIN_PAGE_VERIFIER_HEADING}
    element text should be          ${SIGNIN_PAGE_VERIFIER_HEADING}  Giriş Yap

    page should contain element     ${SIGNIN_PAGE_VERIFIER_ELEMENTS_1}
    element text should be          ${SIGNIN_PAGE_VERIFIER_ELEMENTS_1}    E-Posta

    page should contain element     ${SIGNIN_PAGE_VERIFIER_ELEMENTS_2}
    element text should be          ${SIGNIN_PAGE_VERIFIER_ELEMENTS_2}    Şifre

Enter Credentials
    [Arguments]     ${LoginScenario}
    Clear Element Text      ${USER_EMAIL_ELEMENT}
    input text              ${USER_EMAIL_ELEMENT}      ${LoginScenario[0]}
    Clear Element Text      ${USER_PASSWORD_ELEMENT}
    input text              ${USER_PASSWORD_ELEMENT}      ${LoginScenario[1]}

Verify Error Message
    [Arguments]     ${LoginScenario}
    page should contain    ${LoginScenario[2]}

Login With Valid Credentials
    [Arguments]    ${USER}
    Fill Email Field        ${USER}
    sleep    .3s
    Fill Pasword Field      ${USER}
    sleep    .3s
    Click Submit Button
    sleep    3s

Fill Email Field
    [Arguments]     ${USER}
    Clear Element Text      ${USER_EMAIL_ELEMENT}
    input text      ${USER_EMAIL_ELEMENT}      ${USER.Email}

Fill Pasword Field
    [Arguments]     ${USER}
    Clear Element Text      ${USER_PASSWORD_ELEMENT}
    input text    ${USER_PASSWORD_ELEMENT}      ${USER.Password}

Click Submit Button
    click button    ${SUBMIT_BUTTON}



