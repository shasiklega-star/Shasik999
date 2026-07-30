--[=[
     ██████╗ ██████╗ ██╗███████╗ ██████╗ ███╗   ██╗    ██████╗ ██████╗ 
    ██╔══██╗██╔══██╗██║██╔════╝██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗
    ██████╔╝██████╔╝██║███████╗██║   ██║██╔██╗ ██║    ██████╔╝██████╔╝
    ██╔═══╝ ██╔══██╗██║╚════██║██║   ██║██║╚██╗██║    ██╔═══╝ ██╔══██╗
    ██║     ██║  ██║██║███████║╚██████╔╝██║ ╚████║    ██║     ██║  ██║
    ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝     ╚═╝  ╚═╝
    
    PRISON RP | ULTIMATE MEGA CHEAT v99.0
    by shasik_1488
    САМЫЙ БОЛЬШОЙ И МОЩНЫЙ СКРИПТ
--]=]

-- ============================================
-- 1. ЗАГРУЗКА ВСЕХ ВОЗМОЖНЫХ СЛУЖБ
-- ============================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local CollectionService = game:GetService("CollectionService")
local GuiService = game:GetService("GuiService")
local SoundService = game:GetService("SoundService")
local PhysicsService = game:GetService("PhysicsService")
local Debris = game:GetService("Debris")
local ContextActionService = game:GetService("ContextActionService")
local PathfindingService = game:GetService("PathfindingService")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")
local StarterPack = game:GetService("StarterPack")
local Teams = game:GetService("Teams")
local BadgeService = game:GetService("BadgeService")
local ChatService = game:GetService("Chat")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local InsertService = game:GetService("InsertService")
local NetworkClient = game:GetService("NetworkClient")

-- ============================================
-- 2. ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ
-- ============================================
local globalVars = {
    -- Настройки античита
    antiBan = true,
    antiKick = true,
    antiAFK = true,
    antiReport = true,
    antiLog = true,
    antiCheck = true,
    antiTeleport = true,
    antiSpeedCheck = true,
    antiFlyCheck = true,
    antiNoclipCheck = true,
    
    -- Настройки аимбота
    aimbotEnabled = false,
    aimbotFOV = 360,
    aimbotDistance = 9999,
    aimbotPrediction = 0.15,
    aimbotSmoothness = 0.1,
    aimbotTargetPart = "Head",
    aimbotIgnoreAdmins = true,
    aimbotIgnoreTeammates = true,
    aimbotOnlyEnemies = true,
    aimbotAutoShoot = false,
    aimbotShootDelay = 0.05,
    aimbotWallCheck = false,
    aimbotSilent = true,
    aimbotVisibleCheck = false,
    aimbotMaxTargets = 1,
    aimbotPriority = "distance",
    
    -- Настройки ESP
    espEnabled = false,
    espShowName = false,
    espShowHP = false,
    espShowDistance = false,
    espShowWeapon = false,
    espShowBox = false,
    espShowLine = false,
    espShowHead = false,
    espShowTeam = false,
    espShowHealthBar = false,
    espShowArmor = false,
    espShowStatus = false,
    espColor = Color3.fromRGB(255, 255, 255),
    
    -- Настройки невидимости
    invisibleEnabled = false,
    invisibleFull = false,
    invisibleFromCameras = false,
    invisibleFromPlayers = false,
    invisibleFromNPC = false,
    invisibleFromGUI = false,
    
    -- Настройки флая
    flyEnabled = false,
    flySpeed = 50,
    flyAcceleration = 1.2,
    flyDeceleration = 0.8,
    flyMaxSpeed = 200,
    flyAutoHover = true,
    flyNoClip = false,
    flySmooth = true,
    
    -- Настройки спидхака
    speedEnabled = false,
    speedValue = 50,
    speedMax = 200,
    speedMin = 1,
    speedAcceleration = 1.5,
    speedAutoJump = false,
    
    -- Настройки ноклипа
    noclipEnabled = false,
    noclipAllParts = true,
    noclipIgnoreWalls = true,
    noclipIgnoreObjects = true,
    noclipIgnorePlayers = false,
    noclipAutoFix = true,
    
    -- Настройки телепорта
    tpEnabled = false,
    tpMenuOpen = false,
    tpTarget = nil,
    tpHistory = {},
    tpFavorites = {},
    
    -- Настройки кика
    kickEnabled = false,
    kickMenuOpen = false,
    kickTarget = nil,
    kickReason = "Вы были кикнуты администратором.",
    kickHistory = {},
    
    -- Настройки интерфейса
    theme = "dark",
    menuSize = 520,
    menuHeight = 440,
    menuAlpha = 0.03,
    menuAnimation = true,
    menuSound = true,
    menuNotifications = true,
    menuShortcuts = true,
    
    -- Подсчёт
    totalKills = 0,
    totalDeaths = 0,
    totalDamage = 0,
    totalShots = 0,
    totalHeadshots = 0,
    totalTeleports = 0,
    totalKicks = 0,
    totalFlies = 0
}

-- ============================================
-- 3. САМЫЙ МОЩНЫЙ АНТИЧИТ В МИРЕ
-- ============================================
local antiCheatSystem = {
    initialized = false,
    protectedEvents = {},
    protectedScripts = {},
    protectedRemotes = {},
    protectedFunctions = {},
    blockedNames = {
        "Kick", "Ban", "Anti", "Check", "Teleport", "Speed", "Fly", 
        "Noclip", "Wall", "Detect", "Security", "Report", "Log", 
        "Mod", "Admin", "Exploit", "Cheat", "Hack", "Script", 
        "Inject", "Load", "Execute", "Run", "Debug", "Trace",
        "Monitor", "Track", "Flag", "Alert", "Notify", "Warn"
    }
}

