# Neovim als Entwicklungsumgebung

Diese Konfiguration basiert auf LazyVim und ist für Python, TypeScript/JavaScript,
C/C++, SQL, Docker, YAML, JSON, Markdown, TOML und LaTeX vorbereitet.

Eine vollständige, einfache deutsche Bedienhilfe ist direkt eingebaut:

- `F1`: aus jedem Modus die Kapitel auswählen
- `<Space> h`: in jedem normalen Editorfenster die Kapitel auswählen
- `:Hilfe`: Kapitel auswählen
- `:Hilfe alles`: komplette Hilfe anzeigen
- `:Hilfe bewegung`: ein bestimmtes Kapitel direkt öffnen

`<Space>` bedeutet dabei immer die Leertaste.

## Funktionen

- Code-Vervollständigung und Language Server
- Formatierung mit Ruff, Prettier, Stylua und weiteren Werkzeugen
- Fehler- und Warnungsanzeige
- projektweites Umbenennen und Code-Actions
- Testausführung mit Neotest
- Debugging mit Breakpoints und Debugger-Oberfläche
- Datei-Explorer, Projekt- und Volltextsuche
- Git-Status, Diffs und Zeilenhistorie
- Task-Runner für npm, Make, Pytest und andere Projektwerkzeuge
- GitHub Copilot

## Neuinstallation

### 1. Systempakete

Unter Ubuntu oder WSL:

```bash
sudo apt update
sudo apt install -y git curl unzip ripgrep fd-find nodejs npm \
  build-essential xclip python3-venv
```

Für Symbole im Terminal wird eine Nerd Font empfohlen, zum Beispiel
[FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip).
Die Schrift muss anschließend im Terminal-Profil ausgewählt werden.

### 2. Neovim installieren

Die Konfiguration benötigt Neovim 0.11.2 oder neuer. Beispiel für die offizielle
Linux-Binary:

```bash
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
```

Danach diesen Eintrag einmalig in `~/.bashrc` ergänzen:

```bash
export PATH="$HOME/nvim-linux-x86_64/bin:$PATH"
```

Terminal neu öffnen und prüfen:

```bash
nvim --version
```

### 3. Konfiguration installieren

Eine vorhandene Konfiguration zuerst sichern:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Danach dieses Repository klonen:

```bash
git clone https://github.com/janphr03/lazyvim-config.git ~/.config/nvim
nvim
```

Beim ersten Start werden die Plugins installiert. Sprachserver, Formatter und
Debugger werden über Mason eingerichtet. Dieser Vorgang kann einige Minuten dauern.

Falls die Installation unterbrochen wurde:

```vim
:Lazy restore
:Mason
```

## Bedienung lernen

Auf dem Startbildschirm steht direkt `HILFE öffnen · F1 überall · Space h`.
Die Hilfe ist nach folgenden Themen gegliedert:

1. Start und Bedienlogik
2. Kompletter Arbeitsablauf
3. Bewegung im Text
4. Text hinzufügen und ändern
5. Auswahl, Operatoren und Textobjekte
6. Dateien und Ordner
7. Suchen und Ersetzen
8. Vervollständigung, Vorschläge und Snippets
9. Code verstehen und refaktorieren
10. Fehler, Warnungen und Aufgabenlisten
11. Tests
12. Debugging
13. Sprachen, Docker und Kubernetes
14. Git
15. Terminal und Aufgaben
16. Fenster, Dateien im Speicher und Beenden
17. Wichtige Befehle, Wartung und Notfälle
18. Weitere Hilfe
19. Alle belegten Tastenkürzel als automatisch erzeugter Anhang

Im Hilfefenster wechseln `]k` und `[k` das Kapitel, `m` öffnet die Kapitelwahl und
`q` schließt die Hilfe. Which-Key zeigt nach dem Drücken der Leertaste außerdem
alle verfügbaren Folgetasten an. Das letzte Kapitel wird aus der laufenden
Konfiguration erzeugt und listet alle beschriebenen globalen sowie aktuell
dateispezifischen Tastenkürzel auf.

## Projektabhängige Voraussetzungen

Die Editor-Werkzeuge ersetzen nicht die Abhängigkeiten eines Projekts:

- Python-Tests benötigen beispielsweise `pytest` im aktiven Virtualenv.
- TypeScript-Projekte benötigen ihre Abhängigkeiten aus `package.json`.
- C/C++-Projekte benötigen einen Compiler und idealerweise `compile_commands.json`.
- LaTeX-Kompilierung benötigt eine TeX-Distribution und `latexmk`.
- Datenbankverbindungen werden projektbezogen in Dadbod eingerichtet.

## Wartung

Plugins aktualisieren:

```vim
:Lazy sync
```

Externe Entwicklungswerkzeuge prüfen:

```vim
:Mason
:checkhealth
```

Nach einem Plugin-Update sollte `lazy-lock.json` zusammen mit der Konfiguration
committet werden. Dadurch lässt sich derselbe Plugin-Stand auf einem anderen Rechner
mit `:Lazy restore` wiederherstellen.

Weitere optionale Sprachen oder DevOps-Werkzeuge können über `:LazyExtras` aktiviert
werden. Helm, Terraform und Ansible sollten erst aktiviert werden, wenn sie wirklich
verwendet werden; dadurch bleibt die Konfiguration schnell und übersichtlich.
