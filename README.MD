winget install JanDeDobbeleer.OhMyPosh

Install-Module -Name Terminal-Icons -Repository PSGallery

New-Item -Path $PROFILE -Type File -Force

notepad $PROFILE

oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/v-five/win-conf/main/v-five.omp.json' | Invoke-Expression
Import-Module -Name Terminal-Icons


Terminal settings:

"focusFollowMouse": false,
"tabWidthMode": "equal",
"useAcrylicInTabRow": true,

"profiles":
{
    "defaults":
    {
        "colorScheme": "One Half Dark",
        "font": { "face": "CaskaydiaCove NF" },
        "opacity": 75,
        "useAcrylic": true
    }
}

https://www.nerdfonts.com/font-downloads