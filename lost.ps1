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

# --- FUNÇÃO PARA CRIAR BOTÕES
