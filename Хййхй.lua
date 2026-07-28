task.wait(0.3)

local TweenService = game:Service("TweenService")
local Players = game:Service("Players")
local RunService = game:Service("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("Space_Premium_Menu") then
    PlayerGui.Space_Premium_Menu:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Space_Premium_Menu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- ==========================================
-- КРУГЛАЯ КНОПКА-ПЛАНЕТА С НЕОНОВОЙ АТМОСФЕРОЙ
-- ==========================================
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 65, 0, 65)
ToggleButton.Position = UDim2.new(0, 25, 0.5, -32)
ToggleButton.BackgroundColor3 = Color3.fromRGB(10, 12, 22)
ToggleButton.Text = "🪐" -- Символ планеты для стиля
ToggleButton.TextColor3 = Color3.fromRGB(150, 200, 255)
ToggleButton.TextSize = 28
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ScreenGui

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = ToggleButton

-- Эффект свечения атмосферы планеты-кнопки
local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(0, 150, 255)
ButtonStroke.Thickness = 2.5
ButtonStroke.Transparency = 0.3
ButtonStroke.Parent = ToggleButton

-- Плавное пульсирование атмосферы кнопки (60 FPS)
RunService.Heartbeat:Connect(function()
    if ToggleButton and ToggleButton.Parent then
        local pulse = 0.3 + math.sin(os.clock() * 3) * 0.2
        ButtonStroke.Transparency = pulse
    end
end)

-- Перетаскивание кнопки (Drag)
local dragging, dragInput, dragStart, startPos
ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position
    end
end)
ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
game:Service("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
game:Service("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ==========================================
-- УЛЬТРАРЕАЛИСТИЧНОЕ ГЛАВНОЕ МЕНЮ
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 300)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 9, 15)
MainFrame.BackgroundTransparency = 1
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 16)
FrameCorner.Parent = MainFrame

-- Хромированная неоновая обводка меню
local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(0, 120, 255)
FrameStroke.Thickness = 1.5
FrameStroke.Transparency = 1
FrameStroke.Parent = MainFrame

-- Заголовок в стиле Sci-Fi
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "COSMIC PREMIUM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextTransparency = 1
Title.ZIndex = 4
Title.Parent = MainFrame

-- Контейнер для 3D Космоса и Снега
local SpaceViewport = Instance.new("ViewportFrame")
SpaceViewport.Size = UDim2.new(1, 0, 1, 0)
SpaceViewport.BackgroundTransparency = 1
SpaceViewport.ZIndex = 2
SpaceViewport.Parent = MainFrame

-- ==========================================
-- ГЕНЕРАЦИЯ 3D ПЛАНЕТЫ (Полностью автономно)
-- ==========================================
local cam = Instance.new("Camera")
cam.FieldOfView = 60
SpaceViewport.CurrentCamera = cam
cam.Parent = SpaceViewport

-- Создаем космос внутри меню
local worldModel = Instance.new("WorldModel")
worldModel.Parent = SpaceViewport
cam.CFrame = CFrame.new(0, 0, 8)

-- Тело планеты
local Planet = Instance.new("Part")
Planet.Shape = Enum.PartType.Ball
Planet.Size = Vector3.new(3, 3, 3)
Planet.Color = Color3.fromRGB(20, 40, 70)
Planet.Material = Enum.Material.Neon -- Дает футуристичное ультра-свечение
Planet.Anchored = true
Planet.Parent = worldModel

-- Кольца планеты
local Rings = Instance.new("Part")
Rings.Shape = Enum.PartType.Cylinder
Rings.Size = Vector3.new(0.05, 5, 5)
Rings.Color = Color3.fromRGB(0, 150, 255)
Rings.Material = Enum.Material.Glass
Rings.Transparency = 0.4
Rings.Orientation = Vector3.new(20, 0, 70)
Rings.Anchored = true
Rings.Parent = worldModel

-- Вращение 3D сцены планеты в реальном времени
RunService.Heartbeat:Connect(function(dt)
    if MainFrame.Visible then
        Planet.CFrame = Planet.CFrame * CFrame.Angles(0, dt * 0.3, 0)
        Rings.CFrame = Planet.CFrame * CFrame.Angles(math.rad(25), os.clock() * 0.1, math.rad(65))
    end
end)