local function initAntiCheat()
    if antiCheatSystem.initialized then return end
    
    -- Блокировка всех удалённых событий
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local oldEvent = obj.OnClientEvent
            local oldInvoke = obj.OnClientInvoke
            local objName = obj.Name:lower()
            
            -- Проверяем имя на наличие запрещённых слов
            local blocked = false
            for _, word in pairs(antiCheatSystem.blockedNames) do
                if objName:find(word:lower()) then
                    blocked = true
                    break
                end
            end
            
            if blocked then
                if oldEvent then
                    obj.OnClientEvent = function(...)
                        local args = {...}
                        local eventName = tostring(args[1]) or ""
                        if eventName:find("Kick") or eventName:find("Ban") or eventName:find("Anti") or eventName:find("Check") or eventName:find("Teleport") or eventName:find("Speed") or eventName:find("Fly") or eventName:find("Noclip") or eventName:find("Wall") or eventName:find("Detect") or eventName:find("Security") or eventName:find("Report") or eventName:find("Log") then
                            return
                        end
                        if oldEvent then oldEvent(...) end
                    end
                end
                if oldInvoke then
                    obj.OnClientInvoke = function(...)
                        local args = {...}
                        local eventName = tostring(args[1]) or ""
                        if eventName:find("Kick") or eventName:find("Ban") or eventName:find("Anti") or eventName:find("Check") or eventName:find("Detect") or eventName:find("Report") then
                            return true
                        end
                        if oldInvoke then return oldInvoke(...) end
                    end
                end
            end
        end
    end
    
    -- Блокировка кика
    local oldKick = LocalPlayer.Kick
    LocalPlayer.Kick = function(...)
        local args = {...}
        if args[1] and tostring(args[1]):find("Anti") or tostring(args[1]):find("Speed") or tostring(args[1]):find("Fly") or tostring(args[1]):find("Teleport") or tostring(args[1]):find("Noclip") or tostring(args[1]):find("Ban") or tostring(args[1]):find("Kick") or tostring(args[1]):find("Report") then
            return
        end
        oldKick(...)
    end
    
    -- Блокировка телепорта на бан
    local oldTeleport = TeleportService.Teleport
    TeleportService.Teleport = function(...)
        local args = {...}
        if args[1] and tostring(args[1]):find("Ban") or tostring(args[1]):find("Kick") then
            return
        end
        oldTeleport(...)
    end
    
    -- Анти-АФК с имитацией движения
    RunService.RenderStepped:Connect(function()
        if not globalVars.antiAFK then return end
        local mouse = LocalPlayer:GetMouse()
        if mouse then
            mouse.Move(Vector2.new(math.random(-10, 10), math.random(-10, 10)))
        end
        task.wait(5)
    end)
    
    -- Отключение всех скриптов античита
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Script") or v:IsA("LocalScript") then
            local name = v.Name:lower()
            local blocked = false
            for _, word in pairs(antiCheatSystem.blockedNames) do
                if name:find(word:lower()) then
                    blocked = true
                    break
                end
            end
            if blocked then
                v.Disabled = true
            end
        end
        if v:IsA("RemoteEvent") and v.Name:lower():find("anti") then
            v:Destroy()
        end
    end
    
    -- Отправка фальшивых данных о скорости
    RunService.Stepped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local remote = ReplicatedStorage:FindFirstChild("SpeedCheck")
            if remote then
                remote:FireServer(16)
            end
        end
    end)
    
    antiCheatSystem.initialized = true
    print("✅ Античит инициализирован!")
end

initAntiCheat()

-- ============================================
-- 4. УНИЧТОЖЕНИЕ СТАРЫХ GUI
-- ============================================
local function destroyOldGUI()
    for _, child in ipairs(CoreGui:GetChildren()) do
        if child:IsA("ScreenGui") and (child.Name:find("PrisonRP") or child.Name:find("Snow") or child.Name:find("Shasik") or child.Name:find("Cheat") or child.Name:find("Hack") or child.Name:find("Menu")) then
            pcall(function() child:Destroy() end)
        end
    end
    for _, child in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
        if child:IsA("ScreenGui") and (child.Name:find("PrisonRP") or child.Name:find("Snow") or child.Name:find("Shasik") or child.Name:find("Cheat") or child.Name:find("Hack") or child.Name:find("Menu")) then
            pcall(function() child:Destroy() end)
        end
    end
end

destroyOldGUI()

-- ============================================
-- 5. СОЗДАНИЕ GUI
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PrisonRPCore_" .. math.random(100, 999)
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local success = pcall(function() ScreenGui.Parent = CoreGui end)
if not success or not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ============================================
-- 6. ПРЕМИУМ ТЕМЫ
-- ============================================
local Themes = {
    dark = {
        Background = Color3.fromRGB(4, 4, 12),
        TopBar = Color3.fromRGB(2, 2, 6),
        Accent = Color3.fromRGB(0, 200, 255),
        Accent2 = Color3.fromRGB(150, 50, 255),
        Accent3 = Color3.fromRGB(255, 200, 50),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(140, 145, 160),
        Button = Color3.fromRGB(14, 16, 24),
        ButtonHover = Color3.fromRGB(26, 28, 40),
        SliderBg = Color3.fromRGB(35, 38, 46),
        SliderFill = Color3.fromRGB(0, 200, 255),
        SnowColor = Color3.fromRGB(255, 255, 255),
        ToggleOff = Color3.fromRGB(60, 65, 75),
        ToggleOn = Color3.fromRGB(0, 220, 80),
        Glow = Color3.fromRGB(0, 150, 255),
        Shadow = Color3.fromRGB(0, 0, 0)
    },
    light = {
        Background = Color3.fromRGB(238, 240, 243),
        TopBar = Color3.fromRGB(218, 220, 223),
        Accent = Color3.fromRGB(0, 120, 255),
        Accent2 = Color3.fromRGB(100, 50, 200),
        Accent3 = Color3.fromRGB(200, 150, 50),
        Text = Color3.fromRGB(20, 22, 26),
        TextDark = Color3.fromRGB(80, 85, 95),
        Button = Color3.fromRGB(198, 203, 213),
        ButtonHover = Color3.fromRGB(178, 183, 193),
        SliderBg = Color3.fromRGB(170, 175, 185),
        SliderFill = Color3.fromRGB(0, 120, 255),
        SnowColor = Color3.fromRGB(200, 210, 220),
        ToggleOff = Color3.fromRGB(160, 165, 175),
        ToggleOn = Color3.fromRGB(0, 200, 70),
        Glow = Color3.fromRGB(0, 100, 200),
        Shadow = Color3.fromRGB(0, 0, 0)
    }
}

local currentTheme = "dark"
local Theme = Themes.dark

function applyTheme(themeName)
    currentTheme = themeName
    Theme = Themes[themeName]
    MainFrame.BackgroundColor3 = Theme.Background
    TopBar.BackgroundColor3 = Theme.TopBar
    Title.TextColor3 = Theme.Accent
    UIStroke.Color = Theme.Accent
    for _, child in pairs(MainFrame:GetDescendants()) do
        if child:IsA("TextLabel") and child ~= Title then
            child.TextColor3 = Theme.Text
        end
        if child:IsA("TextButton") and child.Parent ~= TabBar then
            child.BackgroundColor3 = Theme.Button
            child.TextColor3 = Theme.Text
        end
    end
    for _, btn in pairs(Tabs) do
        btn.BackgroundColor3 = Theme.Button
        btn.TextColor3 = Theme.TextDark
    end
    if Tabs["Персонаж"] then
        Tabs["Персонаж"].BackgroundColor3 = Theme.Accent
        Tabs["Персонаж"].TextColor3 = Theme.Background
    end
    for _, f in pairs(snowflakes) do
        f.object.BackgroundColor3 = Theme.SnowColor
    end
    UIStroke.Color = Theme.Accent
    UIStroke.Transparency = 0.15
    Shadow.BackgroundColor3 = Theme.Shadow
end

-- ============================================
-- 7. ГЛАВНОЕ МЕНЮ (САМОЕ БОЛЬШОЕ)
-- ============================================
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 540, 0, 460)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -230)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BackgroundTransparency = 0.02
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
MainFrame.Visible = false

-- Стекло
local Glass = Instance.new("Frame", MainFrame)
Glass.Size = UDim2.new(1, 0, 1, 0)
Glass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Glass.BackgroundTransparency = 0.97
Glass.BorderSizePixel = 0
Glass.ZIndex = 1

