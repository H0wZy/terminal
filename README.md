# Terminal Setup

Repositório pessoal para salvar e sincronizar minhas configurações de terminal entre **Windows 11** e **Fedora KDE Plasma**.

## Conteúdo

```text
terminal/
├── .config/ohmyposh/
│   └── howzy-main-theme.omp.json
├── bash/
│   └── .bashrc
├── fonts/Nerd Fonts/
│   └── JetBrains Mono/
├── powershell/
│   └── Microsoft.PowerShell_profile.ps1
└── README.md
```

O repositório contém:

- Tema personalizado do Oh My Posh
- Configuração do Bash
- Perfil do PowerShell
- JetBrains Mono Nerd Font

## Clonar o repositório

```bash
git clone https://github.com/H0wZy/terminal.git
cd terminal
```

# Windows 11

## 1. Instalar as ferramentas

Abra o PowerShell e execute:

```powershell
winget install Git.Git
winget install Microsoft.WindowsTerminal
winget install Microsoft.PowerShell
winget install JanDeDobbeleer.OhMyPosh
```

Feche e abra novamente o Windows Terminal após a instalação.

## 2. Instalar a fonte

Abra a pasta:

```text
fonts/Nerd Fonts/JetBrains Mono/
```

Selecione os arquivos `.ttf`, clique com o botão direito e escolha **Instalar**.

Depois, no Windows Terminal:

1. Abra **Configurações**
2. Selecione o perfil do PowerShell
3. Entre em **Aparência**
4. Escolha `JetBrainsMono Nerd Font Mono`

## 3. Instalar o tema

No PowerShell, dentro deste repositório:

```powershell
New-Item -ItemType Directory -Force "$HOME\.config\ohmyposh"

Copy-Item `
  ".\.config\ohmyposh\howzy-main-theme.omp.json" `
  "$HOME\.config\ohmyposh\" `
  -Force
```

## 4. Configurar o PowerShell

Faça backup do perfil atual:

```powershell
if (Test-Path $PROFILE) {
    Copy-Item $PROFILE "$PROFILE.backup"
}
```

Crie a pasta e copie o perfil:

```powershell
New-Item -ItemType Directory -Force (Split-Path $PROFILE)

Copy-Item `
  ".\powershell\Microsoft.PowerShell_profile.ps1" `
  $PROFILE `
  -Force
```

Recarregue o perfil:

```powershell
. $PROFILE
```

# Fedora 44 KDE Plasma

## 1. Instalar as ferramentas

Abra o Konsole:

```bash
sudo dnf install git oh-my-posh fontconfig
```

## 2. Instalar a fonte

Dentro deste repositório:

```bash
mkdir -p ~/.local/share/fonts/JetBrainsMonoNerdFont

cp "fonts/Nerd Fonts/JetBrains Mono/"*.ttf \
  ~/.local/share/fonts/JetBrainsMonoNerdFont/

fc-cache -f
```

Depois, no Konsole:

1. Abra **Configurações**
2. Entre em **Editar Perfil Atual**
3. Selecione **Aparência**
4. Escolha `JetBrainsMono Nerd Font Mono`

## 3. Instalar o tema

```bash
mkdir -p ~/.config/ohmyposh

cp .config/ohmyposh/howzy-main-theme.omp.json \
  ~/.config/ohmyposh/
```

## 4. Configurar o Bash

Faça backup da configuração atual:

```bash
cp ~/.bashrc ~/.bashrc.backup
```

Copie a configuração do repositório:

```bash
cp bash/.bashrc ~/.bashrc
source ~/.bashrc
```

# Atualizar o repositório

Depois de alterar alguma configuração:

```bash
git status
git add -A
git commit -m "chore: update terminal configuration"
git push
```

## Observações

- Use uma Nerd Font no terminal para que os ícones apareçam corretamente.
- Faça backup das configurações existentes antes de substituí-las.
- Não adicione senhas, tokens ou outras informações sensíveis ao repositório.
- Alguns caminhos podem precisar de ajustes dependendo do usuário ou do ambiente.