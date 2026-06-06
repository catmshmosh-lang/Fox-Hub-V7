-- 🔥 FOX HUB v7 - الأقوى عالمياً 🔥
-- Discord: https://discord.gg/wTBffVMc7

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FOX_HUB_V7"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 570, 0, 800)
MainFrame.Position = UDim2.new(0.5, -285, 0.5, -400)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 18)
MainFrame.BackgroundTransparency = 0.08
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 80)
Title.BackgroundColor3 = Color3.fromRGB(0, 255, 220)
Title.Text = "🔥 FOX HUB v7 🔥"
Title.TextColor3 = Color3.new(0,0,0)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0.9, 0, 0, 45)
DiscordBtn.Position = UDim2.new(0.05, 0, 0.12, 0)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.Text = "📌 انضم للسيرفر"
DiscordBtn.TextScaled = true
DiscordBtn.Parent = MainFrame

local function Notify(title, text)
    StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 5})
end

local function LoadScript(name, url)
    Notify("جاري التحميل...", name)
    pcall(function()
        loadstring(game:HttpGet(url, true))()
        Notify("✅ تم", name)
    end)
end

-- ==================== صورتك (FOX) ====================
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1.5)
    local head = char:FindFirstChild("Head")
    if head then
        local bb = Instance.new("BillboardGui", head)
        bb.Size = UDim2.new(0, 340, 0, 340)
        bb.StudsOffset = Vector3.new(0, 8, 0)
        bb.AlwaysOnTop = true
        
        local img = Instance.new("ImageLabel", bb)
        img.Size = UDim2.new(1,0,1,0)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://YOUR_IMAGE_ID_HERE"   -- ← غير هذا بالـ ID
        img.ImageTransparency = 0.1
    end
end)

-- Kill Aura + Auto Collect + Click TP + ...
local killAura = false
local autoCollect = false

RunService.Heartbeat:Connect(function()
    if killAura and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character.HumanoidRootPart
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr \~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                if (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude < 25 then
                    plr.Character.Humanoid.Health = 0
                end
            end
        end
    end
end)

-- أزرار الهاكات (مختصرة)
local y = 0.19
local function AddBtn(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 52)
    btn.Position = UDim2.new(0.05, 0, y, 0)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextScaled = true
    btn.Parent = MainFrame
    btn.MouseButton1Click:Connect(callback)
    y = y + 0.08
end

AddBtn("⚔️ Kill Aura ON/OFF", Color3.fromRGB(255, 50, 50), function()
    killAura = not killAura
    Notify("Kill Aura", killAura and "مفعل" or "معطل")
end)

AddBtn("🪙 Auto Collect", Color3.fromRGB(0, 255, 150), function()
    autoCollect = not autoCollect
    Notify("Auto Collect", autoCollect and "مفعل" or "معطل")
end)

AddBtn("📍 Click TP (Shift+Click)", Color3.fromRGB(100, 200, 255), function() Notify("Click TP", "اضغط Shift + Click") end)

AddBtn("⚡ سرعة 500", Color3.fromRGB(255, 140, 0), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = 500 end
end)

AddBtn("🦘 Infinite Jump", Color3.fromRGB(0, 220, 100), function() Notify("Infinite Jump", "مفعل") end)

AddBtn("🕊️ Fly + Admin (IY)", Color3.fromRGB(100, 50, 255), function()
    LoadScript("Infinite Yield", "https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua")
end)

-- Minimize
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 70, 0, 70)
MinBtn.Position = UDim2.new(1, -70, 0, 0)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
MinBtn.Text = "−"
MinBtn.TextScaled = true
MinBtn.Parent = MainFrame

MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/wTBffVMc7")
    Notify("FOX HUB", "تم نسخ الرابط!")
end)

Notify("FOX HUB v7", "تم التحميل | غير ID الصورة!")
print("✅ FOX HUB v7 Loaded")
