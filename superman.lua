-- ===== СУПЕРМЕН v24 FINAL =====
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local C=game:GetService("CoreGui")
local VIM=game:GetService("VirtualInputManager")
local SG=game:GetService("SoundService")
local LP=P.LocalPlayer
local Cam=workspace.CurrentCamera
local MODE=nil
local music=nil
local musicOn=false
local musicID="rbxassetid://95678241702836"

local function cr(p,r) local c=Instance.new("UICorner",p);c.CornerRadius=UDim.new(0,r or 8) end
local function mkB(parent,txt,cb,col)
    local b=Instance.new("TextButton",parent)
    b.Size=UDim2.new(1,-8,0,40)
    b.BackgroundColor3=col or Color3.fromRGB(180,40,40)
    b.Text=txt;b.TextColor3=Color3.fromRGB(255,255,255)
    b.Font=Enum.Font.GothamBold;b.TextSize=14
    cr(b,8)
    b.MouseButton1Click:Connect(cb)
    return b
end
local function mkSec(parent,txt)
    local l=Instance.new("TextLabel",parent)
    l.Size=UDim2.new(1,-8,0,20)
    l.BackgroundTransparency=1
    l.Text="▸ "..txt
    l.TextColor3=Color3.fromRGB(255,80,80)
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.Font=Enum.Font.GothamBold;l.TextSize=12
end

-- ПАНЕЛЬ МУЗЫКИ
local musGui=Instance.new("ScreenGui",C)
musGui.ResetOnSpawn=false;musGui.IgnoreGuiInset=true
local musPanel=Instance.new("Frame",musGui)
musPanel.Size=UDim2.new(0,260,0,320)
musPanel.Position=UDim2.new(1,-280,0.5,-160)
musPanel.BackgroundColor3=Color3.fromRGB(25,10,10)
musPanel.BorderSizePixel=0;musPanel.Active=true
cr(musPanel,14)
local musS=Instance.new("UIStroke",musPanel)
musS.Color=Color3.fromRGB(255,50,50);musS.Thickness=2

local musHead=Instance.new("Frame",musPanel)
musHead.Size=UDim2.new(1,0,0,40)
musHead.BackgroundColor3=Color3.fromRGB(60,15,15)
musHead.BorderSizePixel=0;cr(musHead,14)

local musTitle=Instance.new("TextLabel",musHead)
musTitle.Size=UDim2.new(1,-40,1,0)
musTitle.BackgroundTransparency=1
musTitle.Text="🎵 МУЗЫКА"
musTitle.TextColor3=Color3.fromRGB(255,90,90)
musTitle.Font=Enum.Font.GothamBold;musTitle.TextScaled=true

local musHide=Instance.new("TextButton",musHead)
musHide.Size=UDim2.new(0,30,0,30)
musHide.Position=UDim2.new(1,-35,0,5)
musHide.BackgroundColor3=Color3.fromRGB(200,40,40)
musHide.Text="▲";musHide.TextColor3=Color3.fromRGB(255,255,255)
musHide.Font=Enum.Font.GothamBold;musHide.TextSize=14
cr(musHide,6)

local musBody=Instance.new("Frame",musPanel)
musBody.Size=UDim2.new(1,-16,1,-52)
musBody.Position=UDim2.new(0,8,0,46)
musBody.BackgroundTransparency=1

local mLabel=Instance.new("TextLabel",musBody)
mLabel.Size=UDim2.new(1,0,0,20)
mLabel.BackgroundTransparency=1
mLabel.Text="ID трека (rbxassetid://...)"
mLabel.TextColor3=Color3.fromRGB(255,180,180)
mLabel.Font=Enum.Font.Gotham;mLabel.TextSize=12
mLabel.TextXAlignment=Enum.TextXAlignment.Left

local mBox=Instance.new("TextBox",musBody)
mBox.Size=UDim2.new(1,0,0,35)
mBox.Position=UDim2.new(0,0,0,25)
mBox.BackgroundColor3=Color3.fromRGB(80,20,20)
mBox.TextColor3=Color3.fromRGB(255,255,255)
mBox.PlaceholderText="rbxassetid://..."
mBox.Text=musicID
mBox.Font=Enum.Font.Gotham;mBox.TextSize=12
cr(mBox,6)

