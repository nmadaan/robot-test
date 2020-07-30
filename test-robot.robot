*** Settings ***
Force Tags          RobotTestCase


*** Variables ***

${robotVar} =            FooBarBaz


*** Test Cases ***

Foo Test Case
    [tags]              RobotWebPage
    [Documentation]     Test Robot Execution
    Log     Test