-- ==========================================
-- СНЕЖНЫЙ ШЛЕЙФ (Падающие звезды/Снег в космосе)
-- ==========================================
local SnowContainer = Instance.new("Frame")
SnowContainer.Size = UDim2.new(1, 0, 1, 0)
SnowContainer.BackgroundTransparency = 1
SnowContainer.ZIndex = 3
SnowContainer.Parent = MainFrame

local maxSnowflakes = 40
local snowflakes = {}

local function createSnowflake()
    if not MainFrame.Visible then return end
    local flake = Instance.new("Frame")
    flake.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    flake.BackgroundTransparency = math.random(2, 6) / 10
    local size = math.random(2, 4)
    flake.Size = UDim2.new(0, size, 0, size)
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(1, 0)
    c.Parent = flake
    
    flake.Position = UDim2.new(math.random(), 0, -0.05, 0)
    flake.ZIndex = 3
    flake.Parent = SnowContainer
    
    table.insert(snowflakes, {
        object = flake,
        speedY = math.random(50, 90) / 100,
        speedX = math.random(-8, 8) / 100,
        swingSpeed = math.random(2, 4),
        swingIntensity = math.random(4, 8) / 100,
        timeAlive = 0
    })
end

RunService.Heartbeat:Connect(function(deltaTime)
    if not MainFrame.Visible then return end
    if #snowflakes < maxSnowflakes and math.random() > 0.82 then
        createSnowflake()
    end
    for i = #snowflakes, 1, -1 do
        local data = snowflakes[i]
        if data and data.object and data.object.Parent then
            data.timeAlive = data.timeAlive + deltaTime
            local currentX = data.object.Position.X.Scale
            local currentY = data.object.Position.Y.Scale
            local windEffect = math.sin(data.timeAlive * data.swingSpeed) * data.swingIntensity * deltaTime
            local newX = currentX + (data.speedX * deltaTime) + windEffect
            local newY = currentY + (data.speedY * deltaTime)
            if newY > 1.05 or newX < -0.05 or newX > 1.05 then
                data.object:Destroy()
                table.remove(snowflakes, i)
            else
                data.object.Position = UDim2.new(newX, 0, newY, 0)
            end
        else
            table.remove(snowflakes, i)
        end
    end
end)

-- ==========================================
-- УЛЬТРАПЛАВНАЯ АНИМАЦИЯ ОТКРЫТИЯ/ЗАКРЫТИЯ
-- ==========================================
local menuOpen = false
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function toggleMenu()
    menuOpen = not menuOpen
    
    if menuOpen then
        MainFrame.Visible = true
        TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(FrameStroke, tweenInfo, {Transparency = 0}):Play()
        TweenService:Create(Title, tweenInfo, {TextTransparency = 0}):Play()
        
        -- Эффект выплывания из правого бока круглой кнопки
        MainFrame.Size = UDim2.new(0, 350, 0, 200)
        MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
        
        TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 480, 0, 300),
            Position = UDim2.new(0.5, -240, 0.5, -150)
        }):Play()
        
        TweenService:Create(ToggleButton, tweenInfo, {Size = UDim2.new(0, 72, 0, 72), Rotation = 360}):Play()
    else
        local closeTween = TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 350, 0, 200),
            Position = UDim2.new(0.5, -175, 0.5, -100),
            BackgroundTransparency = 1
        })
        TweenService:Create(FrameStroke, tweenInfo, {Transparency = 1}):Play()
        TweenService:Create(Title, tweenInfo, {TextTransparency = 1}):Play()
        TweenService:Create(ToggleButton, tweenInfo, {Size = UDim2.new(0, 65, 0, 65), Rotation = 0}):Play()
        
        closeTween:Play()
        closeTween.Completed:Connect(function()
            if not menuOpen then
                MainFrame.Visible = false
                SnowContainer:ClearAllChildren()
                snowflakes = {}
            end
        end)
    end
end

ToggleButton.MouseButton1Click:Connect(toggleMenu)
print("[good]: Ультрареалистичное космическое меню успешно создано.")
