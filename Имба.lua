-- [[ ИДЕАЛЬНЫЙ GUI ДЛЯ DELTA EXECUTOR ]] --
-- Версия: 1.0 | Дата: 26.09.2025 | Команда goodlooking

local function StartGUI()
    -- Защита от ошибок
    local success, err = pcall(function()
        -- Задержка для стабильности Delta
        task.wait(0.5)

        -- Подключаем сервисы
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local TweenService = game:GetService("TweenService")
        local UserInputService = game:GetService("UserInputService")
        local CoreGui = game:GetService("CoreGui")

        -- Проверка, что мы в игре
        if not Players.LocalPlayer then return end

        -- Создаём ScreenGui
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "GoodMenuGUI"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Parent = CoreGui

        -- ---------------------------------------------------------
        -- 1. КРУГЛАЯ КНОПКА С ПУЛЬСИРУЮЩЕЙ НЕОНОВОЙ ОБВОДКОЙ
        -- ---------------------------------------------------------
        local ToggleButton = Instance.new("ImageButton")
        ToggleButton.Name = "ToggleButton"
        ToggleButton.Size = UDim2.new(0, 60, 0, 60)
        ToggleButton.Position = UDim2.new(0, 20, 0, 100) -- левый верхний угол
        ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        ToggleButton.BackgroundTransparency = 0.15
        ToggleButton.Image = "rbxassetid://13126587622" -- прозрачная заглушка, чтоб был круг
        ToggleButton.ImageTransparency = 1
        ToggleButton.AutoButtonColor = false
        ToggleButton.Parent = ScreenGui

        -- Делаем круг через UICorner
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(1, 0)
        Corner.Parent = ToggleButton

        -- Текстовый значок планеты (эмуляция ImageButton без картинок)
        local IconLabel = Instance.new("TextLabel")
        IconLabel.Size = UDim2.new(1, 0, 1, 0)
        IconLabel.BackgroundTransparency = 1
        IconLabel.Text = "🪐"
        IconLabel.TextSize = 32
        IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        IconLabel.Font = Enum.Font.SourceSansBold
        IconLabel.TextScaled = false
        IconLabel.Parent = ToggleButton

        -- Неоновая обводка (UIStroke) с пульсацией
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Color3.fromRGB(0, 180, 255)
        Stroke.Thickness = 3
        Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        Stroke.Parent = ToggleButton

        -- Пульсация обводки (TweenService)
        local pulseInfo = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 0)
        local pulseTween = TweenService:Create(Stroke, pulseInfo, {
            Thickness = 5,
            Transparency = 0.2
        })
        pulseTween:Play()

        -- Вторая пульсация для изменения цвета (переливы)
        local colorInfo = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 0)
        local colorTween = TweenService:Create(Stroke, colorInfo, {
            Color = Color3.fromRGB(255, 100, 200)
        })
        colorTween:Play()

        -- ---------------------------------------------------------
        -- ПЕРЕТАСКИВАНИЕ КНОПКИ (пальцем)
        -- ---------------------------------------------------------
        local dragging = false
        local dragInput, dragStart, startPos

        ToggleButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = ToggleButton.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        ToggleButton.InputChanged:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) and dragging then
                local delta = input.Position - dragStart
                ToggleButton.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)

        -- ---------------------------------------------------------
        -- 2. ГЛАВНОЕ МЕНЮ (ВЫРАСТАЕТ ИЗ ЦЕНТРА)
        -- ---------------------------------------------------------
        local MainMenu = Instance.new("Frame")
        MainMenu.Name = "MainMenu"
        MainMenu.Size = UDim2.new(0, 0, 0, 0) -- начинаем с нуля
        MainMenu.Position = UDim2.new(0.5, 0, 0.5, 0) -- центр экрана
        MainMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
        MainMenu.BackgroundTransparency = 0.2
        MainMenu.ClipsDescendants = true
        MainMenu.Visible = false
        MainMenu.Parent = ScreenGui

        -- Скругление для меню
        local MenuCorner = Instance.new("UICorner")
        MenuCorner.CornerRadius = UDim.new(0, 20)
        MenuCorner.Parent = MainMenu

        -- Лёгкий фон (стекло)
        local GlassBg = Instance.new("Frame")
        GlassBg.Size = UDim2.new(1, 0, 1, 0)
        GlassBg.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        GlassBg.BackgroundTransparency = 0.5
        GlassBg.Parent = MainMenu

        -- ---------------------------------------------------------
        -- 3. VIEWPORTFRAME С 3D-ПЛАНЕТОЙ И КОЛЬЦАМИ
        -- ---------------------------------------------------------
        local Viewport = Instance.new("ViewportFrame")
        Viewport.Size = UDim2.new(0.9, 0, 0.6, 0)
        Viewport.Position = UDim2.new(0.05, 0, 0.05, 0)
        Viewport.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Viewport.BackgroundTransparency = 0.2
        Viewport.Parent = MainMenu

        -- Создаём 3D-сцену
        local World = Instance.new("Folder")
        World.Name = "World"
        World.Parent = Viewport

        -- Камера
        local Camera = Instance.new("Camera")
        Camera.CFrame = CFrame.new(0, 0, 10)
        Viewport.CurrentCamera = Camera

        -- Планета (сфера с неоновым свечением)
        local Planet = Instance.new("Part")
        Planet.Size = Vector3.new(3, 3, 3)
        Planet.Shape = Enum.PartType.Ball
        Planet.Material = Enum.Material.Neon
        Planet.Color = Color3.fromRGB(0, 120, 255)
        Planet.Transparency = 0.3
        Planet.Anchored = true
        Planet.CanCollide = false
        Planet.Parent = World

        -- Детали планеты (текстура из мелких сфер)
        for i = 1, 30 do
            local detail = Instance.new("Part")
            detail.Size = Vector3.new(0.2, 0.2, 0.2)
            detail.Shape = Enum.PartType.Ball
            detail.Material = Enum.Material.Neon
            detail.Color = Color3.fromRGB(100, 200, 255)
            detail.Transparency = 0.6
            detail.Anchored = true
            detail.CanCollide = false
            local theta = math.random() * math.pi * 2
            local phi = math.acos(2 * math.random() - 1)
            local r = 1.6 + math.random() * 0.3
            detail.Position = Vector3.new(
                r * math.sin(phi) * math.cos(theta),
                r * math.sin(phi) * math.sin(theta),
                r * math.cos(phi)
            )
            detail.Parent = World
        end

        -- Кольца (стеклянные цилиндры)
        for ring = 1, 3 do
            local Ring = Instance.new("Part")
            Ring.Size = Vector3.new(4.5 + ring * 0.5, 0.05, 4.5 + ring * 0.5)
            Ring.Shape = Enum.PartType.Cylinder
            Ring.Material = Enum.Material.Glass
            Ring.Color = Color3.fromRGB(150, 200, 255)
            Ring.Transparency = 0.4 + ring * 0.1
            Ring.Anchored = true
            Ring.CanCollide = false
            Ring.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(70 + ring * 5), 0, 0)
            Ring.Parent = World
        end

        -- Второе кольцо (наклонное)
        local Ring2 = Instance.new("Part")
        Ring2.Size = Vector3.new(5.5, 0.05, 5.5)
        Ring2.Shape = Enum.PartType.Cylinder
        Ring2.Material = Enum.Material.Glass
        Ring2.Color = Color3.fromRGB(255, 150, 200)
        Ring2.Transparency = 0.6
        Ring2.Anchored = true
        Ring2.CanCollide = false
        Ring2.CFrame = CFrame.new(0, 0.2, 0) * CFrame.Angles(math.rad(40), math.rad(20), 0)
        Ring2.Parent = World

        -- Вращение планеты (Heartbeat для производительности)
        RunService.Heartbeat:Connect(function()
            Planet.CFrame = Planet.CFrame * CFrame.Angles(0, 0.01, 0)
            -- Вращаем кольца вместе с планетой для реалистичности
            for _, child in pairs(World:GetChildren()) do
                if child:IsA("Part") and child ~= Planet then
                    child.CFrame = child.CFrame * CFrame.Angles(0, 0.005, 0)
                end
            end
        end)

        -- ---------------------------------------------------------
        -- 4. ПАДАЮЩИЙ СНЕГ (с разным размером, прозрачностью и покачиванием)
        -- ---------------------------------------------------------
        local SnowContainer = Instance.new("Folder")
        SnowContainer.Name = "Snow"
        SnowContainer.Parent = MainMenu

        -- Создаём 80 снежинок (оптимально для мобил)
        for i = 1, 80 do
            local snow = Instance.new("TextLabel")
            snow.Size = UDim2.new(0, 0, 0, 0)
            snow.BackgroundTransparency = 1
            snow.Text = "❄"
            snow.TextSize = math.random(12, 28)
            snow.TextColor3 = Color3.fromRGB(220, 240, 255)
            snow.TextTransparency = 0.2 + math.random() * 0.5
            snow.Font = Enum.Font.SourceSansBold
            snow.Position = UDim2.new(math.random() * 0.9 + 0.05, 0, math.random() * 0.9 + 0.05, 0)
            snow.Parent = SnowContainer

            -- Храним индивидуальные параметры
            local data = {
                speed = 0.3 + math.random() * 0.8,
                drift = math.random() * 2 - 1, -- направление ветра
                wobble = math.random() * 0.02,
                startX = snow.Position.X.Scale,
                startY = snow.Position.Y.Scale
            }
            snow:SetAttribute("Data", data)
        end

        -- Анимация снега (Heartbeat)
        local function UpdateSnow()
            for _, snow in pairs(SnowContainer:GetChildren()) do
                if snow:IsA("TextLabel") then
                    local data = snow:GetAttribute("Data")
                    if data then
                        local newY = snow.Position.Y.Scale + data.speed * 0.002
                        local wobbleX = math.sin(tick() * data.wobble) * 0.002
                        local newX = snow.Position.X.Scale + (data.drift * 0.001) + wobbleX

                        if newY > 1 then
                            newY = -0.05
                            newX = math.random() * 0.9 + 0.05
                            data.startX = newX
                            data.startY = newY
                            snow:SetAttribute("Data", data)
                        end
                        snow.Position = UDim2.new(newX, 0, newY, 0)
                    end
                end
            end
        end

        RunService.Heartbeat:Connect(UpdateSnow)

        -- ---------------------------------------------------------
        -- ОТКРЫТИЕ/ЗАКРЫТИЕ МЕНЮ С АНИМАЦИЕЙ
        -- ---------------------------------------------------------
        local menuOpen = false
        local tweenOpen, tweenClose

        ToggleButton.MouseButton1Click:Connect(function()
            menuOpen = not menuOpen
            MainMenu.Visible = true

            if menuOpen then
                -- Открываем (вырастаем из центра)
                if tweenClose then tweenClose:Cancel() end
                MainMenu.Size = UDim2.new(0, 0, 0, 0)
                MainMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
                local openInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                tweenOpen = TweenService:Create(MainMenu, openInfo, {
                    Size = UDim2.new(0, 350, 0, 450),
                    Position = UDim2.new(0.5, -175, 0.5, -225)
                })
                tweenOpen:Play()
            else
                -- Закрываем (схлопываем в центр)
                if tweenOpen then tweenOpen:Cancel() end
                local closeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                tweenClose = TweenService:Create(MainMenu, closeInfo, {
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
                tweenClose:Play()
                tweenClose.Completed:Connect(function()
                    MainMenu.Visible = false
                end)
            end
        end)

        -- ---------------------------------------------------------
        -- ЗАЩИТА ОТ ВЫЛЕТОВ (удаляем гуи при ресете)
        -- ---------------------------------------------------------
        Players.LocalPlayer.CharacterAdded:Connect(function()
            ScreenGui:Destroy()
        end)

        print("[good]: GUI успешно загружен! Наслаждайся, братан!")
    end)

    if not success then
        warn("[good]: Ошибка при запуске: " .. tostring(err))
        -- Повторная попытка через секунду
        task.wait(1)
        StartGUI()
    end
end

-- СТАРТУЕМ
StartGUI()
