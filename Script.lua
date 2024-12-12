-- Script para configurar sorte no Fisch com menu interativo
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local closeButton = Instance.new("TextButton")
local minimizeButton = Instance.new("TextButton")
local luckTextBox = Instance.new("TextBox")
local setLuckButton = Instance.new("TextButton")
local dragging = false
local dragInput, dragStart, startPos

-- Configuração da interface
gui.Name = "LuckGUI"
gui.Parent = game.CoreGui

frame.Name = "MainFrame"
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Active = true
frame.Draggable = true

closeButton.Name = "CloseButton"
closeButton.Parent = frame
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Text = "X"
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

minimizeButton.Name = "MinimizeButton"
minimizeButton.Parent = frame
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
minimizeButton.Position = UDim2.new(0.8, 0, 0, 0)
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Text = "-"
minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

luckTextBox.Name = "LuckTextBox"
luckTextBox.Parent = frame
luckTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
luckTextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
luckTextBox.Size = UDim2.new(0, 200, 0, 40)
luckTextBox.Font = Enum.Font.SourceSans
luckTextBox.PlaceholderText = "Digite o valor da sorte"
luckTextBox.Text = ""
luckTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
luckTextBox.TextScaled = true

setLuckButton.Name = "SetLuckButton"
setLuckButton.Parent = frame
setLuckButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
setLuckButton.Position = UDim2.new(0.1, 0, 0.7, 0)
setLuckButton.Size = UDim2.new(0, 200, 0, 40)
setLuckButton.Font = Enum.Font.SourceSans
setLuckButton.Text = "Definir Sorte"
setLuckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
setLuckButton.TextScaled = true
setLuckButton.MouseButton1Click:Connect(function()
    local luckValue = tonumber(luckTextBox.Text)
    if luckValue then
        local stats = player:FindFirstChild("Stats")
        if stats and stats:FindFirstChild("Luck") then
            stats.Luck.Value = luckValue
            print("Sorte definida para:", luckValue)
        else
            warn("Sistema de sorte não encontrado.")
        end
    else
        warn("Digite um valor numérico válido.")
    end
end)
