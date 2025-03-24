#!/bin/bash

# ---------------------------------------------------------------------------------
# Autor: Michael Good
# Projekt: Zahlen raten
# Version: 0.1
# ---------------------------------------------------------------------------------

# Funktionen

function generate_number() {
    # Generiere eine zufällige Zahl zwischen 1 und 100
    number=$(shuf -i 1-100 -n 1)
}

function ask_to_play() {
    # Frage den Benutzer, ob er spielen möchte
    echo "Möchtest du spielen? (Ja/Nein)"
    read spielen
}

function play_game() {
    # Implementiere die Spiellogik
    while true; do
        read -p "gib bitte deine Zahl an: " guess
        if [ "$guess" -eq "$number" ]; then
            echo "Richtig, die Zahl, die ich mir ausgedacht habe ist $number :-)"
            break
            elif [ "$guess" -lt "$number" ]; then
            echo "leider nein! Deine Zahl ist zu niedrig."
        else
            echo "leider nein! Deine Zahl ist zu hoch."
        fi
    done
}

# Hauptfunktion

main() {
    # Aufruf der Funktionen
    generate_number
    ask_to_play
    if [[ $spielen == "Ja" ]]; then
        play_game
    else
        echo "Okay, dann nicht. Tschüss!"
        exit
    fi
}

# Aufruf der Hauptfunktion

main
