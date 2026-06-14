local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 470, 0, 720)
Frame.Position = UDim2.new(0.5, -235, 0.5, -360)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Text = "FOX ULTIMATE DELTA HACK"
Title.Size = UDim2.new(1, 0, 0, 65)
Title.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local MinBtn = Instance.new("TextButton")
MinBtn.Text = "−"
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -45, 0, 15)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.TextScaled = true
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Parent = Frame
MinBtn.ZIndex = 5

local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 8)
MinBtnCorner.Parent = MinBtn

local dragging, dragInput, dragStart, startPos
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local minimized = false
local origSize = Frame.Size

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Frame.Size = UDim2.new(0, 470, 0, 65)
        MinBtn.Text = "+"
    else
        Frame.Size = origSize
        MinBtn.Text = "−"
    end
end)

local function GetCharacterElements()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid", 5)
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    return char, hum, hrp
end

local function AntiBanFull()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then 
            return nil 
        end
        if self:IsA("RemoteEvent") and (string.find(string.lower(self.Name), "ban") or string.find(string.lower(self.Name), "cheat") or string.find(string.lower(self.Name), "kick")) then
            return nil
        end
        return oldNamecall(self, ...)
    end)

    local oldIndex
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if not checkcaller() then
            if self:IsA("Humanoid") and key == "WalkSpeed" then return 16 end
            if self:IsA("Humanoid") and key == "JumpPower" then return 50 end
        end
        return oldIndex(self, key)
    end)
    
    if setfflag then pcall(function() setfflag("ReportCrash", "False") end) end
end

local function GodMode()
    local _, hum, _ = GetCharacterElements()
    if hum then
        hum.Health = math.huge
        hum.MaxHealth = math.huge
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    end
end

local function SuperSpeed()
    local _, hum, _ = GetCharacterElements()
    if hum then hum.WalkSpeed = 150 end
end

local function SuperJump()
    local _, hum, _ = GetCharacterElements()
    if hum then hum.JumpPower = 350 end
end

local function Fly()
    local char, hum, hrp = GetCharacterElements()
    if hrp and not hrp:FindFirstChild("FoxFlyVelocity") then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FoxFlyVelocity"
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = hrp
        
        UserInputService.InputBegan:Connect(function(k, gpe)
            if gpe then return end
            if k.KeyCode == Enum.KeyCode.E then
                local _, _, currentHrp = GetCharacterElements()
                if currentHrp and currentHrp:FindFirstChild("FoxFlyVelocity") then
                    currentHrp.FoxFlyVelocity.Velocity = currentHrp.CFrame.LookVector * 100
                end
            end
        end)
    end
end

local function Noclip()
    RunService.Stepped:Connect(function()
        if LocalPlayer.Character then
            for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end

local function KillAll()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.Health = 0
        end
    end
end

local function InfiniteJump()
    UserInputService.JumpRequest:Connect(function()
        local _, hum, _ = GetCharacterElements()
        if hum then hum:ChangeState("Jumping") end
    end)
end

local function TeleportMouse()
    LocalPlayer:GetMouse().Button1Down:Connect(function()
        local _, _, hrp = GetCharacterElements()
        if hrp and LocalPlayer:GetMouse().Hit then
            hrp.CFrame = CFrame.new(LocalPlayer:GetMouse().Hit.Position + Vector3.new(0, 5, 0))
        end
    end)
end

local function FullBright()
    Lighting.FogEnd = 999999
    Lighting.Brightness = 3
end

local buttons = {
    {Text="مضاد الحظر الكامل والـ بانق", Func=AntiBanFull},
    {Text="وضع الخلود مصلح ∞", Func=GodMode},
    {Text="السرعة الخارقة 150", Func=SuperSpeed},
    {Text="القفز الخارق 350", Func=SuperJump},
    {Text="الطيران المستمر (اضغط E)", Func=Fly},
    {Text="اختراق الجدران التلقائي", Func=Noclip},
    {Text="قتل جميع اللاعبين بالسيرفر", Func=KillAll},
    {Text="القفز اللانهائي في الهواء", Func=InfiniteJump},
    {Text="انتقال فوري لموقع الماوس", Func=TeleportMouse},
    {Text="الإضاءة الكاملة وإلغاء الضباب", Func=FullBright},
}

local y = 80
for _, b in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 48)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.Text = b.Text
    btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = Frame
    btn.MouseButton1Click:Connect(b.Func)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    y = y + 55
end

AntiBanFull()
