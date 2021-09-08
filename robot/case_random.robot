*** Settings ***
Resource    ./resource.robot
Library     ./ExampleRandom.py

*** Test Cases ***
Random Test
    ${RANDOM}=     Random Number

    Should Be True  ${RANDOM}