-- Тень
local Shadow = Instance.new("Frame", MainFrame)
Shadow.Size = UDim2.new(1.1, 0, 1.1, 0)
Shadow.Position = UDim2.new(-0.05, 0, -0.05, 0)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.8
Shadow.BorderSizePixel = 0
Shadow.ZIndex = -1
local ShadowCorner = Instance.new("UICorner", Shadow)
ShadowCorner.CornerRadius = UDim.new(0, 26)

-- Рамка
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Thickness = 2.5
UIStroke.Color = Theme.Accent
UIStroke.Transparency = 0.15

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 22)

-- Градиент
local BackgroundGrad = Instance.new("UIGradient", MainFrame)
BackgroundGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.Background),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(8, 8, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 30))
})
BackgroundGrad.Rotation = 45

-- Верхняя панель
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 60)
TopBar.BackgroundColor3 = Theme.TopBar
TopBar.BackgroundTransparency = 0.1
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 5
TopBar.Parent = MainFrame

local TopBarGrad = Instance.new("UIGradient", TopBar)
TopBarGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.Accent),
    ColorSequenceKeypoint.new(0.5, Theme.Accent2),
    ColorSequenceKeypoint.new(1, Theme.Accent)
})
TopBarGrad.Rotation = 90

local TopCorner = Instance.new("UICorner", TopBar)
TopCorner.CornerRadius = UDim.new(0, 22)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -20, 0, 30)
Title.Position = UDim2.new(0, 15, 0, 4)
Title.BackgroundTransparency = 1
Title.Text = "✦ PRISON RP ULTIMATE ✦"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 6
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Theme.Accent

local Subtitle = Instance.new("TextLabel", TopBar)
Subtitle.Size = UDim2.new(1, -20, 0, 16)
Subtitle.Position = UDim2.new(0, 15, 0, 34)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "by shasik_1488 • v99.0 • ULTIMATE MEGA EDITION"
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 210)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 11
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 6

-- Статистика
local StatsLabel = Instance.new("TextLabel", TopBar)
StatsLabel.Size = UDim2.new(0, 200, 0, 16)
StatsLabel.Position = UDim2.new(1, -210, 0, 34)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "K:0 D:0 HS:0"
StatsLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = 11
StatsLabel.TextXAlignment = Enum.TextXAlignment.Right
StatsLabel.ZIndex = 6

-- ============================================
-- 8. РЕАЛИСТИЧНЫЙ СНЕГ (ОГРОМНЫЙ)
-- ============================================
local SnowContainer = Instance.new("Frame", MainFrame)
SnowContainer.Size = UDim2.new(1, 0, 1, 0)
SnowContainer.BackgroundTransparency = 1
SnowContainer.ZIndex = 2
SnowContainer.ClipsDescendants = false
SnowContainer.Parent = MainFrame

local maxSnowflakes = 400
local snowflakes = {}

for i = 1, maxSnowflakes do
    local size = math.random(1, 8)
    local flake = Instance.new("Frame", SnowContainer)
    flake.Size = UDim2.new(0, size, 0, size)
    flake.BackgroundColor3 = Theme.SnowColor
    flake.BackgroundTransparency = math.random(1, 9) / 10
    flake.BorderSizePixel = 0
    flake.Position = UDim2.new(math.random(), 0, math.random() * -1, 0)
    flake.ZIndex = 2
    flake.Parent = SnowContainer
    
    local fCorner = Instance.new("UICorner", flake)
    fCorner.CornerRadius = UDim.new(1, 0)
    fCorner.Parent = flake

    table.insert(snowflakes, {
        object = flake,
        speedY = math.random(30, 200) / 100,
        speedX = math.random(-30, 30) / 100,
        wobbleSpeed = math.random(1, 7),
        wobbleRange = math.random(1, 7),
        size = size,
        phase = math.random() * 6.28,
        alpha = math.random(1, 9) / 10
    })
end

RunService.RenderStepped:Connect(function(deltaTime)
    local frameHeight = MainFrame.AbsoluteSize.Y
    local time = tick()
    for _, f in ipairs(snowflakes) do
        local currentPos = f.object.Position
        local newY = currentPos.Y.Offset + (f.speedY * 2.5)
        local wobble = math.sin(time * f.wobbleSpeed + f.phase) * (f.wobbleRange * 0.0006)
        local wind = math.sin(time * 0.3 + f.phase) * 0.0005
        local newX = currentPos.X.Scale + f.speedX * 0.001 + wobble + wind
        local flicker = math.sin(time * 0.9 + f.phase) * 0.1 + 0.3
        f.object.BackgroundTransparency = math.clamp(f.alpha + flicker * 0.2, 0.05, 0.95)
        if newY > frameHeight + 10 then
            newY = -10
            newX = math.random()
            f.speedY = math.random(30, 200) / 100
            f.speedX = math.random(-30, 30) / 100
        end
        if newX < -0.02 then newX = 1.02
        elseif newX > 1.02 then newX = -0.02 end
        f.object.Position = UDim2.new(newX, 0, 0, newY)
    end
end)

-- ============================================
-- 9. ВКЛАДКИ (МНОГО)
-- ============================================
local TabBar = Instance.new("Frame", MainFrame)
TabBar.Size = UDim2.new(1, -20, 0, 40)
TabBar.Position = UDim2.new(0, 10, 0, 66)
TabBar.BackgroundTransparency = 1
TabBar.ZIndex = 5
TabBar.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 6)
TabLayout.Parent = TabBar

local PagesContainer = Instance.new("ScrollingFrame", MainFrame)
PagesContainer.Size = UDim2.new(1, -20, 1, -120)
PagesContainer.Position = UDim2.new(0, 10, 0, 114)
PagesContainer.BackgroundTransparency = 1
PagesContainer.ScrollBarThickness = 4
PagesContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
PagesContainer.ClipsDescendants = true
PagesContainer.BorderSizePixel = 0
PagesContainer.ZIndex = 4
PagesContainer.ScrollBarImageColor3 = Theme.Accent
PagesContainer.Parent = MainFrame

local Pages = {}
local Tabs = {}

-- ============================================
-- 10. ОСНОВНЫЕ ФУНКЦИИ
-- ============================================
local function getChar()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getRoot()
    local char = getChar()
    return char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = getChar()
    return char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")
end

local function getHead()
    local char = getChar()
    return char:FindFirstChild("Head") or char:WaitForChild("Head")
end

local function getWeapon()
    local char = getChar()
    if char then
        return char:FindFirstChildOfClass("Tool")
    end
    return nil
end

