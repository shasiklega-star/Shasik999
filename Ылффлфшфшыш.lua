if not game:IsLoaded() then game.Loaded:Wait() end

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ShasikCheat"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local settings = {
    theme = "dark",
    espColor = Color3.fromRGB(255, 0, 0),
    espSize = 3,
    espTransparency = 0.5,
    aimbotDistance = 100,
    speedValue = 100,
    flySpeed = 100,
    jumpPower = 150,
    silentFov = 200
}

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 500, 0, 560)
frame.Position = UDim2.new(0.5, -250, 0.5, -280)
frame.BackgroundColor3 = Color3.fromRGB(8, 8, 24)
frame.BackgroundTransparency = 0.08
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.BorderSizePixel = 0
frame.ZIndex = 5

-- Стекло
local glass = Instance.new("Frame", frame)
glass.Size = UDim2.new(1, 0, 1, 0)
glass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glass.BackgroundTransparency = 0.97
glass.BorderSizePixel = 0
glass.ZIndex = 1

-- Тень
local shadow = Instance.new("Frame", frame)
shadow.Size = UDim2.new(1.08, 0, 1.08, 0)
shadow.Position = UDim2.new(-0.04, 0, -0.04, 0)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.7
shadow.BorderSizePixel = 0
shadow.ZIndex = -1
local shadowCorner = Instance.new("UICorner", shadow)
shadowCorner.CornerRadius = UDim.new(0, 24)

-- Рамка с неоном
local border = Instance.new("UIStroke", frame)
border.Color = Color3.fromRGB(0, 200, 255)
border.Thickness = 2.5
border.Transparency = 0.2

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 20)

-- ===== ЗАГОЛОВОК =====
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 70)
header.BackgroundColor3 = Color3.fromRGB(15, 15, 45)
header.BackgroundTransparency = 0.15
header.BorderSizePixel = 0
header.ZIndex = 10

local headerGrad = Instance.new("UIGradient", header)
headerGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
})
headerGrad.Rotation = 45

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, 0, 0.7, 0)
title.Position = UDim2.new(0, 0, 0.15, 0)
title.Text = "✦ shasik_1488 ✦"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.ZIndex = 10
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = Color3.fromRGB(0, 150, 255)

local subtitle = Instance.new("TextLabel", header)
subtitle.Size = UDim2.new(1, 0, 0.3, 0)
subtitle.Position = UDim2.new(0, 0, 0.7, 0)
subtitle.Text = "PRISON RP • ULTIMATE EDITION"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 255)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.ZIndex = 10

-- ===== КАТЕГОРИИ =====
local categories = {"Главная", "Бой", "ESP", "Настройки"}
local catBtns = {}
local catFrame = Instance.new("Frame", frame)
catFrame.Size = UDim2.new(0.94, 0, 0, 40)
catFrame.Position = UDim2.new(0.03, 0, 0, 78)
catFrame.BackgroundTransparency = 1
catFrame.ZIndex = 10

for i, cat in ipairs(categories) do
    local btn = Instance.new("TextButton", catFrame)
    btn.Size = UDim2.new(0.25, -4, 1, -4)
    btn.Position = UDim2.new((i - 1) * 0.25, 2, 0.04, 0)
    btn.Text = cat
    btn.TextColor3 = i == 1 and Color3.fromRGB(0, 200, 255) or Color3.fromRGB(180, 180, 240)
    btn.BackgroundColor3 = i == 1 and Color3.fromRGB(0, 80, 200) or Color3.fromRGB(20, 20, 50)
    btn.BackgroundTransparency = i == 1 and 0.3 or 0.5
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    btn.ZIndex = 10
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 10)
    
    btn.MouseButton1Click:Connect(function()
        for j, b in pairs(catBtns) do
            b.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
            b.BackgroundTransparency = 0.5
            b.TextColor3 = Color3.fromRGB(180, 180, 240)
        end
        btn.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
        btn.BackgroundTransparency = 0.3
        btn.TextColor3 = Color3.fromRGB(0, 200, 255)
        for j, panel in ipairs(panels) do
            panel.Visible = (j == i)
        end
    end)
    catBtns[i] = btn
end

