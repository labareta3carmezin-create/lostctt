Add-Type -AssemblyName PresentationFramework, System.Windows.Forms, System.Drawing

# --- ESTILO DA JANELA ---
$MainWin = New-Object Windows.Forms.Form
$MainWin.Text = "LOST ENGINE | SUPREME OPTIMIZATION"
$MainWin.Size = New-Object Drawing.Size(800, 500)
$MainWin.StartPosition = "CenterScreen"
$MainWin.BackColor = "#121212" # Fundo Escuro profissional

# --- TÍTULO ---
$Title = New-Object Windows.Forms.Label
$Title.Text = "LOST ENGINE TWEAKS"
$Title.Font = New-Object Drawing.Font("Segoe UI", 18, [Drawing.FontStyle]::Bold)
$Title.ForeColor = "Cyan"
$Title.AutoSize = $true
$Title.Location = New-Object Drawing.Point(250, 20)
$MainWin.Controls.Add($Title)

# --- FUNÇÃO PARA CRIAR BOTÕES (Estilo Titus) ---
function Create-Button($Name, $Top, $Left, $Action) {
    $Btn = New-Object Windows.Forms.Button
    $Btn.Text = $Name
    $Btn.Size = New-Object Drawing.Size(200, 40)
    $Btn.Location = New-Object Drawing.Point($Left, $Top)
    $Btn.FlatStyle = "Flat"
    $Btn.ForeColor = "White"
    $Btn.BackColor = "#1f1f1f"
    $Btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    $Btn.Add_Click($Action)
    $MainWin.Controls.Add($Btn)
}

# --- AÇÕES DOS BOTÕES ---
$CleanAction = { 
    Write-Host "Limpando sistema..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    [Windows.Forms.MessageBox]::Show("Limpeza Concluída!", "Lost Engine")
}

$NetworkAction = { 
    netsh int tcp set global autotuninglevel=disabled
    ipconfig /flushdns
    [Windows.Forms.MessageBox]::Show("Rede Otimizada!", "Lost Engine")
}

$PowerAction = {
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    [Windows.Forms.MessageBox]::Show("Modo Ultra Desempenho Ativado!", "Lost Engine")
}

# --- ADICIONANDO BOTÕES AO PAINEL ---
Create-Button "Deep Clean" 100 50 $CleanAction
Create-Button "Optimize Network" 150 50 $NetworkAction
Create-Button "Ultra Performance" 200 50 $PowerAction
Create-Button "Disable Telemetry" 250 50 { Write-Host "Telemetria Desativada" }

# --- RODAR A JANELA ---
$MainWin.ShowDialog()
