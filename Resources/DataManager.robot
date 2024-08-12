*** Settings ***
Documentation    Use this layer to get data from external files
Library    ../Libraries/Csv.py

*** Keywords ***
Get CSV Data
    [Arguments]    ${FileName}
    ${Data} =    read csv file   ${FileName}
    RETURN    ${Data}