-- ===== КОНТЕНТ =====
local contentFrame = Instance.new("ScrollingFrame", frame)
contentFrame.Size = UDim2.new(1, -20, 1, -150)
contentFrame.Position = UDim2.new(0, 10, 0, 126)
contentFrame.BackgroundTransparency = 1
contentFrame.ScrollBarThickness = 5
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
contentFrame.ClipsDescendants = true
contentFrame.BorderSizePixel = 0
contentFrame.ZIndex = 10
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)

local panels = {}
for i = 1, 4 do
    local panel = Instance.new("ScrollingFrame", contentFrame)
    panel.Size = UDim2.new(1, 0, 0, 0)
    panel.BackgroundTransparency = 1
    panel.AutomaticSize = Enum.AutomaticSize.Y
    panel.CanvasSize = UDim2.new(0, 0, 0, 0)
    panel.ScrollBarThickness = 4
    panel.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
    panel.Visible = (i == 1)
    panels[i] = panel
end

-- ===== ФУНКЦИИ =====
local function createToggle(parent, text, icon, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0.96, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    local fCorner = Instance.new("UICorner", frame)
    fCorner.CornerRadius = UDim.new(0, 10)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(0.65, 0, 1, 0)
    lbl.Position = UDim2.new(0.05, 0, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = icon .. " " .. text
    lbl.TextColor3 = Color3.fromRGB(230, 230, 255)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextSize = 15
    lbl.Font = Enum.Font.GothamMedium
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 55, 0, 28)
    btn.Position = UDim2.new(0.82, 0, 0.15, 0)
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 220, 0) or Color3.fromRGB(60, 60, 90)
    btn.Text = default and "ON" or "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    local bCorner = Instance.new("UICorner", btn)
    bCorner.CornerRadius = UDim.new(0, 6)
    
    local glow = Instance.new("UIStroke", btn)
    glow.Color = default and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 90)
    glow.Thickness = 2
    glow.Transparency = default and 0.3 or 0.8
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 220, 0) or Color3.fromRGB(60, 60, 90)
        btn.Text = state and "ON" or "OFF"
        glow.Color = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 90)
        glow.Transparency = state and 0.3 or 0.8
        callback(state)
    end)
    return btn, state
end