-- ============================================
-- 11. СОЗДАНИЕ ТУМБЛЕРА (МОЩНЫЙ)
-- ============================================
local function createToggle(parent, text, icon, toggleCallback)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -4, 0, 46)
    container.BackgroundColor3 = Theme.Button
    container.BackgroundTransparency = 0.08
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
    container.ZIndex = 4
    container.Parent = parent

    local containerCorner = Instance.new("UICorner", container)
    containerCorner.CornerRadius = UDim.new(0, 10)
    containerCorner.Parent = container

    local topPart = Instance.new("Frame", container)
    topPart.Size = UDim2.new(1, 0, 0, 46)
    topPart.BackgroundTransparency = 1
    topPart.ZIndex = 4
    topPart.Parent = container

    local label = Instance.new("TextLabel", topPart)
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = icon .. " " .. text
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 5
    label.Parent = topPart

    local toggleBtn = Instance.new("TextButton", topPart)
    toggleBtn.Size = UDim2.new(0, 60, 0, 30)
    toggleBtn.Position = UDim2.new(0.82, 0, 0.16, 0)
    toggleBtn.BackgroundColor3 = Theme.ToggleOff
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = "[❍⊃]"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 18
    toggleBtn.ZIndex = 5
    toggleBtn.Parent = topPart
    local toggleCorner = Instance.new("UICorner", toggleBtn)
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleBtn

    local toggleGlow = Instance.new("UIStroke", toggleBtn)
    toggleGlow.Color = Theme.ToggleOff
    toggleGlow.Thickness = 2
    toggleGlow.Transparency = 0.5

    local state = false
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        local targetColor = state and Theme.ToggleOn or Theme.ToggleOff
        TweenService:Create(toggleBtn, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            BackgroundColor3 = targetColor
        }):Play()
        toggleBtn.Text = state and "[⊂❍]" or "[❍⊃]"
        toggleGlow.Color = state and Theme.ToggleOn or Theme.ToggleOff
        toggleCallback(state)
    end)
    return toggleBtn
end

-- ============================================
-- 12. СОЗДАНИЕ КНОПКИ
-- ============================================
local function createButton(parent, text, icon, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -4, 0, 40)
    btn.BackgroundColor3 = Theme.Button
    btn.BackgroundTransparency = 0.08
    btn.BorderSizePixel = 0
    btn.Text = icon .. " " .. text
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.ZIndex = 4
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    local btnGlow = Instance.new("UIStroke", btn)
    btnGlow.Color = Theme.Accent
    btnGlow.Thickness = 1.5
    btnGlow.Transparency = 0.3
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Theme.ButtonHover
        }):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Theme.Button
        }):Play()
        callback()
    end)
    return btn
end

-- ============================================
-- 13. ПОЛЗУНОК (С ПЕРЕТАСКИВАНИЕМ)
-- ============================================
local function createSlider(parent, text, min, max, default, callback)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, -4, 0, 54)
    f.BackgroundColor3 = Theme.Button
    f.BackgroundTransparency = 0.08
    f.BorderSizePixel = 0
    f.ClipsDescendants = true
    f.ZIndex = 4
    f.Parent = parent

    local fCorner = Instance.new("UICorner", f)
    fCorner.CornerRadius = UDim.new(0, 10)
    fCorner.Parent = f

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(0.4, 0, 0.5, 0)
    lbl.Position = UDim2.new(0.05, 0, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text .. " (" .. default .. ")"
    lbl.TextColor3 = Theme.Text
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.ZIndex = 5
    lbl.Parent = f

    local sliderBg = Instance.new("Frame", f)
    sliderBg.Size = UDim2.new(0.6, 0, 0.3, 0)
    sliderBg.Position = UDim2.new(0.35, 0, 0.35, 0)
    sliderBg.BackgroundColor3 = Theme.SliderBg
    sliderBg.BorderSizePixel = 0
    sliderBg.ZIndex = 5
    sliderBg.Parent = f
    local sCorner = Instance.new("UICorner", sliderBg)
    sCorner.CornerRadius = UDim.new(1, 0)
    sCorner.Parent = sliderBg

    local sliderFill = Instance.new("Frame", sliderBg)
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Theme.SliderFill
    sliderFill.BorderSizePixel = 0
    sliderFill.ZIndex = 6
    sliderFill.Parent = sliderBg
    local fCorner2 = Instance.new("UICorner", sliderFill)
    fCorner2.CornerRadius = UDim.new(1, 0)
    fCorner2.Parent = sliderFill

    local isDragging = false
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            local pos = input.Position.X - sliderBg.AbsolutePosition.X
            local value = math.clamp(pos / sliderBg.AbsoluteSize.X, 0, 1)
            local val = math.floor(value * (max - min) + min)
            sliderFill.Size = UDim2.new(value, 0, 1, 0)
            lbl.Text = text .. " (" .. val .. ")"
            callback(val)
        end
    end)

    sliderBg.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local pos = input.Position.X - sliderBg.AbsolutePosition.X
            local value = math.clamp(pos / sliderBg.AbsoluteSize.X, 0, 1)
            local val = math.floor(value * (max - min) + min)
            sliderFill.Size = UDim2.new(value, 0, 1, 0)
            lbl.Text = text .. " (" .. val .. ")"
            callback(val)
        end
    end)

    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)

    return sliderBg
end

-- ============================================
-- 14. СОЗДАНИЕ ВКЛАДОК (МНОГО)
-- ============================================
local function CreatePage(name, order)
    local Page = Instance.new("ScrollingFrame", PagesContainer)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.ScrollBarThickness = 4
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.Visible = false
    Page.ZIndex = 4
    Page.Parent = PagesContainer

    local PageList = Instance.new("UIListLayout", Page)
    PageList.Padding = UDim.new(0, 8)
    PageList.SortOrder = Enum.SortOrder.LayoutOrder
    PageList.Parent = Page
    
    PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 10)
    end)

    local TabButton = Instance.new("TextButton", TabBar)
    TabButton.Size = UDim2.new(0, 88, 1, 0)
    TabButton.BackgroundColor3 = Theme.Button
    TabButton.BackgroundTransparency = 0.15
    TabButton.BorderSizePixel = 0
    TabButton.Text = name
    TabButton.TextColor3 = Theme.TextDark
    TabButton.Font = Enum.Font.GothamBold
    TabButton.TextSize = 11
    TabButton.LayoutOrder = order
    TabButton.ZIndex = 5
    TabButton.Parent = TabBar

    local TCorner = Instance.new("UICorner", TabButton)
    TCorner.CornerRadius = UDim.new(0, 8)
    TCorner.Parent = TabButton

    Pages[name] = Page
    Tabs[name] = TabButton

    TabButton.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, t in pairs(Tabs) do 
            TweenService:Create(t, TweenInfo.new(0.15), {BackgroundColor3 = Theme.Button, TextColor3 = Theme.TextDark}):Play()
        end
        Page.Visible = true
        TweenService:Create(TabButton, TweenInfo.new(0.15), {BackgroundColor3 = Theme.Accent, TextColor3 = Theme.Background}):Play()
    end)
end

CreatePage("Персонаж", 1)
CreatePage("Бой", 2)
CreatePage("ЕСП", 3)
CreatePage("Настройки", 4)
CreatePage("Статистика", 5)

-- ============================================
-- 15. ПЕРСОНАЖ (ВСЕ ФУНКЦИИ)
-- ============================================
local page = Pages["Персонаж"]

-- NoClip (Мощный)
local noclipConnection = nil
local noclipState = false
createToggle(page, "NoClip (Супер)", "👻", function(state)
    noclipState = state
    if state then
        if noclipConnection then noclipConnection:Disconnect() end
        noclipConnection = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                        part.CanTouch = false
                        part.CanQuery = false
                    end
                end
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CanCollide = false
                    root.CanTouch = false
                    root.CanQuery = false
                end
            end
        end)
    else
        if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                    part.CanTouch = true
                    part.CanQuery = true
                end
            end
        end
    end
end)

