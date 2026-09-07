local M = {}

local chapters = {
  {
    id = "start",
    title = "Start und Bedienlogik",
    lines = {
      "Neovim hat verschiedene Modi. Das klingt zuerst ungewohnt, spart später aber viele Handgriffe.",
      "",
      "- `Esc`       Normalmodus: bewegen und Befehle ausführen.",
      "- `i`         Einfügemodus: normalen Text schreiben.",
      "- `v`         Text sichtbar markieren.",
      "- `:`         Einen ausgeschriebenen Befehl eingeben.",
      "- `<Space>`   Die Leertaste ist die Leader-Taste. `<Space> e` heißt: Leertaste, dann e.",
      "- `F1`        Diese einfache Hilfe öffnen.",
      "- `<Space> h` Diese einfache Hilfe aus jedem normalen Editorfenster öffnen.",
      "",
      "Tipp: Wenn du nicht weiterweißt, drücke zuerst `Esc`. Danach bist du wieder im Normalmodus.",
    },
  },
  {
    id = "workflow",
    title = "Ein kompletter Arbeitsablauf",
    lines = {
      "So kannst du ein Projekt vom Terminal bis zum fertigen Commit bearbeiten:",
      "",
      "1. Im Terminal mit `cd mein-projekt` in das Projekt wechseln und `nvim .` starten.",
      "2. Mit `<Space><Space>` eine Datei suchen oder mit `<Space> e` den Explorer öffnen.",
      "3. Mit `i` schreiben, mit `Esc` zurück in den Normalmodus und mit `Ctrl-s` speichern.",
      "4. Mit `<Space> c f` formatieren und mit `<Space> x x` Fehler und Warnungen prüfen.",
      "5. Mit `<Space> t r` den Test am Cursor oder mit `<Space> t T` alle Tests starten.",
      "6. Bei Bedarf mit `<Space> d b` einen Breakpoint setzen und mit `<Space> d c` debuggen.",
      "7. Mit `<Space> g s` die Git-Änderungen prüfen und im Terminal committen und pushen.",
      "",
      "Du musst nicht alles auswendig lernen: `F1` öffnet diese Hilfe und nach `<Space>` zeigt Which-Key die nächsten Tasten an.",
    },
  },
  {
    id = "bewegung",
    title = "Bewegung im Text",
    lines = {
      "Diese Befehle werden im Normalmodus verwendet.",
      "",
      "- `h` / `l`       Ein Zeichen nach links / rechts.",
      "- `j` / `k`       Eine Zeile nach unten / oben.",
      "- `w` / `b`       Zum nächsten / vorherigen Wort springen.",
      "- `e` / `ge`      Zum Ende des nächsten / vorherigen Wortes springen.",
      "- `W` / `B`       Wie `w` / `b`, aber nur Leerzeichen trennen Wörter.",
      "- `0` / `$`       Zum Anfang / Ende der Zeile springen.",
      "- `^` / `g_`      Zum ersten / letzten sichtbaren Zeichen der Zeile springen.",
      "- `gg` / `G`      Zum Anfang / Ende der Datei springen.",
      "- `Ctrl-d/u`      Eine halbe Seite nach unten / oben.",
      "- `{` / `}`       Zum vorherigen / nächsten Absatz oder Codeblock springen.",
      "- `%`             Zur passenden Klammer springen.",
      "- `f` + Zeichen   Zum nächsten Zeichen in dieser Zeile springen, zum Beispiel `f)`.",
      "- `t` + Zeichen   Bis direkt vor das nächste Zeichen springen.",
      "- `;` / `,`       Den letzten `f`- oder `t`-Sprung vorwärts / rückwärts wiederholen.",
      "- `*` / `#`       Das Wort unter dem Cursor vorwärts / rückwärts suchen.",
      "- `Ctrl-o/i`      Zum vorherigen / nächsten Ort in der Sprunghistorie gehen.",
      "- `zz`            Die aktuelle Zeile in die Bildschirmmitte holen.",
      "- `s`             Flash-Suche: sichtbare Ziele mit wenigen Buchstaben anspringen.",
      "- `]f` / `[f`     Zur nächsten / vorherigen Funktion springen.",
      "- `]c` / `[c`     Zur nächsten / vorherigen Klasse springen.",
      "- `m` + Buchstabe Eine Stelle merken; `'` + Buchstabe springt später dorthin zurück.",
      "",
      "Eine Zahl wiederholt eine Bewegung: `5j` geht fünf Zeilen nach unten.",
    },
  },
  {
    id = "aendern",
    title = "Text hinzufügen und ändern",
    lines = {
      "Änderungen beginnen meist im Normalmodus. Mit `Esc` kommst du immer dorthin zurück.",
      "",
      "- `i` / `a`       Vor / nach dem Cursor Text einfügen.",
      "- `I` / `A`       Am Anfang / Ende der Zeile Text einfügen.",
      "- `o` / `O`       Neue Zeile unter / über der aktuellen Zeile anlegen.",
      "- `x`             Zeichen unter dem Cursor löschen.",
      "- `r` + Zeichen   Zeichen unter dem Cursor ersetzen.",
      "- `dd`            Ganze Zeile löschen.",
      "- `D` / `C`       Bis zum Zeilenende löschen / löschen und neu schreiben.",
      "- `ciw`           Aktuelles Wort löschen und sofort neu schreiben.",
      "- `v`, bewegen    Text markieren. Danach etwa `d`, `y` oder `>` verwenden.",
      "- `y` / `p`       Markierten Text kopieren / nach dem Cursor einfügen.",
      "- `u` / `Ctrl-r`  Letzte Änderung rückgängig machen / wiederholen.",
      "- `.`             Die letzte Änderung an einer anderen Stelle wiederholen.",
      "- `J`             Die nächste Zeile an die aktuelle Zeile anhängen.",
      "- `>` / `<`       Markierten Text einrücken / ausrücken.",
      "- `gcc`           Aktuelle Zeile als Kommentar ein- oder ausschalten.",
      "- `gc`            Markierten Bereich kommentieren.",
    },
  },
  {
    id = "auswahl",
    title = "Auswahl, Operatoren und Textobjekte",
    lines = {
      "Neovim kombiniert eine Aktion mit einem Ziel. `d` bedeutet löschen und `w` bedeutet Wort; zusammen löscht `dw` bis zum nächsten Wort.",
      "",
      "Auswahl:",
      "",
      "- `v` / `V`          Zeichenweise / ganze Zeilen markieren.",
      "- `Ctrl-v`           Einen rechteckigen Block markieren.",
      "- `o`                In einer Auswahl zum anderen Ende wechseln.",
      "- `Esc`              Auswahl beenden.",
      "",
      "Operatoren:",
      "",
      "- `d` / `c`          Löschen / löschen und anschließend schreiben.",
      "- `y`                Kopieren. `yy` kopiert eine ganze Zeile.",
      "- `>` / `<`          Einrücken / ausrücken.",
      "- `=`                Automatisch einrücken, zum Beispiel `=ap` für einen Absatz.",
      "- `.`                Die letzte Änderung wiederholen.",
      "",
      "Textobjekte:",
      "",
      "- `iw` / `aw`        Inneres Wort / Wort einschließlich Abstand.",
      '- `i"` / `a"`      Inhalt / gesamter Bereich in Anführungszeichen.',
      "- `i(` / `a(`        Inhalt / gesamter Klammerausdruck.",
      "- `if` / `af`        Inhalt / gesamte Funktion.",
      "- `ic` / `ac`        Inhalt / gesamte Klasse.",
      "",
      "Beispiele: `ciw` ersetzt ein Wort, `di(` löscht den Klammerinhalt und `vaf` markiert eine ganze Funktion.",
    },
  },
  {
    id = "dateien",
    title = "Dateien und Ordner",
    lines = {
      "Mit `<Space> e` öffnest du links den Datei-Explorer. Darin gelten diese Tasten:",
      "",
      "- `Enter` oder `l`   Datei öffnen oder Ordner aufklappen.",
      "- `h`                Ordner zuklappen.",
      "- `a`                Datei oder Ordner anlegen. Für einen Ordner den Namen mit `/` beenden.",
      "- `r`                Ausgewählte Datei umbenennen.",
      "- `d`                Datei löschen. Es folgt zuerst eine Sicherheitsfrage.",
      "- `c` / `m`          Datei kopieren / verschieben.",
      "- `y` / `p`          Datei zum Kopieren vormerken / einfügen.",
      "- `H` / `I`          Versteckte / von Git ignorierte Dateien ein- oder ausblenden.",
      "- `q`                Explorer schließen.",
      "",
      "Weitere Datei-Befehle:",
      "",
      "- `<Space><Space>`    Datei im Projekt nach Namen suchen.",
      "- `<Space> f r`       Kürzlich geöffnete Dateien zeigen.",
      "- `<Space> f n`       Eine neue, noch unbenannte Datei anlegen.",
      "- `Ctrl-s`            Aktuelle Datei speichern.",
      "- `:w`                Aktuelle Datei speichern.",
      "- `:w neuername`      Inhalt unter einem neuen Namen speichern.",
    },
  },
  {
    id = "suchen",
    title = "Suchen und Ersetzen",
    lines = {
      "- `/text`            In der aktuellen Datei vorwärts suchen.",
      "- `n` / `N`          Nächsten / vorherigen Treffer anzeigen.",
      "- `<Space> /`         Text im gesamten Projekt suchen.",
      "- `<Space> s w`       Das Wort unter dem Cursor im Projekt suchen.",
      "- `<Space> s b`       Eine Zeile in der aktuellen Datei suchen.",
      "- `<Space> s r`       Suchen und Ersetzen im Projekt öffnen.",
      "- `:%s/alt/neu/g`     In der ganzen Datei `alt` durch `neu` ersetzen.",
      "",
      "In Suchfenstern kannst du tippen, mit Pfeiltasten auswählen und mit `Enter` öffnen.",
    },
  },
  {
    id = "completion",
    title = "Vervollständigung, Vorschläge und Snippets",
    lines = {
      "Beim Schreiben öffnet sich automatisch eine Vorschlagsliste mit Code, Dateipfaden, Snippets und Copilot-Vorschlägen.",
      "",
      "- `Ctrl-Space`       Vorschlagsliste und Dokumentation manuell öffnen.",
      "- `Pfeil hoch/runter` Vorherigen / nächsten Vorschlag wählen.",
      "- `Ctrl-p/n`         Ebenfalls vorherigen / nächsten Vorschlag wählen.",
      "- `Enter`            Ausgewählten Vorschlag übernehmen.",
      "- `Ctrl-e`           Vorschlagsliste schließen.",
      "- `Ctrl-b/f`         Dokumentation im Vorschlagsfenster hoch / runter scrollen.",
      "- `Tab` / `Shift-Tab` Im ausgefüllten Snippet vorwärts / rückwärts springen.",
      "- `Ctrl-k`           Signatur und Parameter einer Funktion anzeigen.",
      "",
      "Copilot erscheint als ausgegrauter Vorschlag in derselben Completion-Oberfläche und wird wie ein normaler Vorschlag ausgewählt.",
    },
  },
  {
    id = "code",
    title = "Code verstehen und refaktorieren",
    lines = {
      "Diese Befehle funktionieren, wenn für die Sprache ein Language Server aktiv ist.",
      "",
      "- `gd`                Zur Definition springen.",
      "- `gr`                Alle Verwendungen anzeigen.",
      "- `gI`                Zur Implementierung springen.",
      "- `gy`                Zur Typdefinition springen.",
      "- `gD`                Zur Deklaration springen.",
      "- `K`                 Kurze Erklärung und Typ unter dem Cursor anzeigen.",
      "- `gK`                Signatur und Parameter der Funktion anzeigen.",
      "- `<Space> s s`       Funktionen, Klassen und Symbole der Datei durchsuchen.",
      "- `<Space> s S`       Symbole im gesamten Projekt durchsuchen.",
      "- `<Space> c r`       Symbol im ganzen Projekt sicher umbenennen.",
      "- `<Space> c R`       Datei umbenennen und bekannte Imports automatisch anpassen.",
      "- Rechtsklick          Im Menü `Rename All` für dasselbe Umbenennen wählen.",
      "- `<Space> c a`       Passende automatische Korrekturen anzeigen.",
      "- `<Space> c o`       Imports sortieren und aufräumen.",
      "- `<Space> c l`       Aktive Language Server anzeigen.",
      "- `<Space> c f`       Aktuelle Datei formatieren.",
      "- `<Space> x x`       Fehler und Warnungen des Projekts anzeigen.",
      "- `<Space> c d`       Erklärung des Fehlers in der aktuellen Zeile öffnen.",
    },
  },
  {
    id = "diagnosen",
    title = "Fehler, Warnungen und Aufgabenlisten",
    lines = {
      "Language Server und Linter markieren Probleme direkt im Code. Rot steht meist für Fehler, Gelb für Warnungen.",
      "",
      "- `]d` / `[d`        Zum nächsten / vorherigen Problem springen.",
      "- `]e` / `[e`        Zum nächsten / vorherigen Fehler springen.",
      "- `]w` / `[w`        Zur nächsten / vorherigen Warnung springen.",
      "- `<Space> c d`      Details zum Problem in der aktuellen Zeile anzeigen.",
      "- `<Space> x x`      Alle Probleme des Projekts in Trouble anzeigen.",
      "- `<Space> x X`      Nur Probleme der aktuellen Datei anzeigen.",
      "- `<Space> s d`      Probleme in einer durchsuchbaren Liste anzeigen.",
      "- `<Space> s t`      TODO-, FIXME- und ähnliche Kommentare suchen.",
      "- `<Space> u d`      Diagnosen vorübergehend ein- oder ausschalten.",
      "",
      "Mit `<Space> c a` bietet der Language Server häufig eine automatische Korrektur an.",
    },
  },
  {
    id = "tests",
    title = "Tests ausführen",
    lines = {
      "Die Testbefehle erkennen bei Python zum Beispiel Pytest-Tests.",
      "",
      "- `<Space> t r`       Den Test am Cursor ausführen.",
      "- `<Space> t t`       Alle Tests der aktuellen Datei ausführen.",
      "- `<Space> t T`       Alle Tests des Projekts ausführen.",
      "- `<Space> t l`       Den zuletzt ausgeführten Test wiederholen.",
      "- `<Space> t s`       Testübersicht öffnen oder schließen.",
      "- `<Space> t o`       Ausgabe des aktuellen Tests anzeigen.",
      "- `<Space> t O`       Das dauerhafte Test-Ausgabefenster umschalten.",
      "- `<Space> t d`       Den Test am Cursor im Debugger starten.",
      "- `<Space> t w`       Tests der Datei bei Änderungen automatisch wiederholen.",
      "- `<Space> t S`       Laufende Tests stoppen.",
      "",
      "Das Projekt muss das passende Testwerkzeug enthalten, zum Beispiel `pytest` im Python-Venv.",
    },
  },
  {
    id = "debuggen",
    title = "Debuggen",
    lines = {
      "Ein Breakpoint hält das Programm an einer bestimmten Zeile an.",
      "",
      "- `<Space> d b`       Breakpoint in der aktuellen Zeile setzen oder entfernen.",
      "- `<Space> d c`       Programm starten oder bis zum nächsten Breakpoint weiterlaufen.",
      "- `<Space> d O`       Nächste Zeile ausführen, ohne in eine Funktion hineinzugehen.",
      "- `<Space> d i`       In die aufgerufene Funktion hineingehen.",
      "- `<Space> d o`       Aktuelle Funktion verlassen.",
      "- `<Space> d u`       Debugger-Oberfläche öffnen oder schließen.",
      "- `<Space> d e`       Wert unter dem Cursor auswerten.",
      "- `<Space> d t`       Debug-Sitzung beenden.",
      "",
      "Python verwendet `debugpy`; JavaScript und TypeScript verwenden den JS-Debug-Adapter.",
    },
  },
  {
    id = "sprachen",
    title = "Sprachen, Docker und Kubernetes",
    lines = {
      "Python:",
      "",
      "- `<Space> c v`      Virtuelle Python-Umgebung auswählen.",
      "- `<Space> c o`      Imports mit Ruff organisieren.",
      "- Pyright prüft Typen; Ruff prüft Stil und typische Fehler.",
      "- Tests benötigen `pytest` oder einen anderen Test-Runner im Projekt-Venv.",
      "",
      "TypeScript und JavaScript:",
      "",
      "- `<Space> c M`      Fehlende Imports ergänzen.",
      "- `<Space> c D`      Alle automatisch behebbaren TypeScript-Probleme korrigieren.",
      "- `<Space> c V`      TypeScript-Version des Projekts auswählen.",
      "- Prettier formatiert; ESLint prüft das Projekt, wenn eine ESLint-Konfiguration vorhanden ist.",
      "",
      "C und C++:",
      "",
      "- `<Space> c h`      Zwischen Header- und Quelldatei wechseln.",
      "- Clangd arbeitet am besten mit einer `compile_commands.json`; CMake kann diese Datei erzeugen.",
      "- Codelldb stellt den Debugger bereit; `<Space> d c` startet eine Konfiguration.",
      "",
      "SQL und LaTeX:",
      "",
      "- `<Space> D`        Datenbankoberfläche öffnen oder schließen.",
      "- `:DBUIAddConnection` Eine Datenbankverbindung hinzufügen.",
      "- `\\ l`             Vimtex-Befehle für die aktuelle LaTeX-Datei anzeigen.",
      "- LaTeX-Kompilierung benötigt zusätzlich `latexmk` und eine TeX-Distribution.",
      "",
      "Docker und Kubernetes:",
      "",
      "- Dockerfiles werden mit Docker-Language-Server und Hadolint geprüft.",
      "- Compose-Dateien erhalten Vervollständigung und Fehlerprüfung.",
      "- YAML-Dateien werden formatiert und gegen bekannte Schemas geprüft.",
      "- `Ctrl-/` öffnet das Terminal für `docker compose`, `kubectl` und `helm`.",
      "- `<Space> o o` kann passende Projektaufgaben starten, wenn sie definiert sind.",
      "- Docker, Kubectl und Helm selbst müssen separat auf dem System installiert sein.",
    },
  },
  {
    id = "git",
    title = "Git",
    lines = {
      "Git-Markierungen links zeigen neue, geänderte und gelöschte Zeilen.",
      "",
      "- `]h` / `[h`         Zur nächsten / vorherigen Änderung springen.",
      "- `<Space> g s`       Git-Status anzeigen.",
      "- `<Space> g d`       Änderungen als Diff anzeigen.",
      "- `<Space> g l`       Commit-Verlauf anzeigen.",
      "- `<Space> g b`       Anzeigen, wer die aktuelle Zeile zuletzt geändert hat.",
      "- `<Space> g g`       Lazygit öffnen, falls es auf dem System installiert ist.",
      "- `<Space> g h p`     Die Änderung an der aktuellen Stelle als Vorschau öffnen.",
      "- `<Space> g h s`     Die aktuelle Änderung für den nächsten Commit vormerken.",
      "- `<Space> g h r`     Die aktuelle Änderung verwerfen. Achtung: keine Sicherheitsfrage.",
      "",
      "Commit und Push gehen jederzeit im Terminal, zum Beispiel mit `git status`, `git add`, `git commit` und `git push`.",
    },
  },
  {
    id = "terminal",
    title = "Terminal und Aufgaben",
    lines = {
      "- `Ctrl-/`            Terminal im Projekt öffnen oder schließen.",
      "- `<Space> f t`       Ebenfalls ein Projekt-Terminal öffnen.",
      "- Im Terminal `Ctrl-/` zurück zum Editor wechseln.",
      "- `<Space> o o`       Eine erkannte Aufgabe starten, etwa npm, Make oder Pytest.",
      "- `<Space> o w`       Liste der laufenden und beendeten Aufgaben öffnen.",
      "- `<Space> o t`       Eine Aktion für die ausgewählte Aufgabe wählen.",
      "",
      "Overseer erkennt viele Befehle aus `package.json`, `Makefile` oder ähnlichen Projektdateien automatisch.",
    },
  },
  {
    id = "fenster",
    title = "Fenster, Dateien im Speicher und Beenden",
    lines = {
      "Ein Buffer ist eine geöffnete Datei; ein Fenster zeigt einen Buffer an.",
      "",
      "- `Shift-h/l`        Vorherige / nächste geöffnete Datei anzeigen.",
      "- `<Space> ,`        Alle geöffneten Dateien anzeigen.",
      "- `<Space> -`        Fenster horizontal teilen.",
      "- `<Space> |`        Fenster vertikal teilen.",
      "- `Ctrl-h/j/k/l`     In das Fenster links/unten/oben/rechts wechseln.",
      "- `<Space> b d`      Aktuelle Datei schließen.",
      "- `<Space> q s`      Automatisch gespeicherte Sitzung des Projekts wiederherstellen.",
      "- `<Space> q S`      Eine gespeicherte Sitzung auswählen.",
      "- `<Space> q l`      Die zuletzt verwendete Sitzung wiederherstellen.",
      "- `:w`               Speichern.",
      "- `:q`               Aktuelles Fenster schließen.",
      "- `:wq`              Speichern und schließen.",
      "- `<Space> q q`      Neovim komplett beenden.",
    },
  },
  {
    id = "wartung",
    title = "Wichtige Befehle, Wartung und Notfälle",
    lines = {
      "Befehle mit Doppelpunkt werden nach `Esc` eingetippt und mit `Enter` bestätigt.",
      "",
      "Speichern und Beenden:",
      "",
      "- `:w` / `:wa`       Aktuelle / alle geänderten Dateien speichern.",
      "- `:q` / `:qa`       Aktuelles Fenster / Neovim schließen.",
      "- `:wq` / `:wqa`     Speichern und anschließend schließen.",
      "- `:q!`              Fenster ohne Speichern schließen. Änderungen gehen verloren.",
      "- `:e!`              Datei neu laden und ungespeicherte Änderungen verwerfen.",
      "",
      "Entwicklungsumgebung prüfen:",
      "",
      "- `:LspInfo`          Aktive Sprachserver und deren Status anzeigen.",
      "- `:ConformInfo`      Aktiven Formatter und dessen Status anzeigen.",
      "- `:checkhealth`      Neovim, Plugins und externe Programme prüfen.",
      "- `:Mason`            Sprachserver, Formatter und Debugger verwalten.",
      "- `:Lazy`             Plugins und ihren Zustand anzeigen.",
      "- `:Lazy sync`        Plugins aktualisieren und fehlende Plugins installieren.",
      "- `:Lazy restore`     Die im Repository festgeschriebenen Plugin-Versionen laden.",
      "- `:messages`         Letzte Meldungen noch einmal anzeigen.",
      "",
      "Wenn eine Taste scheinbar nichts tut: erst `Esc`, dann `F1`. Projektwerkzeuge wie Compiler, `pytest`, Node oder Docker müssen zusätzlich auf dem System vorhanden sein.",
    },
  },
  {
    id = "hilfe",
    title = "Weitere Hilfe",
    lines = {
      "- `F1`                    Diese Hilfe aus jedem Modus öffnen.",
      "- `<Space> h`             Diese Hilfe in jedem normalen Editorfenster öffnen.",
      "- `m` im Hilfefenster     Zur Kapitelübersicht zurückkehren.",
      "- `]k` / `[k`             Nächstes / vorheriges Kapitel öffnen.",
      "- `<Space>` kurz halten   Which-Key zeigt mögliche Folgetasten an.",
      "- `<Space> s k`           Alle belegten Tastenkürzel durchsuchen.",
      "- `<Space> s h`           Die ausführliche technische Neovim-Hilfe durchsuchen.",
      "- `:checkhealth`           Installation und externe Werkzeuge prüfen.",
      "- `:Mason`                 Installierte Language Server und Werkzeuge verwalten.",
      "- `:Lazy`                  Plugins ansehen und aktualisieren.",
      "",
      "In dieser Hilfe bedeutet `<Space>` immer: einmal die Leertaste drücken.",
    },
  },
  {
    id = "alle-tasten",
    title = "Alle belegten Tastenkürzel – technischer Anhang",
    dynamic = true,
  },
}

