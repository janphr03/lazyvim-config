local M = {}

local chapters = {
  {
    id = "start",
    title = "1. Start und Bedienlogik",
    lines = {
      "Neovim hat verschiedene Modi. Das klingt zuerst ungewohnt, spart später aber viele Handgriffe.",
      "",
      "- `Esc`       Normalmodus: bewegen und Befehle ausführen.",
      "- `i`         Einfügemodus: normalen Text schreiben.",
      "- `v`         Text sichtbar markieren.",
      "- `:`         Einen ausgeschriebenen Befehl eingeben.",
      "- `<Space>`   Die Leertaste ist die Leader-Taste. `<Space> e` heißt: Leertaste, dann e.",
      "- `F1`        Diese einfache Hilfe öffnen.",
      "",
      "Tipp: Wenn du nicht weiterweißt, drücke zuerst `Esc`. Danach bist du wieder im Normalmodus.",
    },
  },
  {
    id = "bewegung",
    title = "2. Bewegung im Text",
    lines = {
      "Diese Befehle werden im Normalmodus verwendet.",
      "",
      "- `h` / `l`       Ein Zeichen nach links / rechts.",
      "- `j` / `k`       Eine Zeile nach unten / oben.",
      "- `w` / `b`       Zum nächsten / vorherigen Wort springen.",
      "- `0` / `$`       Zum Anfang / Ende der Zeile springen.",
      "- `gg` / `G`      Zum Anfang / Ende der Datei springen.",
      "- `Ctrl-d/u`      Eine halbe Seite nach unten / oben.",
      "- `%`             Zur passenden Klammer springen.",
      "- `f` + Zeichen   Zum nächsten Zeichen in dieser Zeile springen, zum Beispiel `f)`.",
      "",
      "Eine Zahl wiederholt eine Bewegung: `5j` geht fünf Zeilen nach unten.",
    },
  },
  {
    id = "aendern",
    title = "3. Text hinzufügen und ändern",
    lines = {
      "Änderungen beginnen meist im Normalmodus. Mit `Esc` kommst du immer dorthin zurück.",
      "",
      "- `i` / `a`       Vor / nach dem Cursor Text einfügen.",
      "- `o` / `O`       Neue Zeile unter / über der aktuellen Zeile anlegen.",
      "- `x`             Zeichen unter dem Cursor löschen.",
      "- `dd`            Ganze Zeile löschen.",
      "- `ciw`           Aktuelles Wort löschen und sofort neu schreiben.",
      "- `v`, bewegen    Text markieren. Danach etwa `d`, `y` oder `>` verwenden.",
      "- `y` / `p`       Markierten Text kopieren / nach dem Cursor einfügen.",
      "- `u` / `Ctrl-r`  Letzte Änderung rückgängig machen / wiederholen.",
      "- `>` / `<`       Markierten Text einrücken / ausrücken.",
      "- `gcc`           Aktuelle Zeile als Kommentar ein- oder ausschalten.",
      "- `gc`            Markierten Bereich kommentieren.",
    },
  },
  {
    id = "dateien",
    title = "4. Dateien und Ordner",
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
      "- `:w`                Aktuelle Datei speichern.",
      "- `:w neuername`      Inhalt unter einem neuen Namen speichern.",
    },
  },
  {
    id = "suchen",
    title = "5. Suchen und Ersetzen",
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
    id = "code",
    title = "6. Code verstehen und refaktorieren",
    lines = {
      "Diese Befehle funktionieren, wenn für die Sprache ein Language Server aktiv ist.",
      "",
      "- `gd`                Zur Definition springen.",
      "- `gr`                Alle Verwendungen anzeigen.",
      "- `K`                 Kurze Erklärung und Typ unter dem Cursor anzeigen.",
      "- `<Space> c r`       Symbol im ganzen Projekt sicher umbenennen.",
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
    id = "tests",
    title = "7. Tests ausführen",
    lines = {
      "Die Testbefehle erkennen bei Python zum Beispiel Pytest-Tests.",
      "",
      "- `<Space> t r`       Den Test am Cursor ausführen.",
      "- `<Space> t t`       Alle Tests der aktuellen Datei ausführen.",
      "- `<Space> t T`       Alle Tests des Projekts ausführen.",
      "- `<Space> t l`       Den zuletzt ausgeführten Test wiederholen.",
      "- `<Space> t s`       Testübersicht öffnen oder schließen.",
      "- `<Space> t o`       Ausgabe des aktuellen Tests anzeigen.",
      "- `<Space> t d`       Den Test am Cursor im Debugger starten.",
      "",
      "Das Projekt muss das passende Testwerkzeug enthalten, zum Beispiel `pytest` im Python-Venv.",
    },
  },
  {
    id = "debuggen",
    title = "8. Debuggen",
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
    id = "git",
    title = "9. Git",
    lines = {
      "Git-Markierungen links zeigen neue, geänderte und gelöschte Zeilen.",
      "",
      "- `]h` / `[h`         Zur nächsten / vorherigen Änderung springen.",
      "- `<Space> g s`       Git-Status anzeigen.",
      "- `<Space> g d`       Änderungen als Diff anzeigen.",
      "- `<Space> g l`       Commit-Verlauf anzeigen.",
      "- `<Space> g b`       Anzeigen, wer die aktuelle Zeile zuletzt geändert hat.",
      "- `<Space> g g`       Lazygit öffnen, falls es auf dem System installiert ist.",
      "",
      "Commit und Push gehen jederzeit im Terminal, zum Beispiel mit `git status`, `git add`, `git commit` und `git push`.",
    },
  },
  {
    id = "terminal",
    title = "10. Terminal und Aufgaben",
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
    title = "11. Fenster, Dateien im Speicher und Beenden",
    lines = {
      "Ein Buffer ist eine geöffnete Datei; ein Fenster zeigt einen Buffer an.",
      "",
      "- `Shift-h/l`        Vorherige / nächste geöffnete Datei anzeigen.",
      "- `<Space> ,`        Alle geöffneten Dateien anzeigen.",
      "- `<Space> -`        Fenster horizontal teilen.",
      "- `<Space> |`        Fenster vertikal teilen.",
      "- `Ctrl-h/j/k/l`     In das Fenster links/unten/oben/rechts wechseln.",
      "- `<Space> b d`      Aktuelle Datei schließen.",
      "- `:w`               Speichern.",
      "- `:q`               Aktuelles Fenster schließen.",
      "- `:wq`              Speichern und schließen.",
      "- `<Space> q q`      Neovim komplett beenden.",
    },
  },
  {
    id = "hilfe",
    title = "12. Weitere Hilfe",
    lines = {
      "- `F1` oder `<Space> h`   Diese Kapitelübersicht öffnen.",
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
}

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
  close_existing_help()

  local bufnr = vim.api.nvim_create_buf(false, true)
  local lines = {
    "# Neovim – einfache Hilfe",
    "",
    "`<Space>` bedeutet Leertaste. Tastenkombinationen werden nacheinander gedrückt.",
    "Im Hilfefenster: `q` schließen · `m` Kapitel wählen · `]k` weiter · `[k` zurück",
    "",
  }

  local visible = selected and { selected } or chapters
  for _, chapter in ipairs(visible) do
    lines[#lines + 1] = "## " .. chapter.title
    lines[#lines + 1] = ""
    vim.list_extend(lines, chapter.lines)
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
  vim.list_extend(items, chapters)
  vim.ui.select(items, {
    prompt = "Welches Thema möchtest du erklärt bekommen?",
    format_item = function(item)
      return item.title
    end,
  }, function(item)
    if item then
      M.open(item.id)
    end
  end)
end

return M
