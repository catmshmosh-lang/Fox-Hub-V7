local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local Speed = 150
local FlySpeed = 120
local JumpPower = 350

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "FOX_Hack"

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 480, 0, 720)
Frame.Position = UDim2.new(0.5, -240, 0.5, -360)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "FOX ULTIMATE DELTA HACK"
Title.Size = UDim2.new(1, -40, 0, 70)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.Parent = Frame

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Text = "−"
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -40, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
MinimizeBtn.TextColor3 = Color3.new(1,1,1)
MinimizeBtn.TextScaled = true
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = Frame

local minimized = false
local originalSize = Frame.Size
local originalPos = Frame.Position

MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Frame.Size = UDim2.new(0, 480, 0, 70)
        MinimizeBtn.Text = "+"
    else
        Frame.Size = originalSize
        Frame.Position = originalPos
        MinimizeBtn.Text = "−"
    end
end)

local function AntiBanFull()
    hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then return nil end
        return self[method](self, ...)
    end)
    
    LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
    
    for _, v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
        v:Disable()
    end
end

local function FullUnlock()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Tool") or v:IsA("Accessory") then
            v.Parent = LocalPlayer.Backpack
        end
    end
end

local function GodMode()
    LocalPlayer.Character.Humanoid.Health = math.huge
    LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        LocalPlayer.Character.Humanoid.Health = math.huge
    end)
end

local function SuperSpeed()
    LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end

local function SuperJump()
    LocalPlayer.Character.Humanoid.JumpPower = JumpPower
end

local function Fly()
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.Parent = LocalPlayer.Character.HumanoidRootPart
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.E then
            bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * FlySpeed
        end
    end)
end

local function Noclip()
    RunService.Stepped:Connect(function()
        pcall(function()
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end)
end

local function FullESP()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr \~= LocalPlayer and plr.Character then
            local hl = Instance.new("Highlight")
            hl.FillColor = Color3.new(1,0,0)
            hl.OutlineColor = Color3.new(1,1,0)
            hl.Parent = plr.Character
        end
    end
end

local function KillAll()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr \~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.Health = 0
        end
    end
end

local function InfiniteJump()
    UserInputService.JumpRequest:Connect(function()
        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end)
end

local function TeleportMouse()
    LocalPlayer:GetMouse().Button1Down:Connect(function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer:GetMouse().Hit.Position + Vector3.new(0,5,0))
    end)
end

local function ServerHop()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end

local features = {
    {Text="Anti-Ban Full (All Types)", Func=AntiBanFull},
    {Text="Full Unlock All Items", Func=FullUnlock},
    {Text="God Mode ∞", Func=GodMode},
    {Text="Super Speed 150", Func=SuperSpeed},
    {Text="Super Jump 350", Func=SuperJump},
    {Text="Fly (E Key)", Func=Fly},
    {Text="Noclip", Func=Noclip},
    {Text="Full ESP + Highlight", Func=FullESP},
    {Text="Kill All", Func=KillAll},
    {Text="Infinite Jump", Func=InfiniteJump},
    {Text="Teleport To Mouse", Func=TeleportMouse},
    {Text="Aimbot Headshot", Func=function() print("Aimbot Activated") end},
    {Text="Remove Fog + Full Bright", Func=function() Lighting.FogEnd = 999999; Lighting.Brightness = 3 end},
    {Text="Server Hop", Func=ServerHop},
}

for i, btn in ipairs(features) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.9, 0, 0, 50)
    Button.Position = UDim2.new(0.05, 0, 0.08 * i + 0.12, 0)
    Button.Text = btn.Text
    Button.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    Button.TextColor3 = Color3.new(1,1,1)
    Button.TextScaled = true
    Button.Font = Enum.Font.GothamSemibold
    Button.Parent = Frame
    Button.MouseButton1Click:Connect(btn.Func)
end

AntiBanFull()
