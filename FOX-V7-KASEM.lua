local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local OpenCloseBtn = Instance.new("TextButton")
local SpeedBtn = Instance.new("TextButton")
local GodBtn = Instance.new("TextButton")
local World2Btn = Instance.new("TextButton")
local FarmBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "FoxHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "🦊 فوكس هاب V7"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

local function styleButton(btn, text, pos)
    btn.Parent = MainFrame
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Position = pos
    btn.Size = UDim2.new(0, 210, 0, 40)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
end

styleButton(FarmBtn, "🔥 تشغيل التجميع التلقائي", UDim2.new(0, 20, 0, 60))
styleButton(World2Btn, "🌌 السفر للعالم الثاني", UDim2.new(0, 20, 0, 110))
styleButton(SpeedBtn, "🏃‍♂️ تفعيل السرعة اللانهائية", UDim2.new(0, 20, 0, 160))
styleButton(GodBtn, "🛡️ الحماية ضد ليزر الموت", UDim2.new(0, 20, 0, 210))

OpenCloseBtn.Parent = ScreenGui
OpenCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
OpenCloseBtn.Position = UDim2.new(0, 10, 0, 10)
OpenCloseBtn.Size = UDim2.new(0, 80, 0, 35)
OpenCloseBtn.Text = "إخفاء/إظهار"
OpenCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

OpenCloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local Player = game.Players.LocalPlayer
local FastFarm = false

local function getHRP()
    return Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
end

FarmBtn.MouseButton1Click:Connect(function()
    FastFarm = not FastFarm
    if FastFarm then
        FarmBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        task.spawn(function()
            while FastFarm do
                task.wait(0.01)
                pcall(function()
                    local hrp = getHRP()
                    if hrp then
                        for _, obj in pairs(workspace:GetDescendants()) do
                            if obj:IsA("BasePart") and (obj.Name == "1 Cup" or obj.Name:lower():find("cup")) then
                                hrp.CFrame = obj.CFrame + Vector3.new(0, 2, 0)
                                break
                            end
                        end
                    end
                end)
            end
        end)
    else
        FarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

World2Btn.MouseButton1Click:Connect(function()
    pcall(function()
        local hrp = getHRP()
        if hrp then
            local Portal = workspace:FindFirstChild("World2Portal") or workspace:FindFirstChild("TeleportToWorld2")
            hrp.CFrame = Portal and Portal.CFrame or CFrame.new(5000, 500, 5000)
        end
    end)
end)

SpeedBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = 150
        end
    end)
end)

GodBtn.MouseButton1Click:Connect(function()
    pcall(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then v:Destroy() end
        end
    end)
end)
