*** Settings ***
Documentation       Template robot main suite.

Library             Collections
Library             MyLibrary
Library             RPA.JSON
Resource            keywords.robot
Variables           variables.py


*** Tasks ***
Use The Gpt as a Sql Expert
    Log    Your Database is ${DB_PATH}
    ${db_schema}=    db export
    ${sql_json}=    Get Sql Query From Gpt    ${db_schema}

    ${sql_query}=    Get value from JSON    ${sql_json}    $.query
    ${sql_result}=    Get Data From Sqlite    ${sql_query}
