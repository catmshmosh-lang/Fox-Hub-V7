MainFrame.Draggablelocal Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FOX_Hub"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 160)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(138, 43, 226) 
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "FOX HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Parent = MainFrame
FlyButton.Position = UDim2.new(0.1, 0, 0.35, 0)
FlyButton.Size = UDim2.new(0.8, 0, 0.25, 0)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
FlyButton.Font = Enum.Font.GothamBold
FlyButton.Text = "Fly: OFF"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextSize = 14

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = FlyButton

local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "SpeedInput"
SpeedInput.Parent = MainFrame
SpeedInput.Position = UDim2.new(0.1, 0, 0.7, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0.2, 0)
SpeedInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
SpeedInput.Font = Enum.Font.Gotham
SpeedInput.Text = "50"
SpeedInput.PlaceholderText = "Speed"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.TextSize = 14

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = SpeedInput

local Flying = false
local Speed = 50
local BV, BG

local function endFlying()
    Flying = false
    FlyButton.Text = "Fly: OFF"
    FlyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    if BV then BV:Destroy() BV = nil end
    if BG then BG:Destroy() BG = nil end
end

local function startFlying()
    local Character = Player.Character
    local HumRoot = Character and Character:FindFirstChild("HumanoidRootPart")
    
    if not HumRoot then return end
    
    BV = Instance.new("BodyVelocity")
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BV.Velocity = Vector3.new(0, 0, 0)
    BV.Parent = HumRoot
    
    BG = Instance.new("BodyGyro")
    BG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BG.CFrame = HumRoot.CFrame
    BG.Parent = HumRoot
    
    task.spawn(function()
        while Flying and Character and HumRoot.Parent do
            BV.Velocity = Camera.CFrame.LookVector * Speed
            BG.CFrame = Camera.CFrame
            task.wait()
        end
        endFlying()
    end)
end

FlyButton.MouseButton1Click:Connect(function()
    Flying = not Flying
    if Flying then
        FlyButton.Text = "Fly: ON"
        FlyButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
        startFlying()
    else
        endFlying()
    end
end)

SpeedInput.FocusLost:Connect(function()
    local num = tonumber(SpeedInput.Text)
    if num then Speed = num else SpeedInput.Text = tostring(Speed) end
end)

Player.CharacterRemoving:Connect(endFlying)
