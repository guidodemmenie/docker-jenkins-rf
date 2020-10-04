*** Test Cases ***
Check out a shopping cart
    [Tags]  regression intake
    Sleep  2  it takes a little while to check out.
    Pass execution  Done

Check out a shopping cart with items not in stock
    [Tags]  regression
    Sleep  2  it takes a little while to check out.
    Fail  oops this testcase failed

Check out a shopping cart with creditcard
    [Tags]  regression
    Sleep  1  it takes a little while to check out.
    Pass execution  Done