local mode_labels = {
  n = "Normalmodus",
  x = "Auswahlmodus",
  s = "Select-Modus",
  o = "Operator wartet auf ein Ziel",
  i = "Schreibmodus",
  t = "Terminalmodus",
  c = "Befehlszeile",
}

local function readable_lhs(lhs)
  if lhs:sub(1, 1) == " " then
    lhs = "<Space>" .. lhs:sub(2)
  end
  return lhs:gsub("<lt>", "<")
end

local function all_keymaps_lines(source_bufnr)
  local lines = {
    "Diese Liste wird beim Öffnen automatisch aus der laufenden Konfiguration erzeugt.",
    "Sie enthält alle globalen Tastenkürzel mit Beschreibung und zusätzlich die Kürzel der Datei, aus der die Hilfe geöffnet wurde.",
    "Die Kapitel davor erklären die wichtigsten Befehle einfacher; dieser Anhang dient zum vollständigen Nachschlagen.",
    "",
  }

  for _, mode in ipairs({ "n", "x", "s", "o", "i", "t", "c" }) do
    local mappings = {}
    local seen = {}
    local function add(items)
      for _, map in ipairs(items) do
        if map.desc and map.desc ~= "" then
          local lhs = readable_lhs(map.lhs)
          local key = lhs .. "\0" .. map.desc
          if not seen[key] then
            seen[key] = true
            mappings[#mappings + 1] = { lhs = lhs, desc = map.desc }
          end
        end
      end
    end

    add(vim.api.nvim_get_keymap(mode))
    if source_bufnr and vim.api.nvim_buf_is_valid(source_bufnr) then
      add(vim.api.nvim_buf_get_keymap(source_bufnr, mode))
    end
    table.sort(mappings, function(a, b)
      return a.lhs:lower() < b.lhs:lower()
    end)

    if #mappings > 0 then
      lines[#lines + 1] = "### " .. mode_labels[mode]
      lines[#lines + 1] = ""
      for _, map in ipairs(mappings) do
        lines[#lines + 1] = "- `" .. map.lhs .. "` – " .. map.desc
      end
      lines[#lines + 1] = ""
    end
  end

  return lines
end

local function chapter_by_id(id)
  for index, chapter in ipairs(chapters) do
    if chapter.id == id then
      return chapter, index
    end
  end
end

local function close_existing_help()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.b[bufnr].simple_user_help then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end
end

local function render(selected, selected_index)
  local source_bufnr = vim.api.nvim_get_current_buf()
  local generated_keymaps = all_keymaps_lines(source_bufnr)
  close_existing_help()

  local bufnr = vim.api.nvim_create_buf(false, true)
  local lines = {
    "# Neovim – einfache Hilfe",
    "",
    "`<Space>` bedeutet Leertaste. Tastenkombinationen werden nacheinander gedrückt.",
    "Notfallknopf: `F1` funktioniert in jedem Modus; im Normalmodus geht überall `<Space> h`.",
    "Im Hilfefenster: `q` schließen · `m` Kapitel wählen · `]k` weiter · `[k` zurück",
    "",
  }

  local visible = selected and { { chapter = selected, index = selected_index } } or {}
  if not selected then
    for index, chapter in ipairs(chapters) do
      visible[#visible + 1] = { chapter = chapter, index = index }
    end
  end

  for _, entry in ipairs(visible) do
    local chapter = entry.chapter
    lines[#lines + 1] = ("## %d. %s"):format(entry.index, chapter.title)
    lines[#lines + 1] = ""
    vim.list_extend(lines, chapter.dynamic and generated_keymaps or chapter.lines)
    lines[#lines + 1] = ""
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.api.nvim_set_current_buf(bufnr)
  vim.api.nvim_buf_set_name(bufnr, "neovim-hilfe://einfache-hilfe")
  vim.b[bufnr].simple_user_help = true
  vim.bo[bufnr].buftype = "nofile"
  vim.bo[bufnr].bufhidden = "wipe"
  vim.bo[bufnr].swapfile = false
  vim.bo[bufnr].modifiable = false
  vim.bo[bufnr].filetype = "markdown"
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.cursorline = false
  vim.wo.foldcolumn = "0"
  vim.wo.signcolumn = "no"
  vim.wo.wrap = true
  vim.wo.linebreak = true

  local current_index = selected_index or 1
  vim.keymap.set("n", "q", "<cmd>bdelete<cr>", { buffer = bufnr, desc = "Hilfe schließen" })
  vim.keymap.set("n", "<Esc>", "<cmd>bdelete<cr>", { buffer = bufnr, desc = "Hilfe schließen" })
  vim.keymap.set("n", "m", M.select, { buffer = bufnr, desc = "Kapitel wählen" })
  vim.keymap.set("n", "]k", function()
    local next_index = current_index % #chapters + 1
    M.open(chapters[next_index].id)
  end, { buffer = bufnr, desc = "Nächstes Hilfekapitel" })
  vim.keymap.set("n", "[k", function()
    local previous_index = (current_index - 2) % #chapters + 1
    M.open(chapters[previous_index].id)
  end, { buffer = bufnr, desc = "Vorheriges Hilfekapitel" })

  vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

function M.chapter_ids()
  local ids = { "alles" }
  for _, chapter in ipairs(chapters) do
    ids[#ids + 1] = chapter.id
  end
  return ids
end

function M.open(id)
  if id == nil or id == "alles" then
    render()
    return
  end

  local chapter, index = chapter_by_id(id)
  if not chapter then
    vim.notify("Unbekanntes Hilfekapitel: " .. id, vim.log.levels.WARN)
    return
  end
  render(chapter, index)
end

function M.select()
  local items = { { id = "alles", title = "Alle Kapitel anzeigen" } }
  for index, chapter in ipairs(chapters) do
    items[#items + 1] = { id = chapter.id, title = chapter.title, index = index }
  end
  vim.ui.select(items, {
    prompt = "Welches Thema möchtest du erklärt bekommen?",
    format_item = function(item)
      return item.index and ("%d. %s"):format(item.index, item.title) or item.title
    end,
  }, function(item)
    if item then
      M.open(item.id)
    end
  end)
end

return M
