#!/bin/bash
#--------------------------------------
#-------- Bash common commands --------
#--------------------------------------
# Uncategorized commands

# get array from output of jq reading a json key // devuelve el array con las keys del diccionario indicado por ENV_VAR2(tengo el cerbro frito y ahora no lo puedo escribir en ingles)
#TODO: Explain it in English
readarray -t ENV_VAR < <(cat /file | jq '.'${ENV_VAR2}' | keys[] ')