-- Speedhack (Мощный)
local speedValue = 50
local speedState = false
createToggle(page, "Speedhack (Мега)", "⚡", function(state)
    speedState = state
    local humanoid = getHumanoid()
    if state then
        humanoid.WalkSpeed = speedValue
    else
        humanoid.WalkSpeed = 16
    end
end)
createSlider(page, "Скорость", 1, 300, 50, function(val)
    speedValue = val
    if speedState then
        local humanoid = getHumanoid()
        humanoid.WalkSpeed = val
    end
end)

-- Fly (Мощный)
local flyState = false
local flySpeed = 50
local flyBodyVelocity = nil
local flyBodyGyro = nil
local flyConnection = nil
local flyKeys = {w = false, a = false, s = false, d = false, space = false, shift = false}

createToggle(page, "Fly (Ультра)", "✈", function(state)
    flyState = state
    local root = getRoot()
    local humanoid = getHumanoid()
    if state then
        humanoid.PlatformStand = true
        flyBodyVelocity = Instance.new("BodyVelocity", root)
        flyBodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyGyro = Instance.new("BodyGyro", root)
        flyBodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        flyBodyGyro.P = 1e6
        flyBodyGyro.CFrame = root.CFrame
        flyConnection = RunService.Heartbeat:Connect(function()
            if not flyState then return end
            local cam = Workspace.CurrentCamera
            local forward = cam.CFrame.LookVector
            local right = cam.CFrame.RightVector
            local up = cam.CFrame.UpVector
            local move = Vector3.new(0, 0, 0)
            if flyKeys.w then move = move + forward end
            if flyKeys.s then move = move - forward end
            if flyKeys.a then move = move - right end
            if flyKeys.d then move = move + right end
            if flyKeys.space then move = move + up end
            if flyKeys.shift then move = move - up end
            if move.Magnitude > 0 then
                flyBodyVelocity.Velocity = move.Unit * flySpeed
            else
                flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
            if flyBodyGyro then flyBodyGyro.CFrame = getRoot().CFrame end
        end)
    else
        humanoid.PlatformStand = false
        if flyBodyVelocity then flyBodyVelocity:Destroy(); flyBodyVelocity = nil end
        if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end
        if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
    end
end)
createSlider(page, "Скорость Fly", 1, 300, 50, function(val)
    flySpeed = val
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if not flyState or gp then return end
    if input.KeyCode == Enum.KeyCode.W then flyKeys.w = true end
    if input.KeyCode == Enum.KeyCode.A then flyKeys.a = true end
    if input.KeyCode == Enum.KeyCode.S then flyKeys.s = true end
    if input.KeyCode == Enum.KeyCode.D then flyKeys.d = true end
    if input.KeyCode == Enum.KeyCode.Space then flyKeys.space = true end
    if input.KeyCode == Enum.KeyCode.LeftShift then flyKeys.shift = true end
end)

UserInputService.InputEnded:Connect(function(input, gp)
    if not flyState then return end
    if input.KeyCode == Enum.KeyCode.W then flyKeys.w = false end
    if input.KeyCode == Enum.KeyCode.A then flyKeys.a = false end
    if input.KeyCode == Enum.KeyCode.S then flyKeys.s = false end
    if input.KeyCode == Enum.KeyCode.D then flyKeys.d = false end
    if input.KeyCode == Enum.KeyCode.Space then flyKeys.space = false end
    if input.KeyCode == Enum.KeyCode.LeftShift then flyKeys.shift = false end
end)

-- Невидимость (Мощная)
local invisibleState = false
createToggle(page, "Невидимость (Тотальная)", "🥷", function(state)
    invisibleState = state
    local char = getChar()
    if state then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.Material = Enum.Material.ForceField
                part.CanCollide = false
            end
        end
        local root = getRoot()
        if root then
            root.LocalTransparencyModifier = 1
        end
        local head = getHead()
        if head then
            head.Transparency = 1
        end
        -- Скрываем имя
        local displayName = char:FindFirstChild("DisplayName")
        if displayName then
            displayName.Text = ""
        end
    else
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
                part.Material = Enum.Material.Plastic
                part.CanCollide = true
            end
        end
        local root = getRoot()
        if root then
            root.LocalTransparencyModifier = 0
        end
        local head = getHead()
        if head then
            head.Transparency = 0
        end
        local displayName = char:FindFirstChild("DisplayName")
        if displayName then
            displayName.Text = LocalPlayer.Name
        end
    end
end)

-- ============================================
-- 16. КИК ИГРОКА (С МЕНЮ)
-- ============================================
local function kickPlayer(player)
    if not player then return end
    pcall(function()
        player:Kick("Вы были кикнуты администратором.")
        local kickRemote = ReplicatedStorage:FindFirstChild("KickPlayer") 
            or ReplicatedStorage:FindFirstChild("KickEvent") 
            or ReplicatedStorage:FindFirstChild("AdminKick")
        if kickRemote then
            kickRemote:FireServer(player)
        end
        globalVars.totalKicks = globalVars.totalKicks + 1
        game.StarterGui:SetCore("SendNotification", {
            Title = "✦ PRISON RP ✦",
            Text = "✅ Игрок " .. player.Name .. " кикнут!",
            Duration = 2
        })
    end)
end

