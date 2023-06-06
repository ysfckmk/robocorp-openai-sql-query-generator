*** Settings ***
Documentation       Template keyword resource.

Variables           variables.py
Library             RPA.OpenAI
Library             RPA.Robocorp.Vault
Library             OperatingSystem
Library             runSqlQuery.py
Library             Process


*** Keywords ***
Get Sql Query From Gpt
    [Arguments]    ${promt}
    ${gpt_temp}    Get File    resources/gptTemplate.txt
    ${secrets}    Get Secret    openAi
    Authorize To Openai    ${secrets}[key]
    ${response}    Completion Create    ${gpt_temp} ${promt} ${SQL_PROMPT}    temperature=0
    Log    ${response}
    # Create File    gptResp.txt    ${response}
    ${json_object}    Evaluate    json.loads('''${response}''')    json
    Log    ${json_object}
    RETURN    ${json_object}

Get Data From Sqlite
    [Arguments]    ${sql_query}
    ${sql_result}    Run Sqlite Query    ${DB_PATH}    ${sql_query}
    Log    ${sql_result}
    RETURN    ${sql_result}
