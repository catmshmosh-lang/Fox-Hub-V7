local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:Service("RunService")
local CoreGui = game:Service("CoreGui")
local UserInputService = game:Service("UserInputService")
local Lighting = game:Service("Lighting")
local TeleportService = game:Service("TeleportService")
if CoreGui:FindFirstChild("FOX_Admin_Gui") then
CoreGui.FOX_Admin_Gui:Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FOX_Admin_Gui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 440, 0, 240)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui
local BackgroundImage = Instance.new("ImageLabel")
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.Position = UDim2.new(0, 0, 0, 0)
BackgroundImage.BorderSizePixel = 0
BackgroundImage.BackgroundTransparency = 0.4
BackgroundImage.Image = "rbxassetid://7061193672"
BackgroundImage.Parent = MainFrame
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true; dragStart = input.Position; startPos = MainFrame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then dragging = false end
end)
end
end)
MainFrame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
local RED_AKA = Color3.fromRGB(200, 30, 30)
local BLUE_AO = Color3.fromRGB(30, 80, 200)
local PURPLE_MURASAKI = Color3.fromRGB(110, 40, 180)
local DARK_BG = Color3.fromRGB(25, 25, 30)
local function createButton(name, text, pos, size, bgCol, parent)
local btn = Instance.new("TextButton")
btn.Name = name; btn.Text = text; btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = bgCol
btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 11
btn.BorderSizePixel = 1; btn.BorderColor3 = Color3.fromRGB(0,0,0); btn.ZIndex = 3; btn.Parent = parent
return btn
end
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Text = " FOX"
TitleLabel.Size = UDim2.new(0, 340, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = PURPLE_MURASAKI
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold; TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left; TitleLabel.ZIndex = 3; TitleLabel.Parent = MainFrame
local MinBtn = Instance.new("ImageButton")
MinBtn.Name = "MinBtn"; MinBtn.Size = UDim2.new(0, 50, 0, 30); MinBtn.Position = UDim2.new(0, 340, 0, 0)
MinBtn.BackgroundColor3 = BLUE_AO; MinBtn.BorderSizePixel = 1; MinBtn.BorderColor3 = Color3.fromRGB(0,0,0)
MinBtn.Image = "rbxassetid://7061193672"; MinBtn.ZIndex = 3; MinBtn.Parent = MainFrame
local CloseBtn = createButton("CloseBtn", "X", UDim2.new(0, 390, 0, 0), UDim2.new(0, 50, 0, 30), RED_AKA, MainFrame)
local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 90, 0, 210)
LeftPanel.Position = UDim2.new(0, 0, 0, 30)
LeftPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
LeftPanel.BorderSizePixel = 0; LeftPanel.ZIndex = 3; LeftPanel.Parent = MainFrame
local TabCmdBtn = createButton("TabCmdBtn", "الأوامر النصية", UDim2.new(0, 2, 0, 5), UDim2.new(0, 86, 0, 25), RED_AKA, LeftPanel)
local TabFlyBtn = createButton("TabFlyBtn", "طيران ومشي", UDim2.new(0, 2, 0, 35), UDim2.new(0, 86, 0, 25), DARK_BG, LeftPanel)
local TabPlayerBtn = createButton("TabPlayerBtn", "خصائص اللاعب", UDim2.new(0, 2, 0, 65), UDim2.new(0, 86, 0, 25), DARK_BG, LeftPanel)
local TabTrollBtn = createButton("TabTrollBtn", "أزرار التخريب", UDim2.new(0, 2, 0, 95), UDim2.new(0, 86, 0, 25), DARK_BG, LeftPanel)
local TabWorldBtn = createButton("TabWorldBtn", "السيرفر والعالم", UDim2.new(0, 2, 0, 125), UDim2.new(0, 86, 0, 25), DARK_BG, LeftPanel)
local function createContainer()
local scv = Instance.new("ScrollingFrame")
scv.Size = UDim2.new(0, 350, 0, 210); scv.Position = UDim2.new(0, 90, 0, 30); scv.BackgroundTransparency = 1; scv.ZIndex = 3
scv.CanvasSize = UDim2.new(0, 0, 0, 300); scv.ScrollBarThickness = 4; scv.Visible = false; scv.Parent = MainFrame
return scv
end
local CmdContainer = createContainer(); CmdContainer.Visible = true
local CmdInput = Instance.new("TextBox")
CmdInput.Size = UDim2.new(0, 335, 0, 35); CmdInput.Position = UDim2.new(0, 5, 0, 5)
CmdInput.BackgroundColor3 = DARK_BG; CmdInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdInput.PlaceholderText = "اكتب الأمر هنا (مثال: طيران، سرعة 100، فلنلق)..."; CmdInput.Font = Enum.Font.SourceSansBold; CmdInput.TextSize = 13
CmdInput.ZIndex = 3; CmdInput.Parent = CmdContainer
local ExecCmdBtn = createButton("ExecCmdBtn", "تنفيذ الأمر الفوري", UDim2.new(0, 5, 0, 45), UDim2.new(0, 335, 0, 35), PURPLE_MURASAKI, CmdContainer)
local CmdListLabel = Instance.new("TextLabel")
CmdListLabel.Text = "قائمة الأوامر النصية المدعومة كتابةً:\n- طيران / الغاء_طيران\n- سرعة [رقم] / قفزة [رقم]\n- اختراق / الغاء_اختراق\n- فلنلق [اسم] / بانق [اسم]\n- انتحار / دمج_اسلحة / طرد_نفسي / جدران"
CmdListLabel.Size = UDim2.new(0, 335, 0, 100); CmdListLabel.Position = UDim2.new(0, 5, 0, 90)
CmdListLabel.BackgroundColor3 = Color3.fromRGB(10,10,10); CmdListLabel.BackgroundTransparency = 0.5
CmdListLabel.TextColor3 = Color3.fromRGB(200, 200, 200); CmdListLabel.Font = Enum.Font.SourceSans; CmdListLabel.TextSize = 11
CmdListLabel.TextYAlignment = Enum.TextYAlignment.Top; CmdListLabel.TextXAlignment = Enum.TextXAlignment.Left; CmdListLabel.ZIndex = 3; CmdListLabel.Parent = CmdContainer
local FlyContainer = createContainer()
local UpBtn = createButton("UpBtn", "لأعلى", UDim2.new(0, 5, 0, 5), UDim2.new(0, 70, 0, 35), BLUE_AO, FlyContainer)
local SpeedUpBtn = createButton("SpeedUpBtn", "+", UDim2.new(0, 80, 0, 5), UDim2.new(0, 45, 0, 35), PURPLE_MURASAKI, FlyContainer)
local FlyBtn = createButton("FlyBtn", "طيران", UDim2.new(0, 130, 0, 5), UDim2.new(0, 210, 0, 35), RED_AKA, FlyContainer)
local DownBtn = createButton("DownBtn", "لأسفل", UDim2.new(0, 5, 0, 45), UDim2.new(0, 70, 0, 35), BLUE_AO, FlyContainer)
local SpeedDownBtn = createButton("SpeedDownBtn", "-", UDim2.new(0, 80, 0, 45), UDim2.new(0, 45, 0, 35), PURPLE_MURASAKI, FlyContainer)
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Text = "السرعة: 50"; SpeedLabel.Size = UDim2.new(0, 210, 0, 35); SpeedLabel.Position = UDim2.new(0, 130, 0, 45)
SpeedLabel.BackgroundColor3 = DARK_BG; SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.SourceSansBold; SpeedLabel.TextSize = 13; SpeedLabel.ZIndex = 3; SpeedLabel.Parent = FlyContainer
local AirWalkBtn = createButton("AirWalkBtn", "المشي على الهواء: مقفل", UDim2.new(0, 5, 0, 85), UDim2.new(0, 335, 0, 35), DARK_BG, FlyContainer)
local FloatBtn = createButton("FloatBtn", "تثبيت الارتفاع في الهواء: مقفل", UDim2.new(0, 5, 0, 125), UDim2.new(0, 335, 0, 35), DARK_BG, FlyContainer)
local PlayerContainer = createContainer()
local InfJumpBtn = createButton("InfJumpBtn", "قفز لانهائي: مقفل", UDim2.new(0, 5, 0, 5), UDim2.new(0, 160, 0, 35), DARK_BG, PlayerContainer)
local NoclipBtn = createButton("NoclipBtn", "اختراق الجدران: مقفل", UDim2.new(0, 175, 0, 5), UDim2.new(0, 165, 0, 35), DARK_BG, PlayerContainer)
local SuperSpeedBtn = createButton("SuperSpeedBtn", "سرعة مشي عالية جداً", UDim2.new(0, 5, 0, 45), UDim2.new(0, 160, 0, 35), RED_AKA, PlayerContainer)
local HighJumpBtn = createButton("HighJumpBtn", "قفزة خارقة جداً", UDim2.new(0, 175, 0, 45), UDim2.new(0, 165, 0, 35), BLUE_AO, PlayerContainer)
local GodBtn = createButton("GodBtn", "نمط الخلود (تثبيت الدم)", UDim2.new(0, 5, 0, 85), UDim2.new(0, 160, 0, 35), PURPLE_MURASAKI, PlayerContainer)
local InvisibleBtn = createButton("InvisibleBtn", "اختفاء كامل عن السيرفر", UDim2.new(0, 175, 0, 85), UDim2.new(0, 165, 0, 35), DARK_BG, PlayerContainer)
local ResetSpeedBtn = createButton("ResetSpeedBtn", "إعادة الخصائص العادية", UDim2.new(0, 5, 0, 125), UDim2.new(0, 160, 0, 35), DARK_BG, PlayerContainer)
local RespawnBtn = createButton("RespawnBtn", "إعادة رسبون (انتحار)", UDim2.new(0, 175, 0, 125), UDim2.new(0, 165, 0, 35), RED_AKA, PlayerContainer)
local SitBtn = createButton("SitBtn", "أمر الجلوس التلقائي", UDim2.new(0, 5, 0, 165), UDim2.new(0, 160, 0, 35), BLUE_AO, PlayerContainer)
local SpinBtn = createButton("SpinBtn", "دوران الشخصية الإعصاري", UDim2.new(0, 175, 0, 165), UDim2.new(0, 165, 0, 35), PURPLE_MURASAKI, PlayerContainer)
local TrollContainer = createContainer()
local PlayerInput = Instance.new("TextBox")
PlayerInput.Size = UDim2.new(0, 335, 0, 30); PlayerInput.Position = UDim2.new(0, 5, 0, 5)
PlayerInput.BackgroundColor3 = DARK_BG; PlayerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerInput.PlaceholderText = "اكتب اسم الضحية للـ أزرار أدناه..."; PlayerInput.Font = Enum.Font.SourceSansBold; PlayerInput.TextSize = 13
PlayerInput.ZIndex = 3; PlayerInput.Parent = TrollContainer
local FlingBtn = createButton("FlingBtn", "فلنلق (قذف الضحية) 🤫", UDim2.new(0, 5, 0, 40), UDim2.new(0, 160, 0, 35), RED_AKA, TrollContainer)
local BungBtn = createButton("BungBtn", "بانق (التصاق فوقه) 🤫", UDim2.new(0, 175, 0, 40), UDim2.new(0, 165, 0, 35), BLUE_AO, TrollContainer)
local TpToBtn = createButton("TpToBtn", "انتقال فوري إلى الضحية", UDim2.new(0, 5, 0, 80), UDim2.new(0, 160, 0, 35), PURPLE_MURASAKI, TrollContainer)
local VoidBtn = createButton("VoidBtn", "سحب الضحية للهاوية", UDim2.new(0, 175, 0, 80), UDim2.new(0, 165, 0, 35), RED_AKA, TrollContainer)
local KillToolBtn = createButton("KillToolBtn", "أمر مسك وقتل اللاعبين", UDim2.new(0, 5, 0, 120), UDim2.new(0, 160, 0, 35), DARK_BG, TrollContainer)
local BringItemsBtn = createButton("BringItemsBtn", "سحب جميع أسلحة الأرض", UDim2.new(0, 175, 0, 120), UDim2.new(0, 165, 0, 35), PURPLE_MURASAKI, TrollContainer)
local WorldContainer = createContainer()
local EspBtn = createButton("EspBtn", "رؤية اللاعبين خلف الجدران (ESP)", UDim2.new(0, 5, 0, 5), UDim2.new(0, 335, 0, 35), BLUE_AO, WorldContainer)
local InfYieldBtn = createButton("InfYieldBtn", "تحميل سكربت Infinite Yield", UDim2.new(0, 5, 0, 45), UDim2.new(0, 335, 0, 35), PURPLE_MURASAKI, WorldContainer)
local FullBrightBtn = createButton("FullBrightBtn", "إضاءة كاملة (إلغاء الظلام)", UDim2.new(0, 5, 0, 85), UDim2.new(0, 160, 0, 35), DARK_BG, WorldContainer)
local AntiLagBtn = createButton("AntiLagBtn", "إزالة القلق واللاغ (FPS Boost)", UDim2.new(0, 175, 0, 85), UDim2.new(0, 165, 0, 35), RED_AKA, WorldContainer)
local NoFogBtn = createButton("NoFogBtn", "إزالة الضباب بالكامل", UDim2.new(0, 5, 0, 125), UDim2.new(0, 160, 0, 35), DARK_BG, WorldContainer)
local RejoinBtn = createButton("RejoinBtn", "إعادة دخول السيرفر فوراُ", UDim2.new(0, 175, 0, 125), UDim2.new(0, 165, 0, 35), BLUE_AO, WorldContainer)
local function switchTab(activeContainer, activeBtn)
CmdContainer.Visible = false; FlyContainer.Visible = false; PlayerContainer.Visible = false; TrollContainer.Visible = false; WorldContainer.Visible = false
TabCmdBtn.BackgroundColor3 = DARK_BG; TabFlyBtn.BackgroundColor3 = DARK_BG; TabPlayerBtn.BackgroundColor3 = DARK_BG; TabTrollBtn.BackgroundColor3 = DARK_BG; TabWorldBtn.BackgroundColor3 = DARK_BG
activeContainer.Visible = true; activeBtn.BackgroundColor3 = PURPLE_MURASAKI
end
TabCmdBtn.MouseButton1Click:Connect(function() switchTab(CmdContainer, TabCmdBtn); TabCmdBtn.BackgroundColor3 = RED_AKA end)
TabFlyBtn.MouseButton1Click:Connect(function() switchTab(FlyContainer, TabFlyBtn); TabFlyBtn.BackgroundColor3 = RED_AKA end)
TabPlayerBtn.MouseButton1Click:Connect(function() switchTab(PlayerContainer, TabPlayerBtn) end)
TabTrollBtn.MouseButton1Click:Connect(function() switchTab(TrollContainer, TabTrollBtn) end)
TabWorldBtn.MouseButton1Click:Connect(function() switchTab(WorldContainer, TabWorldBtn) end)
local flying, speed, flyConnection = false, 50, nil
local upping, downing = false, false
local function updateSpeedDisplay() SpeedLabel.Text = "السرعة: " .. tostring(speed) end
local function startFly()
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local humanoid = character:FindFirstChildOfClass("Humanoid")
if humanoid then humanoid.PlatformStand = true end
flyConnection = RunService.Heartbeat:Connect(function(dt)
if not character or not root.Parent or not flying then return end
local flyVelocity = humanoid.MoveDirection * speed
local verticalVelocity = 0
if upping then verticalVelocity = speed elseif downing then verticalVelocity = -speed end
root.CFrame = root.CFrame + (flyVelocity * dt) + Vector3.new(0, verticalVelocity * dt, 0)
root.Velocity = Vector3.new(0,0,0)
root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(workspace.CurrentCamera.CFrame.LookVector.X, 0, workspace.CurrentCamera.CFrame.LookVector.Z))
end)
end
local function stopFly()
flying = false; upping = false; downing = false; FlyBtn.Text = "طيران"; FlyBtn.BackgroundColor3 = RED_AKA
if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false end
end
FlyBtn.MouseButton1Click:Connect(function() if flying then stopFly() else flying = true; FlyBtn.Text = "إيقاف"; FlyBtn.BackgroundColor3 = BLUE_AO; startFly() end end)
SpeedUpBtn.MouseButton1Click:Connect(function() if speed < 300 then speed = speed + 10; updateSpeedDisplay() end end)
SpeedDownBtn.MouseButton1Click:Connect(function() if speed > 10 then speed = speed - 10; updateSpeedDisplay() end end)
UpBtn.MouseButton1Down:Connect(function() upping = true end)
UpBtn.MouseButton1Up:Connect(function() upping = false end)
DownBtn.MouseButton1Down:Connect(function() downing = true end)
DownBtn.MouseButton1Up:Connect(function() downing = false end)
local airWalking, airPart, floating = false, nil, false
RunService.Heartbeat:Connect(function()
local character = LocalPlayer.Character
if airWalking and character and character:FindFirstChild("HumanoidRootPart") then
if not airPart or not airPart.Parent then
airPart = Instance.new("Part"); airPart.Size = Vector3.new(6, 0.5, 6); airPart.Anchored = true
airPart.Transparency = 0.6; airPart.Material = Enum.Material.Neon; airPart.Color = PURPLE_MURASAKI; airPart.Parent = workspace
end
airPart.CFrame = CFrame.new(character.HumanoidRootPart.Position.X, character.HumanoidRootPart.Position.Y - 3.2, character.HumanoidRootPart.Position.Z)
else if airPart then airPart:Destroy(); airPart = nil end end
if floating and character and character:FindFirstChild("HumanoidRootPart") then character.HumanoidRootPart.Velocity = Vector3.new(character.HumanoidRootPart.Velocity.X, 0, character.HumanoidRootPart.Velocity.Z) end
end)
AirWalkBtn.MouseButton1Click:Connect(function() airWalking = not airWalking; AirWalkBtn.Text = airWalking and "المشي على الهواء: مفعل" or "المشي على الهواء: مقفل"; AirWalkBtn.BackgroundColor3 = airWalking and PURPLE_MURASAKI or DARK_BG end)
FloatBtn.MouseButton1Click:Connect(function() floating = not floating; FloatBtn.Text = floating and "تثبيت الارتفاع: مفعل" or "تثبيت الارتفاع: مقفل"; FloatBtn.BackgroundColor3 = floating and BLUE_AO or DARK_BG end)
local infJumping, nocliping, godModing, spinning = false, false, false, false
UserInputService.InputBegan:Connect(function(i, gp)
if not gp and infJumping and i.KeyCode == Enum.KeyCode.Space and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end
end)
RunService.Stepped:Connect(function()
if nocliping and LocalPlayer.Character then for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
if godModing and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 100 end
if spinning and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 50, 0) end
end)
InfJumpBtn.MouseButton1Click:Connect(function() infJumping = not infJumping; InfJumpBtn.Text = infJumping and "قفز لانهائي: مفعل" or "قفز لانهائي: مقفل"; InfJumpBtn.BackgroundColor3 = infJumping and PURPLE_MURASAKI or DARK_BG end)
NoclipBtn.MouseButton1Click:Connect(function() nocliping = not nocliping; NoclipBtn.Text = nocliping and "اختراق الجدران: مفعل" or "اختراق الجدران: مقفل"; NoclipBtn.BackgroundColor3 = nocliping and PURPLE_MURASAKI or DARK_BG end)
SuperSpeedBtn.MouseButton1Click:Connect(function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 150 end end)
HighJumpBtn.MouseButton1Click:Connect(function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 180 end end)
GodBtn.MouseButton1Click:Connect(function() godModing = not godModing; GodBtn.Text = godModing and "نمط الخلود: مفعل" or "نمط الخلود: مقفل"; GodBtn.BackgroundColor3 = godModing and RED_AKA or DARK_BG end)
ResetSpeedBtn.MouseButton1Click:Connect(function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16; LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50 end end)
RespawnBtn.MouseButton1Click:Connect(function() if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end end)
SitBtn.MouseButton1Click:Connect(function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true end end)
SpinBtn.MouseButton1Click:Connect(function() spinning = not spinning; SpinBtn.Text = spinning and "الدوران: مفعل" or "الدوران: مقفل"; SpinBtn.BackgroundColor3 = spinning and BLUE_AO or DARK_BG end)
InvisibleBtn.MouseButton1Click:Connect(function() local c = LocalPlayer.Character if c and c:FindFirstChild("LowerTorso") then c.LowerTorso:Destroy() end end)
local function getTarget(n) n = n:lower() for _, p in ipairs(Players:GetPlayers()) do if p.Name:lower():sub(1,#n) == n or (p.DisplayName and p.DisplayName:lower():sub(1,#n) == n) then return p end end return nil end
local flinging, flingConn, bunging, bungConn = false, nil, false, nil
FlingBtn.MouseButton1Click:Connect(function()
if flinging then flinging = false; FlingBtn.Text = "فلنلق (قذف الضحية) 🤫"; FlingBtn.BackgroundColor3 = RED_AKA; if flingConn then flingConn:Disconnect() end
else
local t = getTarget(PlayerInput.Text)
if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
flinging = true; FlingBtn.Text = "إلغاء الفلنلق"; FlingBtn.BackgroundColor3 = BLUE_AO
flingConn = RunService.Heartbeat:Connect(function()
if not flinging or not t.Character or not t.Character:FindFirstChild("HumanoidRootPart") or not LocalPlayer.Character then flinging = false; if flingConn then flingConn:Disconnect() end return end
LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame
LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(99999,99999,99999); Loca