local function createKickUI()
    local kickGui = Instance.new("ScreenGui", ScreenGui.Parent)
    kickGui.Name = "KickMenu"
    kickGui.ResetOnSpawn = false
    kickGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local kickFrame = Instance.new("Frame", kickGui)
    kickFrame.Size = UDim2.new(0, 340, 0, 400)
    kickFrame.Position = UDim2.new(0.5, -170, 0.2, 0)
    kickFrame.BackgroundColor3 = Theme.Background
    kickFrame.BackgroundTransparency = 0.05
    kickFrame.BorderSizePixel = 2
    kickFrame.BorderColor3 = Theme.Accent
    kickFrame.ClipsDescendants = true
    kickFrame.Active = true
    kickFrame.Draggable = true
    kickFrame.ZIndex = 20
    Instance.new("UICorner", kickFrame).CornerRadius = UDim.new(0, 14)
    
    local kickTitle = Instance.new("TextLabel", kickFrame)
    kickTitle.Size = UDim2.new(1, 0, 0, 45)
    kickTitle.Text = "👢 КИК ИГРОКА"
    kickTitle.TextColor3 = Theme.Accent
    kickTitle.BackgroundTransparency = 1
    kickTitle.Font = Enum.Font.GothamBold
    kickTitle.TextSize = 16
    kickTitle.ZIndex = 21
    
    local kickClose = Instance.new("TextButton", kickFrame)
    kickClose.Size = UDim2.new(0, 35, 0, 35)
    kickClose.Position = UDim2.new(1, -42, 0, 5)
    kickClose.Text = "✕"
    kickClose.TextColor3 = Color3.fromRGB(255, 0, 0)
    kickClose.BackgroundColor3 = Color3.fromRGB(30, 10, 10)
    kickClose.BackgroundTransparency = 0.1
    kickClose.Font = Enum.Font.GothamBold
    kickClose.TextSize = 22
    kickClose.ZIndex = 22
    Instance.new("UICorner", kickClose).CornerRadius = UDim.new(1, 0)
    kickClose.MouseButton1Click:Connect(function()
        kickGui:Destroy()
    end)
    
    local kickScroll = Instance.new("ScrollingFrame", kickFrame)
    kickScroll.Size = UDim2.new(1, -20, 1, -60)
    kickScroll.Position = UDim2.new(0, 10, 0, 50)
    kickScroll.BackgroundTransparency = 1
    kickScroll.ScrollBarThickness = 4
    kickScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    kickScroll.ClipsDescendants = true
    kickScroll.BorderSizePixel = 0
    kickScroll.ZIndex = 21
    kickScroll.ScrollBarImageColor3 = Theme.Accent
    
    local kickLayout = Instance.new("UIListLayout", kickScroll)
    kickLayout.Padding = UDim.new(0, 6)
    kickLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local btn = Instance.new("TextButton", kickScroll)
            btn.Size = UDim2.new(1, 0, 0, 40)
            btn.Text = "👤 " .. plr.Name .. " (ID: " .. plr.UserId .. ")"
            btn.TextColor3 = Theme.Text
            btn.BackgroundColor3 = Theme.Button
            btn.BackgroundTransparency = 0.2
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 14
            btn.ZIndex = 22
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
            btn.MouseButton1Click:Connect(function()
                kickPlayer(plr)
                kickGui:Destroy()
            end)
        end
    end
    kickScroll.CanvasSize = UDim2.new(0, 0, 0, #kickScroll:GetChildren() * 48)
end

createButton(page, "Кик игрока (Админ)", "👢", function()
    createKickUI()
end)

-- ============================================
-- 17. БОЙ (САМЫЙ МОЩНЫЙ AIMBOT)
-- ============================================
local brawlPage = Pages["Бой"]
local aimbotEnabled = false
local targetHead = nil
local targetPosition = nil
local targetPlayer = nil
local aimbotConnection = nil

createToggle(brawlPage, "Aimbot (Хардкор)", "🎯", function(state)
    aimbotEnabled = state
end)

-- Функция поиска ближайшего врага (с упреждением)
local function getClosestEnemy()
    local closest = nil
    local closestDist = 999
    local cam = Workspace.CurrentCamera
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local origin = cam.CFrame.Position

    for _, plr in pairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        if plr.Team == LocalPlayer.Team then continue end
        local char = plr.Character
        if not char then continue end
        local head = char:FindFirstChild("Head")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not head or not hum or hum.Health <= 0 then continue end
        
        -- Упреждение (прогнозирование движения)
        local targetPos = head.Position + head.Velocity * 0.15
        local pos, onScreen = cam:WorldToViewportPoint(targetPos)
        if onScreen then
            local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
            if dist < closestDist then
                closestDist = dist
                closest = plr
                targetHead = head
                targetPosition = targetPos
                targetPlayer = plr
            end
        end
    end
    return closest
end

-- Основной цикл аимбота (с плавным наведением)
RunService.RenderStepped:Connect(function()
    if not aimbotEnabled then return end
    local target = getClosestEnemy()
    if target and targetHead then
        local cam = Workspace.CurrentCamera
        local currentPos = cam.CFrame.Position
        local targetPos = targetHead.Position
        -- Плавное наведение с коэффициентом сглаживания
        local smoothFactor = 0.15
        local newPos = currentPos:Lerp(targetPos, smoothFactor)
        cam.CFrame = CFrame.new(currentPos, newPos)
    end
end)

-- Перехват всех выстрелов (Silent Aim)
local function hookAllShoots()
    for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
            local name = remote.Name:lower()
            if name:find("shoot") or name:find("fire") or name:find("taser") or name:find("gun") or name:find("weapon") or name:find("stun") or name:find("electro") or name:find("remote") then
                local oldFire = remote.FireServer
                remote.FireServer = function(...)
                    local args = {...}
                    if aimbotEnabled and targetPosition then
                        if #args >= 1 then
                            args[1] = targetPosition
                        end
                    end
                    if oldFire then
                        oldFire(unpack(args))
                    end
                end
            end
        end
    end
end
hookAllShoots()

-- Фиксация при прыжке
UserInputService.InputBegan:Connect(function(input)
    if not aimbotEnabled then return end
    if input.KeyCode == Enum.KeyCode.Space then
        task.wait(0.05)
        local target = getClosestEnemy()
        if target and targetHead then
            local cam = Workspace.CurrentCamera
            cam.CFrame = CFrame.new(cam.CFrame.Position, targetHead.Position)
        end
    end
end)

-- ============================================
-- 18. ESP (ПОЛНАЯ ВЕРСИЯ)
-- ============================================
local espPage = Pages["ЕСП"]
local espEnabled = false
local espShowHP = false
local espShowName = false
local espShowDistance = false
local espShowWeapon = false
local espShowBox = false
local espShowLine = false
local espShowHead = false
local espObjects = {}
local espConnections = {}

local function getWeaponName(plr)
    local char = plr.Character
    if not char then return "🚫 Нет оружия" end
    for _, item in pairs(char:GetChildren()) do
        if item:IsA("Tool") then
            local name = item.Name:lower()
            if name:find("screwdriver") then return "🔧 Отвёртка"
            elseif name:find("wrench") then return "🔩 Ключ"
            elseif name:find("hammer") then return "🔨 Молоток"
            elseif name:find("knife") then return "🔪 Нож"
            elseif name:find("pistol") then return "🔫 Пистолет"
            elseif name:find("shotgun") then return "🔫 Дробовик"
            elseif name:find("rifle") or name:find("ar") or name:find("ak") then return "🔫 Автомат"
            elseif name:find("taser") or name:find("stun") then return "⚡ Тайзер"
            elseif name:find("bat") or name:find("stick") or name:find("club") then return "🏏 Дубинка"
            else return "🔧 " .. item.Name
            end
        end
    end
    return "👊 Кулаки"
end

local function createESP(plr)
    if espObjects[plr] then return end
    local char = plr.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local gui = Instance.new("BillboardGui")
    gui.Adornee = root
    gui.Size = UDim2.new(0, 220, 0, 120)
    gui.StudsOffset = Vector3.new(0, 3.5, 0)
    gui.AlwaysOnTop = true
    gui.ZIndex = 10
    gui.Parent = char
    
    local nameLabel = Instance.new("TextLabel", gui)
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = plr.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.ZIndex = 11
    nameLabel.Visible = espShowName
    
    local hpFrame = Instance.new("Frame", gui)
    hpFrame.Size = UDim2.new(0.6, 0, 0, 4)
    hpFrame.Position = UDim2.new(0.2, 0, 0, 22)
    hpFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    hpFrame.BorderSizePixel = 0
    hpFrame.ZIndex = 11
    hpFrame.Visible = espShowHP
    
    local hpFill = Instance.new("Frame", hpFrame)
    hpFill.Size = UDim2.new(1, 0, 1, 0)
    hpFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    hpFill.BorderSizePixel = 0
    hpFill.ZIndex = 12
    
    local weaponLabel = Instance.new("TextLabel", gui)
    weaponLabel.Size = UDim2.new(1, 0, 0, 18)
    weaponLabel.Position = UDim2.new(0, 0, 0, 30)
    weaponLabel.BackgroundTransparency = 1
    weaponLabel.Text = "👊 Кулаки"
    weaponLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    weaponLabel.Font = Enum.Font.Gotham
    weaponLabel.TextSize = 12
    weaponLabel.TextStrokeTransparency = 0
    weaponLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    weaponLabel.ZIndex = 11
    weaponLabel.Visible = espShowWeapon
    
    local distLabel = Instance.new("TextLabel", gui)
    distLabel.Size = UDim2.new(1, 0, 0, 18)
    distLabel.Position = UDim2.new(0, 0, 0, 50)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0 м"
    distLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextSize = 12
    distLabel.TextStrokeTransparency = 0
    distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distLabel.ZIndex = 11
    distLabel.Visible = espShowDistance
    
    local boxFrame = Instance.new("Frame", gui)
    boxFrame.Size = UDim2.new(0.8, 0, 0.6, 0)
    boxFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
    boxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    boxFrame.BackgroundTransparency = 0.8
    boxFrame.BorderSizePixel = 2
    boxFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    boxFrame.ZIndex = 10
    boxFrame.Visible = espShowBox
    Instance.new("UICorner", boxFrame).CornerRadius = UDim.new(0, 4)
    
    local lineFrame = Instance.new("Frame", gui)
    lineFrame.Size = UDim2.new(0.01, 0, 0.8, 0)
    lineFrame.Position = UDim2.new(0.5, 0, 0.1, 0)
    lineFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lineFrame.BackgroundTransparency = 0.5
    lineFrame.ZIndex = 10
    lineFrame.Visible = espShowLine
    
    local headDot = Instance.new("Frame", gui)
    headDot.Size = UDim2.new(0, 6, 0, 6)
    headDot.Position = UDim2.new(0.5, -3, 0, 0)
    headDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    headDot.BorderSizePixel = 0
    headDot.ZIndex = 12
    headDot.Visible = espShowHead
    Instance.new("UICorner", headDot).CornerRadius = UDim.new(1, 0)
    
    espObjects[plr] = {
        gui = gui,
        nameLabel = nameLabel,
        hpFrame = hpFrame,
        hpFill = hpFill,
        weaponLabel = weaponLabel,
        distLabel = distLabel,
        boxFrame = boxFrame,
        lineFrame = lineFrame,
        headDot = headDot,
        root = root
    }
    
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not espEnabled or not plr.Character then
            if gui then gui.Enabled = false end
            return
        end
        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            local health = hum.Health
            local maxHealth = hum.MaxHealth
            local percent = math.clamp(health / maxHealth, 0, 1)
            hpFill.Size = UDim2.new(percent, 0, 1, 0)
            hpFill.BackgroundColor3 = Color3.fromRGB(255 * (1 - percent), 255 * percent, 0)
            hpFrame.Visible = espShowHP
        end
        weaponLabel.Text = getWeaponName(plr)
        weaponLabel.Visible = espShowWeapon
        local dist = (getRoot().Position - root.Position).Magnitude
        distLabel.Text = math.floor(dist) .. " м"
        distLabel.Visible = espShowDistance
        nameLabel.Visible = espShowName
        boxFrame.Visible = espShowBox
        lineFrame.Visible = espShowLine
        headDot.Visible = espShowHead
        gui.Enabled = true
    end)
    espConnections[plr] = conn
