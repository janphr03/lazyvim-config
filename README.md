# Neovim Config (LazyVim)


## 1) Systempakete installieren

```bash
sudo apt update
sudo apt install -y git curl unzip ripgrep fd-find
sudo apt install -y nodejs npm
```

## 2) Vorhandene Neovim-Konfiguration sichern

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
```

## 3) LazyVim Starter holen

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## 4) Neovim (aktuelle Release-Binary) installieren

```bash
sudo apt update
sudo apt install -y curl git ripgrep fd-find
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$HOME/nvim-linux-x86_64/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 5) Installation prüfen

```bash
nvim --version
```

## 6) Neovim starten

```bash
nvim
```

Beim ersten Start installiert LazyVim automatisch die Plugins.

## 7) Kompletten `lua`-Ordner aus Backup uebernehmen

Wenn du wirklich den kompletten Stand uebernehmen willst (frisches Setup + dein kompletter `lua`-Ordner):

```bash
rm -rf ~/.config/nvim/lua
cp -a /pfad/zu/deinem_backup/lua ~/.config/nvim/
```

Optional (falls ebenfalls angepasst): `init.lua` und `lazy-lock.json` aus deinem Backup mit uebernehmen.

## 8) FiraCode Nerd Font installieren

FiraCode Nerd Font (ZIP):
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip

Schritte:
1. ZIP herunterladen.
2. ZIP entpacken.
3. Alle `.ttf`-Dateien markieren.
4. Installieren (z. B. per Doppelklick -> "Installieren").
5. Danach die Schrift im Terminal-Profil auf "FiraCode Nerd Font" stellen.