local function createSlider(parent, text, min, max, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0.96, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    local fCorner = Instance.new("UICorner", frame)
    fCorner.CornerRadius = UDim.new(0, 10)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(0.5, 0, 0.5, 0)
    lbl.Position = UDim2.new(0.05, 0, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text .. " (" .. default .. ")"
    lbl.TextColor3 = Color3.fromRGB(230, 230, 255)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextSize = 14
    lbl.Font = Enum.Font.GothamMedium
    
    local slider = Instance.new("TextBox", frame)
    slider.Size = UDim2.new(0.2, 0, 0.5, 0)
    slider.Position = UDim2.new(0.75, 0, 0.25, 0)
    slider.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
    slider.Text = tostring(default)
    slider.TextColor3 = Color3.fromRGB(255, 255, 255)
    slider.TextSize = 14
    slider.Font = Enum.Font.GothamMedium
    slider.ClearTextOnFocus = false
    local sCorner = Instance.new("UICorner", slider)
    sCorner.CornerRadius = UDim.new(0, 4)
    
    slider:GetPropertyChangedSignal("Text"):Connect(function()
        local val = tonumber(slider.Text)
        if val then
            val = math.clamp(val, min, max)
            callback(val)
            lbl.Text = text .. " (" .. val .. ")"
        end
    end)
    return slider
end

-- ===== ПАНЕЛЬ ГЛАВНАЯ =====
local panel1 = panels[1]
local container1 = Instance.new("Frame", panel1)
container1.Size = UDim2.new(1, 0, 0, 0)
container1.BackgroundTransparency = 1
container1.AutomaticSize = Enum.AutomaticSize.Y

local layout1 = Instance.new("UIListLayout", container1)
layout1.Padding = UDim.new(0, 6)
layout1.SortOrder = Enum.SortOrder.LayoutOrder

createToggle(container1, "Спидхак", "⚡", false, function(state) end)
createSlider(container1, "Скорость", 1, 200, 100, function(val) end)
createToggle(container1, "Высокий прыжок", "🦘", false, function(state) end)
createSlider(container1, "Высота прыжка", 50, 500, 150, function(val) end)
createToggle(container1, "No Clip", "👻", false, function(state) end)
createToggle(container1, "Fly", "✈", false, function(state) end)
createSlider(container1, "Скорость Fly", 20, 300, 100, function(val) end)
createToggle(container1, "Невидимость", "🥷", false, function(state) end)
createToggle(container1, "ТП к игроку", "📌", false, function(state) end)

-- ===== ПАНЕЛЬ БОЙ =====
local panel2 = panels[2]
local container2 = Instance.new("Frame", panel2)
container2.Size = UDim2.new(1, 0, 0, 0)
container2.BackgroundTransparency = 1
container2.AutomaticSize = Enum.AutomaticSize.Y

local layout2 = Instance.new("UIListLayout", container2)
layout2.Padding = UDim.new(0, 6)
layout2.SortOrder = Enum.SortOrder.LayoutOrder

createToggle(container2, "Aimbot", "🎯", false, function(state) end)
createToggle(container2, "Silent Aim", "🎯", false, function(state) end)
createSlider(container2, "FOV", 10, 300, 200, function(val) end)

-- ===== ПАНЕЛЬ ESP =====
local panel3 = panels[3]
local container3 = Instance.new("Frame", panel3)
container3.Size = UDim2.new(1, 0, 0, 0)
container3.BackgroundTransparency = 1
container3.AutomaticSize = Enum.AutomaticSize.Y

local layout3 = Instance.new("UIListLayout", container3)
layout3.Padding = UDim.new(0, 6)
layout3.SortOrder = Enum.SortOrder.LayoutOrder

createToggle(container3, "ESP", "👁️", false, function(state) end)
createToggle(container3, "Имя игрока", "👤", false, function(state) end)
createToggle(container3, "Дистанция", "📏", false, function(state) end)

-- ===== ПАНЕЛЬ НАСТРОЙКИ =====
local panel4 = panels[4]
local container4 = Instance.new("Frame", panel4)
container4.Size = UDim2.new(1, 0, 0, 0)
container4.BackgroundTransparency = 1
container4.AutomaticSize = Enum.AutomaticSize.Y

local layout4 = Instance.new("UIListLayout", container4)
layout4.Padding = UDim.new(0, 6)
layout4.SortOrder = Enum.SortOrder.LayoutOrder

createToggle(container4, "Тёмная тема", "🌙", true, function(state) end)
createSlider(container4, "Размер ESP", 1, 10, 3, function(val) end)
createSlider(container4, "Прозрачность ESP", 0.1, 1, 0.5, function(val) end)
createSlider(container4, "Дальность Aimbot", 50, 500, 100, function(val) end)

-- ===== СНЕГОПАД ВНУТРИ МЕНЮ =====
local snowContainer = Instance.new("Frame", frame)
snowContainer.Size = UDim2.new(1, 0, 1, 0)
snowContainer.BackgroundTransparency = 1
snowContainer.ZIndex = 0
snowContainer.ClipsDescendants = false

local snowParticles = {}
for i = 1, 200 do
    local size = math.random(2, 6)
    local particle = Instance.new("Frame", snowContainer)
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    particle.BackgroundTransparency = 0.1 + math.random() * 0.3
    particle.BorderSizePixel = 0
    particle.ZIndex = 1
    local pCorner = Instance.new("UICorner", particle)
    pCorner.CornerRadius = UDim.new(1, 0)
    
    table.insert(snowParticles, {
        frame = particle,
        speed = 0.3 + math.random() * 1.2,
        drift = math.random(-20, 20) / 10,
        x = particle.Position.X.Scale,
        y = particle.Position.Y.Scale,
        size = size,
        phase = math.random() * 6.28
    })
end

game:GetService("RunService").RenderStepped:Connect(function(dt)
    local time = tick()
    for _, p in pairs(snowParticles) do
        p.y = p.y + p.speed * dt * 0.8
        p.x = p.x + math.sin(time * 0.5 + p.phase) * dt * 0.2 + p.drift * dt * 0.1
        
        if p.y > 1.05 then
            p.y = -0.05
            p.x = math.random()
            p.speed = 0.3 + math.random() * 1.2
            p.drift = math.random(-20, 20) / 10
        end
        if p.x < -0.05 then p.x = 1.05 end
        if p.x > 1.05 then p.x = -0.05 end
        
        p.frame.Position = UDim2.new(p.x, 0, p.y, 0)
        p.frame.BackgroundTransparency = 0.1 + math.sin(time * 0.8 + p.phase) * 0.1 + 0.1
        p.frame.Size = UDim2.new(0, p.size + math.sin(time * 0.3 + p.phase) * 0.3, 0, p.size + math.sin(time * 0.3 + p.phase) * 0.3)
    end
end)

-- ===== КРУГЛАЯ КНОПКА (ПЛАВНАЯ, НЕ ОТЛЕТАЕТ) =====
local iconGui = Instance.new("ScreenGui", game.CoreGui)
iconGui.Name = "ShasikIcon"
iconGui.ResetOnSpawn = false
iconGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local iconBtn = Instance.new("TextButton", iconGui)
iconBtn.Size = UDim2.new(0, 48, 0, 48)
iconBtn.Position = UDim2.new(0.85, 0, 0.06, 0)
iconBtn.Text = "😎"
iconBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
iconBtn.BackgroundColor3 = Color3.fromRGB(8, 8, 30)
iconBtn.BackgroundTransparency = 0.05
iconBtn.Font = Enum.Font.GothamBold
iconBtn.TextSize = 26
iconBtn.BorderSizePixel = 0
iconBtn.ZIndex = 999
iconBtn.Active = true
iconBtn.Draggable = false

local iconCorner = Instance.new("UICorner", iconBtn)
iconCorner.CornerRadius = UDim.new(1, 0)

local glow = Instance.new("Frame", iconBtn)
glow.Size = UDim2.new(1.2, 0, 1.2, 0)
glow.Position = UDim2.new(-0.1, 0, -0.1, 0)
glow.BackgroundColor3 = Color3.fromRGB(255, 200, 80)
glow.BackgroundTransparency = 0.88
glow.BorderSizePixel = 0
glow.ZIndex = -1
local glowCorner = Instance.new("UICorner", glow)
glowCorner.CornerRadius = UDim.new(1, 0)

local iconShadow = Instance.new("Frame", iconBtn)
iconShadow.Size = UDim2.new(1.1, 0, 1.1, 0)
iconShadow.Position = UDim2.new(-0.05, 0, -0.05, 0)
iconShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconShadow.BackgroundTransparency = 0.6
iconShadow.BorderSizePixel = 0
iconShadow.ZIndex = -2
local shadowCorner2 = Instance.new("UICorner", iconShadow)
shadowCorner2.CornerRadius = UDim.new(1, 0)

local iconBorder = Instance.new("UIStroke", iconBtn)
iconBorder.Color = Color3.fromRGB(255, 200, 80)
iconBorder.Thickness = 1.5
iconBorder.Transparency = 0.3

spawn(function()
    local t = 0
    while true do
        t = t + 0.02
        local pulse = math.sin(t * 1.5) * 0.5 + 0.5
        local scale = 1 + pulse * 0.03
        iconBtn.Size = UDim2.new(0, 48 * scale, 0, 48 * scale)
        iconBtn.TextColor3 = Color3.new(1, 0.85 + pulse * 0.1, 0.2)
        glow.BackgroundTransparency = 0.88 - pulse * 0.04
        glow.Size = UDim2.new(1.18 + pulse * 0.05, 0, 1.18 + pulse * 0.05, 0)
        iconBorder.Transparency = 0.3 - pulse * 0.08
        iconBorder.Thickness = 1.5 + pulse * 0.3
        task.wait(0.016)
    end
end)

-- ===== ПЛАВНОЕ ПЕРЕТАСКИВАНИЕ (НЕ ОТЛЕТАЕТ) =====
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
        iconBtn.Size = UDim2.new(0, 52, 0, 52)
    end
end)

iconBtn.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        if delta.Magnitude > 3 then hasMoved = true end
        local newX = iconStartPos.X + delta.X / 1920
        local newY = iconStartPos.Y + delta.Y / 1080
        newX = math.clamp(newX, 0.01, 0.98)
        newY = math.clamp(newY, 0.01, 0.98)
        iconBtn.Position = UDim2.new(newX, 0, newY, 0)
    end
end)

iconBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
        iconBtn.Size = UDim2.new(0, 48, 0, 48)
        if not hasMoved then
            frame.Visible = not frame.Visible
        end
    end
end)

print("✅ SHASIK PRISON RP ЗАГРУЖЕН")
