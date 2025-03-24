#--------------------------------------------------------------------
# Projekt: Taschenrechner - funktionsorientiert
# Autor: Michael Good
# Datum: 09.03.2024
# Organisation: bzbs
#--------------------------------------------------------------------
#!/bin/sh

# Funktion für die Addition
addition() {
    result=$(expr $1 + $2)
    echo "Ergebnis der Addition: $result"
}

# Funktion für die Subtraktion
subtraktion() {
    result=$(expr $1 - $2)
    echo "Ergebnis der Subtraktion: $result"
}

# Funktion für die Multiplikation
multiplikation() {
    result=$(expr $1 * $2)
    echo "Ergebnis der Multiplikation: $result"
}

# Funktion für die Division
division() {
    if [ $2 -eq 0 ]; then
        echo "Fehler: Division durch Null ist nicht erlaubt."
    else
        result=$(expr $1 / $2)
        echo "Ergebnis der Division: $result"
    fi
}

# Hauptfunktion für die Benutzerinteraktion
main() {
    echo "Willkommen zum funktionsorientierten Taschenrechner"
    echo "Bitte wählen Sie eine Operation aus:"
    echo "1. Addition"
    echo "2. Subtraktion"
    echo "3. Multiplikation"
    echo "4. Division"
    read -p "Ihre Auswahl: " choice

    read -p "Geben Sie die erste Zahl ein: " num1
    read -p "Geben Sie die zweite Zahl ein: " num2

    case $choice in
        1) addition $num1 $num2 ;;
        2) subtraktion $num1 $num2 ;;
        3) multiplikation $num1 $num2 ;;
        4) division $num1 $num2 ;;
        *) echo "Ungültige Auswahl." ;;
    esac
}

# Aufrufen der Hauptfunktion
main