end

createToggle(espPage, "ESP (Супер)", "👁️", function(state)
    espEnabled = state
    if state then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                createESP(plr)
            end
        end
        espConnections.PlayerAdded = Players.PlayerAdded:Connect(function(plr)
            if plr ~= LocalPlayer then
                plr.CharacterAdded:Connect(function()
                    task.wait(0.5)
                    if espEnabled then createESP(plr) end
                end)
            end
        end)
    else
        for _, obj in pairs(espObjects) do
            if obj.gui then obj.gui:Destroy() end
        end
        espObjects = {}
        for _, conn in pairs(espConnections) do
            if conn then conn:Disconnect() end
        end
        espConnections = {}
    end
end)

createToggle(espPage, "HP игроков", "❤️", function(state)
    espShowHP = state
    for _, obj in pairs(espObjects) do
        if obj.hpFrame then
            obj.hpFrame.Visible = state
        end
    end
end)

createToggle(espPage, "Имя игрока", "👤", function(state)
    espShowName = state
    for _, obj in pairs(espObjects) do
        if obj.nameLabel then
            obj.nameLabel.Visible = state
        end
    end
end)

createToggle(espPage, "Дистанция", "📏", function(state)
    espShowDistance = state
    for _, obj in pairs(espObjects) do
        if obj.distLabel then
            obj.distLabel.Visible = state
        end
    end
end)

createToggle(espPage, "Оружие", "🔫", function(state)
    espShowWeapon = state
    for _, obj in pairs(espObjects) do
        if obj.weaponLabel then
            obj.weaponLabel.Visible = state
        end
    end
end)

createToggle(espPage, "Box ESP", "📦", function(state)
    espShowBox = state
    for _, obj in pairs(espObjects) do
        if obj.boxFrame then
            obj.boxFrame.Visible = state
        end
    end
end)

createToggle(espPage, "Линия к игроку", "📏", function(state)
    espShowLine = state
    for _, obj in pairs(espObjects) do
        if obj.lineFrame then
            obj.lineFrame.Visible = state
        end
    end
end)

createToggle(espPage, "Точка на голове", "🎯", function(state)
    espShowHead = state
    for _, obj in pairs(espObjects) do
        if obj.headDot then
            obj.headDot.Visible = state
        end
    end
end)

-- ============================================
-- 19. НАСТРОЙКИ
-- ============================================
local settingsPage = Pages["Настройки"]

createToggle(settingsPage, "Светлая тема", "🌙", function(state)
    applyTheme(state and "light" or "dark")
end)

createToggle(settingsPage, "Анти-АФК", "🛡️", function(state)
    globalVars.antiAFK = state
end)

createToggle(settingsPage, "Анти-Кик", "🛡️", function(state)
    globalVars.antiKick = state
end)

createToggle(settingsPage, "Анти-Бан", "🛡️", function(state)
    globalVars.antiBan = state
end)

createButton(settingsPage, "Сбросить все функции", "⛔", function()
    pcall(function()
        ScreenGui:Destroy()
        for _, conn in pairs(espConnections) do
            if conn then conn:Disconnect() end
        end
        if noclipConnection then noclipConnection:Disconnect() end
        if flyConnection then flyConnection:Disconnect() end
        for _, obj in pairs(espObjects) do
            if obj.gui then obj.gui:Destroy() end
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "✦ PRISON RP ✦",
            Text = "🛑 Все функции сброшены",
            Duration = 2
        })
    end)
end)

createButton(settingsPage, "Перезагрузить скрипт", "🔄", function()
    pcall(function()
        ScreenGui:Destroy()
        for _, conn in pairs(espConnections) do
            if conn then conn:Disconnect() end
        end
        if noclipConnection then noclipConnection:Disconnect() end
        if flyConnection then flyConnection:Disconnect() end
        for _, obj in pairs(espObjects) do
            if obj.gui then obj.gui:Destroy() end
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "✦ PRISON RP ✦",
            Text = "🔄 Перезагрузка...",
            Duration = 2
        })
        task.wait(0.5)
        loadstring(game:HttpGet("https://pastebin.com/raw/your_script_link_here"))()
    end)
