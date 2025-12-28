Add-Type -AssemblyName PresentationFramework, System.Windows.Forms, System.Drawing

# --- CONFIGURAÇÃO DA JANELA ---
$MainWin = New-Object Windows.Forms.Form
$MainWin.Text = "LOST ENGINE | SUPREME OPTIMIZATION"
$MainWin.Size = New-Object Drawing.Size(800, 500)
$MainWin.StartPosition = "CenterScreen"
$MainWin.BackColor = "#121212"
$MainWin.FormBorderStyle = "FixedSingle"
$MainWin.MaximizeBox = $false

# --- TÍTULO ---
$Title = New-Object Windows.Forms.Label
$Title.Text = "LOST ENGINE TWEAKS"
$Title.Font = New-Object Drawing.Font("Segoe UI", 20, [Drawing.FontStyle]::Bold)
$Title.ForeColor = "Cyan"
$Title.AutoSize = $true
$Title.Location = New-Object Drawing.Point(240, 20)
$MainWin.Controls.Add($Title)

# --- FUNÇÃO PARA CRIAR BOTÕES ---
function Create-Button($Name, $Top, $Left, $Action) {
    $Btn = New-Object Windows.Forms.Button
    $Btn.Text = $Name
    $Btn.Size = New-Object Drawing.Size(220, 45)
    $Btn.Location = New-Object Drawing.Point($Left, $Top)
    $Btn.FlatStyle = "Flat"
    $Btn.ForeColor = "White"
    $Btn.BackColor = "#1f1f1f"
    $Btn.Font = New-Object Drawing.Font("Segoe UI", 10, [Drawing.FontStyle]::Bold)
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    $Btn.FlatAppearance.BorderSize = 1
    $Btn.FlatAppearance.BorderColor = "Cyan"
    $Btn.Add_Click($Action)
    $MainWin.Controls.Add($Btn)
}

# --- AÇÕES REAIS DOS BOTÕES ---
$CleanAction = { 
    Write-Host "Limpando arquivos temporários..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    [Windows.Forms.MessageBox]::Show("Limpeza de Disco Concluída!", "Lost Engine")
}

$NetworkAction = { 
    Write-Host "Otimizando rede..." -ForegroundColor Cyan
    netsh int tcp set global autotuninglevel=disabled
    netsh int tcp set global chimney=enabled
    ipconfig /flushdns
    [Windows.Forms.MessageBox]::Show("Rede Otimizada para Jogos!", "Lost Engine")
}

$PowerAction = {
    Write-Host "Ativando Plano Ultra..." -ForegroundColor Green
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    [Windows.Forms.MessageBox]::Show("Plano de Desempenho Máximo Ativado!", "Lost Engine")
}

$TelemetryAction = {
    Write-Host "Desativando Telemetria..." -ForegroundColor Magenta
    sc stop DiagTrack; sc config DiagTrack start= disabled
    [Windows.Forms.MessageBox]::Show("Telemetria e Rastreamento Desativados!", "Lost Engine")
}

# --- ADICIONANDO BOTÕES AO PAINEL ---
Create-Button "Deep Clean" 100 280 $CleanAction
Create-Button "Optimize Network" 160 280 $NetworkAction
Create-Button "Ultra Performance" 220 280 $PowerAction
Create-Button "Disable Telemetry" 280 280 $TelemetryAction

# --- RODAR A JANELA ---
$MainWin.ShowDialog()
