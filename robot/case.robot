*** Settings ***
Resource    ./resource.robot
Suite Setup     Setup chromedriver
Test Setup      Start Test
Test Teardown   Finishing Test

*** Variables ***
${NOME}                 Lucas
${CATEGORIA}            EDM
${COMENTARIO_UM}        Saudades do que nunca vivemos
${COMENTARIO_DOIS}      Saudades do que nunca vivemos S2
${COMENTARIO_TRES}      Saudades do que viveremos

*** Test Cases ***
Usuário realizando um comentários
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_UM}"
    Find Comment "1"

Usuário realizando dois comentários
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_UM}"
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_DOIS}"
    Find Comment "2"

Usuário realizando dois comentários e deletando
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_UM}"
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_DOIS}"
    Find Comment "2"
    Delete Comment
    Find Comment "1"
    Delete Comment
    Find Comment "0"

Usuário realizando três comentários e deletando o do meio
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_UM}"
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_DOIS}"
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_TRES}"
    Find Comment "3"
    Find Delete Button "3"
    Delete Last Comment
    Find Comment "2"

Usuário realizando três comentários e deletando todos
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_UM}"
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_DOIS}"
    User create a comment with name "${NOME}", category "${CATEGORIA}" and messasge "${COMENTARIO_TRES}"
    Find Comment "3"
    Find Delete Button "3"
    Delete All Comments
    Find Comment "0"