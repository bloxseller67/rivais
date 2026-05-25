-- BLOX SELLER v11 | AIMBOT MOUSE FIX
local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local plr = Players.LocalPlayer
local Cam = workspace.CurrentCamera
local pg = plr:WaitForChild("PlayerGui")
local VU = game:GetService("VirtualUser")

pcall(function() pg.BloxSeller:Destroy() end)
pcall(function() game.CoreGui.BloxESP:Destroy() end)

local gui = Instance.new("ScreenGui", pg)
gui.Name = "BloxSeller"
gui.ResetOnSpawn = false

local load = Instance.new("Frame", gui)
load.Size = UDim2.new(0, 280, 0, 80)
load.Position = UDim2.new(0.5, -140, 0.5, -40)
load.BackgroundColor3 = Color3.fromRGB(12,5,20)
Instance.new("UICorner", load).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", load).Color = Color3.fromRGB(157,0,255)
local lt = Instance.new("TextLabel", load)
lt.Size = UDim2.new(1,0,1,0); lt.Text = "BLOX SELLER v11 LOADING..."; lt.Font = Enum.Font.GothamBold
lt.TextSize = 20; lt.TextColor3 = Color3.fromRGB(157,0,255); lt.BackgroundTransparency = 1
task.wait(5); load:Destroy()

local C = {Aim=false, Team=true, FOV=true, ESP=false, Size=120, Names=false, ShowDist=true, NoReload=false, NoRecoil=false, AntiAFK=false}

local fov = Instance.new("Frame", gui)
fov.AnchorPoint = Vector2.new(0.5,0.5); fov.Position = UDim2.new(0.5,0,0.5,0)
fov.Size = UDim2.new(0, C.Size*2, 0, C.Size*2); fov.BackgroundTransparency = 1
local fs = Instance.new("UIStroke", fov); fs.Color = Color3.fromRGB(157,0,255); fs.Thickness = 2.5
Instance.new("UICorner", fov).CornerRadius = UDim.new(1,0)

local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,42,0,42); openBtn.Position = UDim2.new(0,12,0,12)
openBtn.Text = "≡"; openBtn.Font = Enum.Font.GothamBold; openBtn.TextSize = 22
openBtn.BackgroundColor3 = Color3.fromRGB(15,5,25); openBtn.TextColor3 = Color3.fromRGB(157,0,255)
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", openBtn).Color = Color3.fromRGB(157,0,255)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,320,0,300); main.Position = UDim2.new(0.5,-160,0.5,-150)
main.BackgroundColor3 = Color3.fromRGB(12,5,20); main.Active = true; main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", main).Color = Color3.fromRGB(157,0,255)

local top = Instance.new("TextLabel", main)
top.Size = UDim2.new(1,0,0,30); top.Text = " BLOX SELLER v11"
top.Font = Enum.Font.GothamBold; top.TextSize = 14; top.TextColor3 = Color3.fromRGB(157,0,255)
top.BackgroundColor3 = Color3.fromRGB(20,5,35); top.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", top).CornerRadius = UDim.new(0,10)

local tabs = {"AIM","VISUAL","MISC"}
local pages = {}
local tabFrame = Instance.new("Frame", main)
tabFrame.Position = UDim2.new(0,0,0,30); tabFrame.Size = UDim2.new(1,0,0,26); tabFrame.BackgroundTransparency = 1

for i,name in ipairs(tabs) do
    local tb = Instance.new("TextButton", tabFrame)
    tb.Size = UDim2.new(0.33,0,1,0); tb.Position = UDim2.new((i-1)*0.33,0,0,0)
    tb.Text = name; tb.Font = Enum.Font.GothamBold; tb.TextSize = 12
    tb.BackgroundColor3 = Color3.fromRGB(25,10,40); tb.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0,6)
    local page = Instance.new("Frame", main)
    page.Position = UDim2.new(0,10,0,62); page.Size = UDim2.new(1,-20,1,-72)
    page.BackgroundTransparency = 1; page.Visible = i==1
    pages[name] = page
    tb.MouseButton1Click:Connect(function() for n,p in pairs(pages) do p.Visible = (n==name) end end)
end

local function addToggle(parent, text, key, y)
    local b = Instance.new("TextButton", parent)
    b.Position = UDim2.new(0,0,0,y); b.Size = UDim2.new(1,0,0,26)
    b.BackgroundColor3 = Color3.fromRGB(25,10,40); b.Text = ""; b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    local d = Instance.new("Frame", b); d.Size = UDim2.new(0,14,0,14); d.Position = UDim2.new(0,8,0,6)
    d.BackgroundColor3 = C[key] and Color3.fromRGB(157,0,255) or Color3.fromRGB(70,70,70)
    Instance.new("UICorner", d).CornerRadius = UDim.new(0,4)
    local l = Instance.new("TextLabel", b); l.Position = UDim2.new(0,30,0,0); l.Size = UDim2.new(1,-35,1,0)
    l.Text = text; l.Font = Enum.Font.Gotham; l.TextSize = 13; l.TextColor3 = Color3.new(1,1,1); l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
    b.MouseButton1Click:Connect(function() C[key]=not C[key]; d.BackgroundColor3=C[key] and Color3.fromRGB(157,0,255) or Color3.fromRGB(70,70,70) end)
    return y+32
