# Inits
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/v-five/win-conf/main/v-five.omp.json' | Invoke-Expression
$env:POSH_GIT_ENABLED = $true
Import-Module -Name Terminal-Icons
Enable-PowerType
Import-Module PSFzf
Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView -EditMode Windows -HistorySearchCursorMovesToEnd

# Shortcuts
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r' -TabExpansion
Set-PSReadLineKeyHandler -Key Shift+Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key RightArrow -Function ForwardWord

Set-Alias grep findstr

function Yarn-Install { yarn install }
New-Alias yi Yarn-Install
function Yarn-Build { yarn build }
New-Alias yb Yarn-Build
function Yarn-Start { yarn start }
New-Alias ys Yarn-Start
function Yarn-StartAll { yarn start:all }
New-Alias ysa Yarn-StartAll

Set-PSReadLineKeyHandler -Key Ctrl+B `
-BriefDescription BuildCurrentDirectory `
-LongDescription "Build the current directory" `
-ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Key F1 `
                         -BriefDescription CommandHelp `
                         -LongDescription "Open the help window for the current command" `
                         -ScriptBlock {
    param($key, $arg)

    $ast = $null
    $tokens = $null
    $errors = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$ast, [ref]$tokens, [ref]$errors, [ref]$cursor)

    $commandAst = $ast.FindAll( {
        $node = $args[0]
        $node -is [CommandAst] -and
            $node.Extent.StartOffset -le $cursor -and
            $node.Extent.EndOffset -ge $cursor
        }, $true) | Select-Object -Last 1

    if ($commandAst -ne $null)
    {
        $commandName = $commandAst.GetCommandName()
        if ($commandName -ne $null)
        {
            $command = $ExecutionContext.InvokeCommand.GetCommand($commandName, 'All')
            if ($command -is [AliasInfo])
            {
                $commandName = $command.ResolvedCommandName
            }

            if ($commandName -ne $null)
            {
                Get-Help $commandName -ShowWindow
            }
        }
    }
}