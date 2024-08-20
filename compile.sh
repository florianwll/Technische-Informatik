if [ $# -eq 0 ]; then
    echo "Keine Datei als Argument übergeben."
    echo "Verwendung: $0 <dateipfad>"
    exit 1
fi

# Das erste Argument wird als Datei gespeichert
file="$1"

# Überprüfen, ob die Datei existiert
if [ ! -f "$file" ]; then
    echo "Die Datei '$file' existiert nicht."
    exit 1
fi

# Überprüfen, ob die Datei eine Assembly-Datei (mit .s-Endung) ist
if [[ "$file" != *.s ]]; then
    echo "Die Datei '$file' ist keine gültige Assembly-Datei (.s)."
    exit 1
fi

# Extrahiere den Dateinamen ohne die Erweiterung
filename="${file%.s}"

# Führe die Befehle aus
as -o "$filename.o" "$file" && ld -o "$filename" "$filename.o"

# Überprüfe, ob die Befehle erfolgreich waren
if [ $? -eq 0 ]; then
    echo "Kompilierung und Linken erfolgreich. Ausführbare Datei: $filename"
    ./$filename
    echo $?
    rm $filename.o
    rm $filename
else
    echo "Fehler bei der Kompilierung oder dem Linken."
    exit 1
fi

