*** Settings ***
Library  Process

*** Test Cases ***

Verify devices accessible through adb
    ${result}=  run process  adb  devices
    Should be equal  ${result.rc}  ${0}
    Should not match  ${result.stdout}  *failed to connect*