end)

-- ============================================
-- 20. СТАТИСТИКА
-- ============================================
local statsPage = Pages["Статистика"]

local statsLabels = {}
local statsData = {
    {"Всего киков", 0},
    {"Всего телепортов", 0},
    {"Всего полётов", 0},
    {"Всего убийств", 0},
    {"Всего выстрелов", 0},
    {"Хедшотов", 0},
    {"Урона нанесено", 0}
}

for i, data in ipairs(statsData) do
    local lbl = Instance.new("TextLabel", statsPage)
    lbl.Size = UDim2.new(1, -4, 0, 30)
    lbl.Position = UDim2.new(0, 2, 0, (i-1) * 35 + 10)
    lbl.BackgroundTransparency = 1
    lbl.Text = data[1] .. ": " .. data[2]
    lbl.TextColor3 = Theme.Text
    lbl.TextSize = 14
    lbl.Font = Enum.Font.GothamMedium
    lbl.ZIndex = 4
    lbl.Parent = statsPage
    statsLabels[data[1]] = lbl
end

-- Обновление статистики
RunService.Heartbeat:Connect(function()
    if statsLabels["Всего киков"] then
        statsLabels["Всего киков"].Text = "Всего киков: " .. globalVars.totalKicks
    end
    if statsLabels["Всего телепортов"] then
        statsLabels["Всего телепортов"].Text = "Всего телепортов: " .. globalVars.totalTeleports
    end
    if statsLabels["Всего полётов"] then
        statsLabels["Всего полётов"].Text = "Всего полётов: " .. globalVars.totalFlies
    end
end)

-- ============================================
-- 21. АКТИВАЦИЯ МЕНЮ
-- ============================================
for _, p in pairs(Pages) do p.Visible = false end
Pages["Персонаж"].Visible = true
for _, t in pairs(Tabs) do 
    TweenService:Create(t, TweenInfo.new(0.15), {BackgroundColor3 = Theme.Button, TextColor3 = Theme.TextDark}):Play()
end
Tabs["Персонаж"].BackgroundColor3 = Theme.Accent
Tabs["Персонаж"].TextColor3 = Theme.Background

MainFrame.Visible = true
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

task.spawn(function()
    local targetSize = UDim2.new(0, 540, 0, 460)
    local targetPos = UDim2.new(0.5, -270, 0.5, -230)
    for i = 1, 45 do
        local t = i / 45
        local ease = t * t * (3 - 2 * t)
        MainFrame.Size = UDim2.new(0, 540 * ease, 0, 460 * ease)
        MainFrame.Position = UDim2.new(0.5, -270 * ease, 0.5, -230 * ease)
        MainFrame.BackgroundTransparency = 0.02 * (1 - ease)
        task.wait(0.012)
    end
    MainFrame.Size = targetSize
    MainFrame.Position = targetPos
    MainFrame.BackgroundTransparency = 0.02
end)

-- ============================================
-- 22. ПРЕМИУМ ИКОНКА
-- ============================================
local iconGui = Instance.new("ScreenGui", ScreenGui.Parent)
iconGui.Name = "PrisonIcon"
iconGui.ResetOnSpawn = false

local iconBtn = Instance.new("TextButton", iconGui)
iconBtn.Size = UDim2.new(0, 48, 0, 48)
iconBtn.Position = UDim2.new(0.85, 0, 0.05, 0)
iconBtn.Text = "⚡"
iconBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
iconBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
iconBtn.BackgroundTransparency = 0.05
iconBtn.Font = Enum.Font.GothamBold
iconBtn.TextSize = 26
iconBtn.BorderSizePixel = 0
iconBtn.ZIndex = 999
iconBtn.Active = true
iconBtn.Draggable = false

local iconCorner = Instance.new("UICorner", iconBtn)
iconCorner.CornerRadius = UDim.new(1, 0)

local iconStroke = Instance.new("UIStroke", iconBtn)
iconStroke.Color = Theme.Accent
iconStroke.Thickness = 1.5
iconStroke.Transparency = 0.3

local iconGlow = Instance.new("Frame", iconBtn)
iconGlow.Size = UDim2.new(1.2, 0, 1.2, 0)
iconGlow.Position = UDim2.new(-0.1, 0, -0.1, 0)
iconGlow.BackgroundColor3 = Theme.Accent
iconGlow.BackgroundTransparency = 0.88
iconGlow.BorderSizePixel = 0
iconGlow.ZIndex = -1
local glowCorner = Instance.new("UICorner", iconGlow)
glowCorner.CornerRadius = UDim.new(1, 0)

task.spawn(function()
    while true do
        local t = tick() * 1.5
        local pulse = math.sin(t) * 0.5 + 0.5
        iconBtn.Size = UDim2.new(0, 48 + pulse * 1.5, 0, 48 + pulse * 1.5)
        iconBtn.TextColor3 = Color3.new(0.8 + pulse * 0.15, 0.8 + pulse * 0.1, 0.9)
        iconGlow.BackgroundTransparency = 0.88 - pulse * 0.05
        iconStroke.Transparency = 0.3 - pulse * 0.08
        task.wait(0.02)
    end
end)

local isDragging = false
local dragStart = nil
local iconStartPos = nil
local hasMoved = false

iconBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        hasMoved = false
        dragStart = input.Position
        iconStartPos = Vector2.new(iconBtn.Position.X.Scale, iconBtn.Position.Y.Scale)
    end
end)

iconBtn.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        if delta.Magnitude > 3 then hasMoved = true end
        local viewport = Workspace.CurrentCamera.ViewportSize
        local newX = math.clamp(iconStartPos.X + delta.X / viewport.X, 0.01, 0.98)
        local newY = math.clamp(iconStartPos.Y + delta.Y / viewport.Y, 0.01, 0.98)
        iconBtn.Position = UDim2.new(newX, 0, newY, 0)
    end
end)

iconBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
        if not hasMoved then
            MainFrame.Visible = not MainFrame.Visible
        end
        hasMoved = false
    end
end)

-- ============================================
-- 23. ЗАЩИТА ОТ ВЫЛЕТОВ
-- ============================================
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flyState then
        local root = getRoot()
        local humanoid = getHumanoid()
        if root and humanoid then
            humanoid.PlatformStand = true
            flyBodyVelocity = Instance.new("BodyVelocity", root)
            flyBodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            flyBodyGyro = Instance.new("BodyGyro", root)
            flyBodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
            flyBodyGyro.P = 1e6
            flyBodyGyro.CFrame = root.CFrame
        end
    end
    if noclipState then
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    part.CanTouch = false
                    part.CanQuery = false
                end
            end
        end
    end
end)

-- ============================================
-- 24. ФИНАЛЬНОЕ СООБЩЕНИЕ
-- ============================================
print("✅ PRISON RP | ULTIMATE MEGA CHEAT v99.0 ЗАГРУЖЕН!")
print("✅ Античит обойдён!")
print("✅ Все функции активны!")
print("✅ Премиум-дизайн включён!")
print("✅ Скрипт полностью готов к работе!")

-- ============================================
-- КОНЕЦ СКРИПТА
-- ============================================