end

local y = 0
y = addToggle(pages.AIM, "Aimbot Headlock", "Aim", y)
y = addToggle(pages.AIM, "Team Check", "Team", y)

y=0; y=addToggle(pages.VISUAL,"FOV Circle","FOV",y); y=addToggle(pages.VISUAL,"ESP Highlight","ESP",y); y=addToggle(pages.VISUAL,"Nome + Vida","Names",y); y=addToggle(pages.VISUAL,"Mostrar Distância","ShowDist",y)

y=0; y=addToggle(pages.MISC,"No Reload","NoReload",y); y=addToggle(pages.MISC,"No Recoil","NoRecoil",y); y=addToggle(pages.MISC,"Anti AFK","AntiAFK",y)

openBtn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
UIS.InputBegan:Connect(function(i,g) if not g and i.KeyCode==Enum.KeyCode.RightShift then main.Visible=not main.Visible end end)

local espFolder = Instance.new("Folder", game.CoreGui); espFolder.Name="BloxESP"

plr.Idled:Connect(function()
    if C.AntiAFK then VU:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); task.wait(1); VU:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end
end)

task.spawn(function()
    while true do
        if C.NoReload and plr.Character then
            local tool = plr.Character:FindFirstChildOfClass("Tool")
            if tool then
                for _,v in pairs(tool:GetDescendants()) do
                    if v:IsA("IntValue") and v.Name == "Ammo" then
                        local max = tool:FindFirstChild("MaxAmmo")
                        if max then v.Value = max.Value end
                    end
                end
            end
        end
        task.wait(0.05)
    end
end)

RS.RenderStepped:Connect(function()
    fov.Size=UDim2.new(0,C.Size*2,0,C.Size*2); fov.Visible=C.FOV

    -- AIMBOT COM MOUSE
    if C.Aim then
        local center = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)
        local best, bestPos, dist = nil, nil, C.Size
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=plr and p.Character and p.Character:FindFirstChild("Head") then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 and (not C.Team or p.Team ~= plr.Team) then
                    local head = p.Character.Head
                    local pos, on = Cam:WorldToViewportPoint(head.Position)
                    if on then
                        local mag = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if mag < dist then best = head; bestPos = Vector2.new(pos.X, pos.Y); dist = mag end
                    end
                end
            end
        end
        if best and bestPos then
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, best.Position)
            local mousePos = UIS:GetMouseLocation()
            local delta = bestPos - mousePos
            VIM:SendMouseMoveEvent(delta.X, delta.Y, game, 0)
        end
    end

    for _,p in ipairs(Players:GetPlayers()) do
        if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local show = hum and hum.Health>0 and (not C.Team or p.Team~=plr.Team)

            local h = espFolder:FindFirstChild(p.Name) or Instance.new("Highlight", espFolder)
            h.Name=p.Name; h.Adornee=p.Character; h.FillColor=Color3.fromRGB(157,0,255); h.FillTransparency=0.5; h.OutlineTransparency=1
            h.Enabled = C.ESP and show

            local bill = p.Character:FindFirstChild("BloxNameTag")
            if C.Names and show then
                if not bill then
                    bill = Instance.new("BillboardGui")
                    bill.Name = "BloxNameTag"; bill.Adornee = hrp; bill.Size = UDim2.new(0,140,0,50)
                    bill.StudsOffset = Vector3.new(0,3,0); bill.AlwaysOnTop = true; bill.Parent = p.Character
                    local txt = Instance.new("TextLabel", bill); txt.Name = "Txt"; txt.Size = UDim2.new(1,0,1,0)
                    txt.BackgroundTransparency = 1; txt.Font = Enum.Font.GothamBold; txt.TextSize = 14
                    txt.TextStrokeTransparency = 0.3; txt.TextColor3 = Color3.fromRGB(157,0,255)
                end
                bill.Enabled = true
                local dist = math.floor((Cam.CFrame.Position - hrp.Position).Magnitude)
                local text = p.Name.."\n"..math.floor(hum.Health).." HP"
                if C.ShowDist then text = text.." | "..dist.."m" end
                bill.Txt.Text = text
            elseif bill then bill.Enabled = false end
        end
    end
end)
