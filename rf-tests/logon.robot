*** Test Cases ***
Logon with valid credentials
    [Tags]  regression  intake
    Sleep  0.5  it takes a little while to logon.
    Pass execution  Done

Logon with invalid username
    [Tags]  regression
    Sleep  1.0  it takes a little while to check for the username
    Pass execution  Done

Logon with invalid password
    [Tags]  regression
    Sleep  1.5  it takes a little while to check for the password
    Pass execution  Done

Logon with systemuser
    [Tags]  intake
    Sleep  0.1  superusers are always faster
    Pass execution  Done