local mApply=Instance.new("TextButton",musBody)
mApply.Size=UDim2.new(1,0,0,32)
mApply.Position=UDim2.new(0,0,0,68)
mApply.BackgroundColor3=Color3.fromRGB(200,40,40)
mApply.Text="Применить"
mApply.TextColor3=Color3.fromRGB(255,255,255)
mApply.Font=Enum.Font.GothamBold;mApply.TextSize=13
cr(mApply,6)
mApply.MouseButton1Click:Connect(function()
    musicID=mBox.Text
    if music then music:Destroy();music=nil end
    if musicOn then
        music=Instance.new("Sound",SG)
        music.SoundId=musicID;music.Volume=0.5;music.Looped=true
        music:Play()
    end
end)

local mToggle=Instance.new("TextButton",musBody)
mToggle.Size=UDim2.new(1,0,0,35)
mToggle.Position=UDim2.new(0,0,0,108)
mToggle.BackgroundColor3=Color3.fromRGB(200,40,40)
mToggle.Text="▶ ВКЛ"
mToggle.TextColor3=Color3.fromRGB(255,255,255)
mToggle.Font=Enum.Font.GothamBold;mToggle.TextSize=14
cr(mToggle,6)
mToggle.MouseButton1Click:Connect(function()
    musicOn=not musicOn
    if musicOn then
        if not music then
            music=Instance.new("Sound",SG)
            music.SoundId=musicID;music.Volume=0.5;music.Looped=true
            music:Play()
        else music:Play() end
        mToggle.Text="⏸ ВЫКЛ"
        mToggle.BackgroundColor3=Color3.fromRGB(100,200,120)
    else
        if music then music:Stop() end
        mToggle.Text="▶ ВКЛ"
        mToggle.BackgroundColor3=Color3.fromRGB(200,40,40)
    end
end)

local mStop=Instance.new("TextButton",musBody)
mStop.Size=UDim2.new(1,0,0,32)
mStop.Position=UDim2.new(0,0,0,151)
mStop.BackgroundColor3=Color3.fromRGB(120,30,30)
mStop.Text="⏹ Стоп"
mStop.TextColor3=Color3.fromRGB(255,255,255)
mStop.Font=Enum.Font.GothamBold;mStop.TextSize=13
cr(mStop,6)
mStop.MouseButton1Click:Connect(function()
    if music then music:Stop() end
    musicOn=false
    mToggle.Text="▶ ВКЛ"
    mToggle.BackgroundColor3=Color3.fromRGB(200,40,40)
end)

local mDrag,mDS,mDP
musHead.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        mDrag=true;mDS=i.Position;mDP=musPanel.Position
    end
end)
musHead.InputChanged:Connect(function(i)
    if mDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-mDS
        musPanel.Position=UDim2.new(mDP.X.Scale,mDP.X.Offset+d.X,mDP.Y.Scale,mDP.Y.Offset+d.Y)
    end
end)
musHead.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        mDrag=false
    end
end)

local mOpen=true
musHide.MouseButton1Click:Connect(function()
    mOpen=not mOpen
    if mOpen then
        musPanel.Size=UDim2.new(0,260,0,320)
        musBody.Visible=true
        musHide.Text="▲"
    else
        musPanel.Size=UDim2.new(0,260,0,40)
        musBody.Visible=false
        musHide.Text="▼"
    end
end)

-- ВЫБОР РЕЖИМА
local mg=Instance.new("ScreenGui",C)
mg.ResetOnSpawn=false;mg.IgnoreGuiInset=true
local mf=Instance.new("Frame",mg)
mf.Size=UDim2.new(0,340,0,400)
mf.Position=UDim2.new(0.5,-170,0.5,-200)
mf.BackgroundColor3=Color3.fromRGB(25,10,10)
cr(mf,16)
local msS=Instance.new("UIStroke",mf)
msS.Color=Color3.fromRGB(255,50,50);msS.Thickness=2

local mt=Instance.new("TextLabel",mf)
mt.Size=UDim2.new(1,0,0,50)
mt.BackgroundTransparency=1
mt.Text="🦸 СУПЕРМЕН"
mt.TextColor3=Color3.fromRGB(255,60,60)
mt.Font=Enum.Font.GothamBold;mt.TextScaled=true

