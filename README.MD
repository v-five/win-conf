# Posh Terminal

### Requirements
- [Powershell 7.3 or newer](https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D "PS Latest")
- [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701)
- [Nerd font](https://www.nerdfonts.com/font-downloads)

### Modules
- [Oh My Posh](https://ohmyposh.dev "A prompt theme engine for any shell")
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons "File & Folder Icons in PS")
- [Power Type](https://github.com/AnderssonPeter/PowerType "Autocomplete for PS")
- [fzf](https://github.com/junegunn/fzf "Fuzzy finder")
- [PSfzf](https://github.com/kelleyma49/PSFzf)
- [Posh git](https://github.com/dahlbyk/posh-git)
- [z](https://github.com/ajeetdsouza/zoxide "zoxide")
- [fuck](https://github.com/nvbn/thefuck)

```Powershell
winget install JanDeDobbeleer.OhMyPosh
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module PowerType -AllowPrerelease
winget install fzf
Install-Module PSFzf
Install-Module posh-git
Install-Module -Name z
```

### PS profile
#### Create
```Powershell
New-Item -Path $PROFILE -Type File -Force
```

#### Edit
`fleet $PROFILE`

### Terminal settings:
```json
{
  "focusFollowMouse": false,
  "tabWidthMode": "equal",
  "useAcrylicInTabRow": true,
  "profiles": {
    "defaults": {
      "colorScheme": "One Half Dark",
      "font": {
        "face": "CaskaydiaCove NF"
      },
      "opacity": 75,
      "useAcrylic": true
    }
  }
}
```