local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:Service("RunService")
local CoreGui = game:Service("CoreGui")

if CoreGui:FindFirstChild("FOX_Fly_Gui") then
    CoreGui.FOX_Fly_Gui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FOX_Fly_Gui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 120)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local RED_AKA = Color3.fromRGB(200, 30, 30)
local BLUE_AO = Color3.fromRGB(30, 80, 200)
local PURPLE_MURASAKI = Color3.fromRGB(110, 40, 180)
local DARK_BG = Color3.fromRGB(30, 30, 35)

local function createButton(name, text, pos, size, bgCol, parent)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = text
    btn.Size = size
    btn.Position = pos
    btn.BackgroundColor3 = bgCol
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(0,0,0)
    btn.Parent = parent
    return btn
end

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Text = "  FOX Fly"
TitleLabel.Size = UDim2.new(0, 230, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = PURPLE_MURASAKI
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 20
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

local MinBtn = createButton("MinBtn", "-", UDim2.new(0, 230, 0, 0), UDim2.new(0, 60, 0, 40), BLUE_AO, MainFrame)
local CloseBtn = createButton("CloseBtn", "X", UDim2.new(0, 290, 0, 0), UDim2.new(0, 60, 0, 40), RED_AKA, MainFrame)

local UpBtn = createButton("UpBtn", "لأعلى", UDim2.new(0, 0, 0, 40), UDim2.new(0, 80, 0, 40), BLUE_AO, MainFrame)
local SpeedUpBtn = createButton("SpeedUpBtn", "+", UDim2.new(0, 80, 0, 40), UDim2.new(0, 60, 0, 40), PURPLE_MURASAKI, MainFrame)
local FlyBtn = createButton("FlyBtn", "طيران", UDim2.new(0, 140, 0, 40), UDim2.new(0, 210, 0, 40), RED_AKA, MainFrame)

local DownBtn = createButton("DownBtn", "لأسفل", UDim2.new(0, 0, 0, 80), UDim2.new(0, 80, 0, 40), BLUE_AO, MainFrame)
local SpeedDownBtn = createButton("SpeedDownBtn", "-", UDim2.new(0, 80, 0, 80), UDim2.new(0, 60, 0, 40), PURPLE_MURASAKI, MainFrame)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Text = "50"
SpeedLabel.Size = UDim2.new(0, 210, 0, 40)
SpeedLabel.Position = UDim2.new(0, 140, 0, 80)
SpeedLabel.BackgroundColor3 = DARK_BG
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.SourceSansBold
SpeedLabel.TextSize = 18
SpeedLabel.Parent = MainFrame

local flying = false
local speed = 50
local maxSpeed = 300
local minSpeed = 10
local flyConnection
local bodyVelocity, bodyGyro

local function updateSpeedDisplay()
    SpeedLabel.Text = tostring(speed)
end

local function startFly()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.maxTorque = Vector3.new(9e5, 9e5, 9e5)
    bodyGyro.cframe = root.CFrame
    bodyGyro.Parent = root
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.velocity = Vector3.new(0, 0, 0)
    bodyVelocity.maxForce = Vector3.new(9e5, 9e5, 9e5)
    bodyVelocity.Parent = root
    
    humanoid.PlatformStand = true
    local camera = workspace.CurrentCamera
    
    flyConnection = RunService.RenderStepped:Connect(function()
        if not character or not root.Parent or not flying then return end
        bodyGyro.cframe = camera.CFrame
        local moveDirection = humanoid.MoveDirection
        local velocity = moveDirection * speed
        bodyVelocity.velocity = Vector3.new(velocity.X, bodyVelocity.velocity.Y, velocity.Z)
    end)
end

local function stopFly()
    flying = false
    FlyBtn.Text = "طيران"
    FlyBtn.BackgroundColor3 = RED_AKA
    if flyConnection then flyConnection:Disconnect() end
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
    
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.PlatformStand = false end
    end
end

FlyBtn.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
    else
        flying = true
        FlyBtn.Text = "إيقاف"
        FlyBtn.BackgroundColor3 = BLUE_AO
        startFly()
    end
end)

SpeedUpBtn.MouseButton1Click:Connect(function()
    if speed < maxSpeed then
        speed = speed + 10
        updateSpeedDisplay()
    end
end)

SpeedDownBtn.MouseButton1Click:Connect(function()
    if speed > minSpeed then
        speed = speed - 10
        updateSpeedDisplay()
    end
end)

local upping = false
local downing = false

UpBtn.MouseButton1Down:Connect(function() upping = true end)
UpBtn.MouseButton1Up:Connect(function() upping = false end)
DownBtn.MouseButton1Down:Connect(function() downing = true end)
DownBtn.MouseButton1Up:Connect(function() downing = false end)

RunService.Heartbeat:Connect(function()
    if flying and bodyVelocity then
        local currentVel = bodyVelocity.velocity
        local verticalSpeed = 0
        if upping then verticalSpeed = speed end
        if downing then verticalSpeed = -speed end
        
        if not upping and not downing then
            bodyVelocity.velocity = Vector3.new(currentVel.X, 0, currentVel.Z)
        else
            bodyVelocity.velocity = Vector3.new(currentVel.X, verticalSpeed, currentVel.Z)
        end
    end
end)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    UpBtn.Visible = not minimized
    DownBtn.Visible = not minimized
    SpeedUpBtn.Visible = not minimized
    SpeedDownBtn.Visible = not minimized
    FlyBtn.Visible = not minimized
    SpeedLabel.Visible = not minimized
    MainFrame.Size = minimized and UDim2.new(0, 350, 0, 40) or UDim2.new(0, 350, 0, 120)
end)

CloseBtn.MouseButton1Click:Connect(function()
    stopFly()
    ScreenGui:Destroy()
end)