local function modeBtn(txt,y,mode)
    local b=Instance.new("TextButton",mf)
    b.Size=UDim2.new(0.85,0,0,60)
    b.Position=UDim2.new(0.075,0,0,y)
    b.BackgroundColor3=Color3.fromRGB(200,40,40)
    b.Text=txt;b.TextColor3=Color3.fromRGB(255,255,255)
    b.Font=Enum.Font.GothamBold;b.TextSize=18
    cr(b,10)
    b.MouseButton1Click:Connect(function()
        MODE=mode;mg:Destroy();menu()
    end)
end
modeBtn("🥊 ДУЭЛЬ 1 НА 1",80,"d1")
modeBtn("🔥 ДУЭЛЬ 2 НА 2",150,"d2")
modeBtn("💥 ДУЭЛЬ 3 НА 3",220,"d3")
modeBtn("🌍 ОБЫЧНЫЙ СЕРВЕР",290,"norm")

-- МЕНЮ
function menu()
    local sg=Instance.new("ScreenGui",C)
    sg.ResetOnSpawn=false;sg.IgnoreGuiInset=true
    local st={nc=false,sp=false,spv=60,fly=false,esp=false,espL={},ac=false,walkc=false}
    local isOpen=true

    local tog=Instance.new("TextButton",sg)
    tog.Size=UDim2.new(0,60,0,60)
    tog.Position=UDim2.new(0,20,0.5,-240)
    tog.BackgroundColor3=Color3.fromRGB(200,40,40)
    tog.Text="🦸";tog.TextColor3=Color3.fromRGB(255,255,255)
    tog.Font=Enum.Font.GothamBold;tog.TextSize=28
    tog.ZIndex=10;tog.Visible=false
    cr(tog,30)

    local main=Instance.new("Frame",sg)
    main.Size=UDim2.new(0,290,0,540)
    main.Position=UDim2.new(0,20,0.5,-270)
    main.BackgroundColor3=Color3.fromRGB(25,10,10)
    main.BorderSizePixel=0;main.Active=true
    cr(main,14)
    local mainS=Instance.new("UIStroke",main)
    mainS.Color=Color3.fromRGB(255,50,50);mainS.Thickness=2

    local th=Instance.new("Frame",main)
    th.Size=UDim2.new(1,0,0,45)
    th.BackgroundColor3=Color3.fromRGB(60,15,15)
    th.BorderSizePixel=0;cr(th,14)

    local ti=Instance.new("TextLabel",th)
    ti.Size=UDim2.new(1,-80,1,0)
    ti.BackgroundTransparency=1
    ti.Text=(MODE=="d1" and "🦸 1х1" or MODE=="d2" and "🦸 2х2" or MODE=="d3" and "🦸 3х3" or "🦸 ОБЫЧНЫЙ")
    ti.TextColor3=Color3.fromRGB(255,90,90)
    ti.Font=Enum.Font.GothamBold;ti.TextScaled=true

    local musicOpenBtn=Instance.new("TextButton",th)
    musicOpenBtn.Size=UDim2.new(0,32,0,32)
    musicOpenBtn.Position=UDim2.new(1,-72,0,6)
    musicOpenBtn.BackgroundColor3=Color3.fromRGB(150,50,150)
    musicOpenBtn.Text="🎵";musicOpenBtn.TextColor3=Color3.fromRGB(255,255,255)
    musicOpenBtn.Font=Enum.Font.GothamBold;musicOpenBtn.TextSize=16
    cr(musicOpenBtn,8)
    musicOpenBtn.MouseButton1Click:Connect(function()
        musPanel.Visible=not musPanel.Visible
    end)

    local minBtn=Instance.new("TextButton",th)
    minBtn.Size=UDim2.new(0,32,0,32)
    minBtn.Position=UDim2.new(1,-38,0,6)
    minBtn.BackgroundColor3=Color3.fromRGB(200,40,40)
    minBtn.Text="▼";minBtn.TextColor3=Color3.fromRGB(255,255,255)
    minBtn.Font=Enum.Font.GothamBold;minBtn.TextSize=15
    cr(minBtn,8)

    local dB,dS,dP,moved
    tog.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            dB=true;moved=false;dS=i.Position;dP=tog.Position
        end
    end)
    tog.InputChanged:Connect(function(i)
        if dB and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d=i.Position-dS
            if math.abs(d.X)>5 or math.abs(d.Y)>5 then moved=true end
            if moved then
                tog.Position=UDim2.new(dP.X.Scale,dP.X.Offset+d.X,dP.Y.Scale,dP.Y.Offset+d.Y)
            end
        end
    end)
    tog.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            if not moved and not isOpen then
                isOpen=true;main.Visible=true;tog.Visible=false
            end
            dB=false
        end
    end)

    minBtn.MouseButton1Click:Connect(function()
        if isOpen then
            isOpen=false;tog.Position=main.Position
            main.Visible=false;tog.Visible=true
        end
    end)

    local drag,dS2,dP2
    th.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            drag=true;dS2=i.Position;dP2=main.Position
        end
    end)
    th.InputChanged:Connect(function(i)
        if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d=i.Position-dS2
            main.Position=UDim2.new(dP2.X.Scale,dP2.X.Offset+d.X,dP2.Y.Scale,dP2.Y.Offset+d.Y)
        end
    end)
    th.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            drag=false
        end
    end)

    local sc=Instance.new("ScrollingFrame",main)
    sc.Size=UDim2.new(1,-16,1,-57)
    sc.Position=UDim2.new(0,8,0,51)
    sc.BackgroundTransparency=1;sc.BorderSizePixel=0
    sc.ScrollBarThickness=4
    sc.ScrollBarImageColor3=Color3.fromRGB(255,80,80)
    sc.CanvasSize=UDim2.new(0,0,0,0)
    sc.AutomaticCanvasSize=Enum.AutomaticSize.Y
    Instance.new("UIListLayout",sc).Padding=UDim.new(0,6)

    mkSec(sc,"ТЕЛЕПОРТ")
    mkB(sc,"📍 Вперёд",function()
        local c=LP.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame=c.HumanoidRootPart.CFrame*CFrame.new(0,0,-50)
        end
    end)
    mkB(sc,"⬆️ Вверх",function()
        local c=LP.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame=c.HumanoidRootPart.CFrame*CFrame.new(0,50,0)
        end
    end)
    mkB(sc,"🏔️ На горы",function()
        local c=LP.Character
        if not c or not c:FindFirstChild("HumanoidRootPart") then return end
        local p=c.HumanoidRootPart.Position
        local hp,hy=nil,p.Y
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("BasePart") and o.CanCollide and not o:IsDescendantOf(c) then
                local d=(o.Position-p).Magnitude
                if d<800 and o.Position.Y>hy then hy=o.Position.Y;hp=o end
            end
        end
        if hp then
            c.HumanoidRootPart.CFrame=CFrame.new(hp.Position.X,hp.Position.Y+5,hp.Position.Z)
        else
            c.HumanoidRootPart.CFrame=CFrame.new(p.X,p.Y+150,p.Z)
        end
    end,Color3.fromRGB(150,60,60))

    mkB(sc,"👥 К игроку",function()
        local ps=Instance.new("ScreenGui",C)
        ps.ResetOnSpawn=false;ps.IgnoreGuiInset=true
        local pf=Instance.new("Frame",ps)
        pf.Size=UDim2.new(0.7,0,0.7,0)
        pf.Position=UDim2.new(0.15,0,0.15,0)
        pf.BackgroundColor3=Color3.fromRGB(25,10,10)
        cr(pf,12)
        local t=Instance.new("TextLabel",pf)
        t.Size=UDim2.new(1,0,0,40)
        t.BackgroundTransparency=1
        t.Text="👥 ВЫБЕРИ ИГРОКА"
        t.TextColor3=Color3.fromRGB(255,100,100)
        t.Font=Enum.Font.GothamBold;t.TextScaled=true
        local cl=Instance.new("TextButton",pf)
        cl.Size=UDim2.new(0,36,0,36)
        cl.Position=UDim2.new(1,-42,0,4)
        cl.BackgroundColor3=Color3.fromRGB(200,40,40)
        cl.Text="✕";cl.TextColor3=Color3.fromRGB(255,255,255)
        cl.Font=Enum.Font.GothamBold;cl.TextSize=18
        cr(cl,8)
        cl.MouseButton1Click:Connect(function() ps:Destroy() end)
        local s=Instance.new("ScrollingFrame",pf)
        s.Size=UDim2.new(0.94,0,1,-50)
        s.Position=UDim2.new(0.03,0,0,44)
        s.BackgroundTransparency=1;s.BorderSizePixel=0
        s.CanvasSize=UDim2.new(0,0,0,0)
        s.AutomaticCanvasSize=Enum.AutomaticSize.Y
        s.ScrollBarThickness=4
        Instance.new("UIListLayout",s).Padding=UDim.new(0,6)
        for _,pl in ipairs(P:GetPlayers()) do
            if pl~=LP then
                local b=Instance.new("TextButton",s)
                b.Size=UDim2.new(1,-8,0,40)
                b.BackgroundColor3=Color3.fromRGB(90,30,30)
                b.Text=pl.Name;b.TextColor3=Color3.fromRGB(255,255,255)
                b.Font=Enum.Font.Gotham;b.TextSize=14
                cr(b,8)
                b.MouseButton1Click:Connect(function()
                    local c=LP.Character
                    local tg=pl.Character
                    if c and c:FindFirstChild("HumanoidRootPart") and tg and tg:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.CFrame=tg.HumanoidRootPart.CFrame*CFrame.new(0,0,3)
                    end
                    ps:Destroy()
                end)
            end
        end
    end,Color3.fromRGB(150,40,150))

    if MODE=="d1" or MODE=="d2" or MODE=="d3" then
        mkSec(sc,"ДУЭЛЬ")
        mkB(sc,"🎯 К врагу",function()
            local c=LP.Character
            if not c or not c:FindFirstChild("HumanoidRootPart") then return end
            local mp=c.HumanoidRootPart.Position
            local cl,md=nil,math.huge
            for _,pl in ipairs(P:GetPlayers()) do
                if pl~=LP and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                    local h=pl.Character:FindFirstChildOfClass("Humanoid")
                    if h and h.Health>0 then
                        local d=(pl.Character.HumanoidRootPart.Position-mp).Magnitude
                        if d<md then md=d;cl=pl.Character.HumanoidRootPart end
                    end
                end
            end
            if cl then c.HumanoidRootPart.CFrame=cl.CFrame*CFrame.new(0,0,3) end
        end,Color3.fromRGB(220,30,30))
    end

    mkSec(sc,"ESP")
    local eb=mkB(sc,"👁️ Подсветка: ВЫКЛ",function()
        st.esp=not st.esp
        eb.Text=st.esp and "👁️ Подсветка: ВКЛ" or "👁️ Подсветка: ВЫКЛ"
        eb.BackgroundColor3=st.esp and Color3.fromRGB(200,80,80) or Color3.fromRGB(150,40,40)
        if not st.esp then
            for _,o in pairs(st.espL) do
                if o.hl then o.hl:Destroy() end
                if o.bb then o.bb:Destroy() end
            end
            st.espL={}
        end
    end,Color3.fromRGB(150,40,40))

    task.spawn(function()
        while sg.Parent do
            task.wait(0.15)
            if st.esp then
                for _,pl in ipairs(P:GetPlayers()) do
                    if pl~=LP and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                        if not st.espL[pl] then
                            local hl=Instance.new("Highlight")
                            hl.FillColor=Color3.fromRGB(255,30,30)
                            hl.OutlineColor=Color3.fromRGB(255,255,255)
                            hl.FillTransparency=0.6
                            hl.Adornee=pl.Character
                            hl.Parent=pl.Character
                            local bb=Instance.new("BillboardGui")
                            bb.Size=UDim2.new(0,180,0,40)
                            bb.StudsOffset=Vector3.new(0,3,0)
                            bb.AlwaysOnTop=true
                            bb.Adornee=pl.Character:FindFirstChild("Head") or pl.Character.HumanoidRootPart
                            bb.Parent=pl.Character
                            local lb=Instance.new("TextLabel",bb)
                            lb.Size=UDim2.new(1,0,1,0)
                            lb.BackgroundTransparency=1
                            lb.TextColor3=Color3.fromRGB(255,255,255)
                            lb.TextStrokeTransparency=0
                            lb.Font=Enum.Font.GothamBold;lb.TextScaled=true
                            lb.Text=pl.Name
                            st.espL[pl]={hl=hl,bb=bb}
                        end
                    end
                end
            end
        end
    end)

    P.PlayerRemoving:Connect(function(pl)
        if st.espL[pl] then
            if st.espL[pl].hl then st.espL[pl].hl:Destroy() end
            if st.espL[pl].bb then st.espL[pl].bb:Destroy() end
            st.espL[pl]=nil
        end
    end)

    mkSec(sc,"БОЙ")
    local acB=mkB(sc,"⚡ Авто-комбо: ВЫКЛ",function()
        st.ac=not st.ac
        acB.Text=st.ac and "⚡ Авто-комбо: ВКЛ" or "⚡ Авто-комбо: ВЫКЛ"
        acB.BackgroundColor3=st.ac and Color3.fromRGB(230,150,40) or Color3.fromRGB(150,40,40)
        if st.ac then
            task.spawn(function()
                while st.ac do
                    task.wait(0.08)
                    local c=LP.Character
                    if c then
                        local tool=c:FindFirstChildOfClass("Tool")
                        if tool then tool:Activate() end
                        VIM:SendMouseButtonEvent(0,0,0,true,game,1)
                        task.wait(0.02)
                        VIM:SendMouseButtonEvent(0,0,0,false,game,1)
                    end
                end
            end)
        end
    end,Color3.fromRGB(150,40,40))

    local wcB=mkB(sc,"🚶 Валк-комбо: ВЫКЛ",function()
        st.walkc=not st.walkc
        wcB.Text=st.walkc and "🚶 Валк-комбо: ВКЛ" or "🚶 Валк-комбо: ВЫКЛ"
        wcB.BackgroundColor3=st.walkc and Color3.fromRGB(230,180,40) or Color3.fromRGB(150,40,40)
        if st.walkc then
            task.spawn(function()
                while st.walkc do
                    task.wait(0.1)
                    local c=LP.Character
                    if c then
                        local h=c:FindFirstChildOfClass("Humanoid")
                        if h and h.MoveDirection.Magnitude>0.1 then
                            local tool=c:FindFirstChildOfClass("Tool")
                            if tool then tool:Activate() end
                            VIM:SendMouseButtonEvent(0,0,0,true,game,1)
                            task.wait(0.02)
                            VIM:SendMouseButtonEvent(0,0,0,false,game,1)
                        end
                    end
                end
            end)
        end
    end,Color3.fromRGB(150,40,40))

    mkSec(sc,"ЧИТЫ")
    local fb=mkB(sc,"🕊️ Флай: ВЫКЛ",function()
        st.fly=not st.fly
        if st.fly then
            fb.Text="🕊️ Флай: ВКЛ"
            fb.BackgroundColor3=Color3.fromRGB(200,80,80)
            local ctrl=Instance.new("Frame",sg)
            ctrl.Name="FlyControls"
            ctrl.Size=UDim2.new(0,260,0,260)
            ctrl.Position=UDim2.new(1,-280,0.5,-130)
            ctrl.BackgroundTransparency=1
            ctrl.ZIndex=15
            local function mkFlyBtn(txt,pos)
                local b=Instance.new("TextButton",ctrl)
                b.Size=UDim2.new(0,80,0,80)
                b.Position=pos
                b.BackgroundColor3=Color3.fromRGB(200,40,40)
                b.Text=txt;b.TextColor3=Color3.fromRGB(255,255,255)
                b.Font=Enum.Font.GothamBold;b.TextSize=38
                b.ZIndex=16;b.AutoButtonColor=false
                cr(b,16)
                return b
            end
            local up=mkFlyBtn("▲",UDim2.new(0,90,0,0))
            local down=mkFlyBtn("▼",UDim2.new(0,90,0,180))
            local left=mkFlyBtn("◀",UDim2.new(0,0,0,90))
            local right=mkFlyBtn("▶",UDim2.new(0,180,0,90))
            local fwd=mkFlyBtn("⏫",UDim2.new(0,90,0,90))
            local hU,hD,hL,hR,hF=false,false,false,false,false
            local function bind(btn,setter)
                btn.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
                        setter(true);btn.BackgroundColor3=Color3.fromRGB(255,100,100)
                    end
                end)
                btn.InputEnded:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
                        setter(false);btn.BackgroundColor3=Color3.fromRGB(200,40,40)
                    end
                end)
            end
            bind(up,function(v) hU=v end)
            bind(down,function(v) hD=v end)
            bind(left,function(v) hL=v end)
            bind(right,function(v) hR=v end)
            bind(fwd,function(v) hF=v end)
            task.spawn(function()
                while st.fly do
                    task.wait()
                    local c=LP.Character
                    if not c then break end
                    local r=c:FindFirstChild("HumanoidRootPart")
                    if not r then break end
                    local speed=2
                    local move=Vector3.zero
                    local cf=Cam.CFrame
                    if hU then move=move+Vector3.new(0,1,0) end
                    if hD then move=move-Vector3.new(0,1,0) end
                    if hL then move=move-cf.RightVector end
                    if hR then move=move+cf.RightVector end
                    if hF then move=move+cf.LookVector end
                    if move.Magnitude>0.01 then
                        r.CFrame=r.CFrame+move.Unit*speed
                    end
                end
            end)
        else
            fb.Text="🕊️ Флай: ВЫКЛ"
            fb.BackgroundColor3=Color3.fromRGB(150,40,40)
            local ctrl=sg:FindFirstChild("FlyControls")
            if ctrl then ctrl:Destroy() end
        end
    end)

    local nb=mkB(sc,"🚪 No-Clip: ВЫКЛ",function()
        st.nc=not st.nc
        nb.Text=st.nc and "🚪 No-Clip: ВКЛ" or "🚪 No-Clip: ВЫКЛ"
        nb.BackgroundColor3=st.nc and Color3.fromRGB(200,80,80) or Color3.fromRGB(150,40,40)
    end,Color3.fromRGB(150,40,40))

    mkSec(sc,"СКОРОСТЬ")
    local sb=mkB(sc,"🏃 Speed: ВЫКЛ",function()
        st.sp=not st.sp
        sb.Text=st.sp and "🏃 Speed: ВКЛ" or "🏃 Speed: ВЫКЛ"
        sb.BackgroundColor3=st.sp and Color3.fromRGB(200,80,80) or Color3.fromRGB(150,40,40)
        local c=LP.Character
        if c and c:FindFirstChild("Humanoid") then
            c.Humanoid.WalkSpeed=st.sp and st.spv or 16
        end
    end,Color3.fromRGB(150,40,40))

    local sf=Instance.new("Frame",sc)
    sf.Size=UDim2.new(1,-8,0,55)
    sf.BackgroundColor3=Color3.fromRGB(45,15,15)
    cr(sf,8)
    local sl=Instance.new("TextLabel",sf)
    sl.Size=UDim2.new(1,-10,0,20)
    sl.Position=UDim2.new(0,5,0,4)
    sl.BackgroundTransparency=1
    sl.Text="Скорость: 60"
    sl.TextColor3=Color3.fromRGB(255,180,180)
    sl.Font=Enum.Font.Gotham;sl.TextSize=13
    sl.TextXAlignment=Enum.TextXAlignment.Left
    local str=Instance.new("Frame",sf)
    str.Size=UDim2.new(1,-20,0,12)
    str.Position=UDim2.new(0,10,0,30)
    str.BackgroundColor3=Color3.fromRGB(80,20,20)
    cr(str,6)
    local sfl=Instance.new("Frame",str)
    sfl.Size=UDim2.new(0.24,0,1,0)
    sfl.BackgroundColor3=Color3.fromRGB(255,60,60)
    cr(sfl,6)
    local sdr=false
    local function supd(i)
        local rx=math.clamp((i.Position.X-str.AbsolutePosition.X)/str.AbsoluteSize.X,0,1)
        local v=math.floor(16+184*rx)
        sfl.Size=UDim2.new(rx,0,1,0)
        sl.Text="Скорость: "..v
        st.spv=v
        local c=LP.Character
        if c and c:FindFirstChild("Humanoid") and st.sp then
            c.Humanoid.WalkSpeed=v 
