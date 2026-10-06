-- ===== Vovacode92xRicRob ULTRA v26 =====
-- Ключ: VxRr11
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
local kills=0

local function cr(p,r) local c=Instance.new("UICorner",p);c.CornerRadius=UDim.new(0,r or 8) end
local function gr(p,a,b) local g=Instance.new("UIGradient",p);g.Color=ColorSequence.new(a,b);g.Rotation=90 end
local function stk(p,c,t) local s=Instance.new("UIStroke",p);s.Color=c or Color3.fromRGB(180,120,255);s.Thickness=t or 1.5 end
local function mkB(parent,txt,cb)
    local b=Instance.new("TextButton",parent)
    b.Size=UDim2.new(1,-8,0,40)
    b.BackgroundColor3=Color3.fromRGB(90,50,180)
    b.Text=txt;b.TextColor3=Color3.fromRGB(255,220,80)
    b.Font=Enum.Font.GothamBold;b.TextSize=14
    cr(b,8)
    gr(b,Color3.fromRGB(120,60,220),Color3.fromRGB(60,30,140))
    stk(b,Color3.fromRGB(255,200,60),1)
    b.MouseButton1Click:Connect(cb)
    return b
end
local function mkSec(parent,txt)
    local l=Instance.new("TextLabel",parent)
    l.Size=UDim2.new(1,-8,0,22)
    l.BackgroundTransparency=1
    l.Text="▸ "..txt
    l.TextColor3=Color3.fromRGB(255,220,80)
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.Font=Enum.Font.GothamBold;l.TextSize=13
end

-- КЛЮЧЕВАЯ СИСТЕМА
local kg=Instance.new("ScreenGui",C)
kg.ResetOnSpawn=false;kg.IgnoreGuiInset=true
local kf=Instance.new("Frame",kg)
kf.Size=UDim2.new(0,320,0,240)
kf.Position=UDim2.new(0.5,-160,0.5,-120)
kf.BackgroundColor3=Color3.fromRGB(30,15,60)
cr(kf,16)
gr(kf,Color3.fromRGB(60,25,120),Color3.fromRGB(20,10,40))
stk(kf,Color3.fromRGB(255,200,60),2)

local kt=Instance.new("TextLabel",kf)
kt.Size=UDim2.new(1,0,0,50)
kt.BackgroundTransparency=1
kt.Text="🦸 Vovacode92xRicRob ULTRA"
kt.TextColor3=Color3.fromRGB(255,220,80)
kt.Font=Enum.Font.GothamBold;kt.TextScaled=true

local kh=Instance.new("TextLabel",kf)
kh.Size=UDim2.new(1,0,0,20)
kh.Position=UDim2.new(0,0,0,50)
kh.BackgroundTransparency=1
kh.Text="Введи ключ доступа"
kh.TextColor3=Color3.fromRGB(200,180,255)
kh.Font=Enum.Font.Gotham;kh.TextScaled=true

local kb=Instance.new("TextBox",kf)
kb.Size=UDim2.new(0.8,0,0,42)
kb.Position=UDim2.new(0.1,0,0,80)
kb.BackgroundColor3=Color3.fromRGB(50,25,90)
kb.TextColor3=Color3.fromRGB(255,255,255)
kb.PlaceholderText="Ключ..."
kb.Text=""
kb.Font=Enum.Font.Gotham;kb.TextSize=16
cr(kb,8)

local kbtn=Instance.new("TextButton",kf)
kbtn.Size=UDim2.new(0.8,0,0,42)
kbtn.Position=UDim2.new(0.1,0,0,132)
kbtn.BackgroundColor3=Color3.fromRGB(120,60,220)
kbtn.Text="ВОЙТИ"
kbtn.TextColor3=Color3.fromRGB(255,220,80)
kbtn.Font=Enum.Font.GothamBold;kbtn.TextSize=16
cr(kbtn,8)
gr(kbtn,Color3.fromRGB(160,80,255),Color3.fromRGB(90,40,180))

local ks=Instance.new("TextLabel",kf)
ks.Size=UDim2.new(1,0,0,20)
ks.Position=UDim2.new(0,0,1,-25)
ks.BackgroundTransparency=1
ks.Text=""
ks.TextColor3=Color3.fromRGB(255,90,90)
ks.Font=Enum.Font.Gotham;ks.TextScaled=true

kbtn.MouseButton1Click:Connect(function()
    if kb.Text=="VxRr11" then
        ks.TextColor3=Color3.fromRGB(80,255,120)
        ks.Text="✅ Доступ!"
        task.wait(0.4)
        kg:Destroy()
        menu()
    else
        ks.Text="❌ Неверный ключ"
        kb.Text=""
    end
end)

-- ПАНЕЛЬ МУЗЫКИ
local musGui=Instance.new("ScreenGui",C)
musGui.ResetOnSpawn=false;musGui.IgnoreGuiInset=true
local musPanel=Instance.new("Frame",musGui)
musPanel.Size=UDim2.new(0,260,0,300)
musPanel.Position=UDim2.new(1,-280,0.5,-150)
musPanel.BackgroundColor3=Color3.fromRGB(30,15,60)
musPanel.BorderSizePixel=0;musPanel.Active=true
cr(musPanel,14)
gr(musPanel,Color3.fromRGB(50,25,100),Color3.fromRGB(20,10,40))
stk(musPanel,Color3.fromRGB(255,200,60),2)

local mHead=Instance.new("Frame",musPanel)
mHead.Size=UDim2.new(1,0,0,38)
mHead.BackgroundColor3=Color3.fromRGB(60,30,120)
mHead.BorderSizePixel=0;cr(mHead,14)
gr(mHead,Color3.fromRGB(90,45,180),Color3.fromRGB(50,25,100))

local mTitle=Instance.new("TextLabel",mHead)
mTitle.Size=UDim2.new(1,-40,1,0)
mTitle.BackgroundTransparency=1
mTitle.Text="🎵 МУЗЫКА"
mTitle.TextColor3=Color3.fromRGB(255,220,80)
mTitle.Font=Enum.Font.GothamBold;mTitle.TextScaled=true

local mHide=Instance.new("TextButton",mHead)
mHide.Size=UDim2.new(0,28,0,28)
mHide.Position=UDim2.new(1,-33,0,5)
mHide.BackgroundColor3=Color3.fromRGB(160,80,255)
mHide.Text="▲";mHide.TextColor3=Color3.fromRGB(255,255,255)
mHide.Font=Enum.Font.GothamBold;mHide.TextSize=14
cr(mHide,6)

local mBody=Instance.new("Frame",musPanel)
mBody.Size=UDim2.new(1,-16,1,-48)
mBody.Position=UDim2.new(0,8,0,42)
mBody.BackgroundTransparency=1

local mBox=Instance.new("TextBox",mBody)
mBox.Size=UDim2.new(1,0,0,32)
mBox.Position=UDim2.new(0,0,0,5)
mBox.BackgroundColor3=Color3.fromRGB(50,25,90)
mBox.TextColor3=Color3.fromRGB(255,255,255)
mBox.PlaceholderText="rbxassetid://..."
mBox.Text=musicID
mBox.Font=Enum.Font.Gotham;mBox.TextSize=11
cr(mBox,6)

local mApply=Instance.new("TextButton",mBody)
mApply.Size=UDim2.new(1,0,0,30)
mApply.Position=UDim2.new(0,0,0,42)
mApply.BackgroundColor3=Color3.fromRGB(120,60,220)
mApply.Text="Применить";mApply.TextColor3=Color3.fromRGB(255,220,80)
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

local mToggle=Instance.new("TextButton",mBody)
mToggle.Size=UDim2.new(1,0,0,32)
mToggle.Position=UDim2.new(0,0,0,78)
mToggle.BackgroundColor3=Color3.fromRGB(120,60,220)
mToggle.Text="▶ ВКЛ";mToggle.TextColor3=Color3.fromRGB(255,220,80)
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
        mToggle.BackgroundColor3=Color3.fromRGB(80,180,100)
    else
        if music then music:Stop() end
        mToggle.Text="▶ ВКЛ"
        mToggle.BackgroundColor3=Color3.fromRGB(120,60,220)
    end
end)

local mStop=Instance.new("TextButton",mBody)
mStop.Size=UDim2.new(1,0,0,30)
mStop.Position=UDim2.new(0,0,0,115)
mStop.BackgroundColor3=Color3.fromRGB(140,50,50)
mStop.Text="⏹ Стоп";mStop.TextColor3=Color3.fromRGB(255,255,255)
mStop.Font=Enum.Font.GothamBold;mStop.TextSize=13
cr(mStop,6)
mStop.MouseButton1Click:Connect(function()
    if music then music:Stop() end
    musicOn=false
    mToggle.Text="▶ ВКЛ"
    mToggle.BackgroundColor3=Color3.fromRGB(120,60,220)
end)

local mDrag,mDS,mDP
mHead.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        mDrag=true;mDS=i.Position;mDP=musPanel.Position
    end
end)
mHead.InputChanged:Connect(function(i)
    if mDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-mDS
        musPanel.Position=UDim2.new(mDP.X.Scale,mDP.X.Offset+d.X,mDP.Y.Scale,mDP.Y.Offset+d.Y)
    end
end)
mHead.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        mDrag=false
    end
end)

local mOpen=true
mHide.MouseButton1Click:Connect(function()
    mOpen=not mOpen
    if mOpen then
        musPanel.Size=UDim2.new(0,260,0,300)
        mBody.Visible=true;mHide.Text="▲"
    else
        musPanel.Size=UDim2.new(0,260,0,38)
        mBody.Visible=false;mHide.Text="▼"
    end
end)

-- ВЫБОР РЕЖИМА
local mg=Instance.new("ScreenGui",C)
mg.ResetOnSpawn=false;mg.IgnoreGuiInset=true
local mf=Instance.new("Frame",mg)
mf.Size=UDim2.new(0,340,0,400)
mf.Position=UDim2.new(0.5,-170,0.5,-200)
mf.BackgroundColor3=Color3.fromRGB(30,15,60)
cr(mf,16)
gr(mf,Color3.fromRGB(60,25,120),Color3.fromRGB(20,10,40))
stk(mf,Color3.fromRGB(255,200,60),2)

local mt=Instance.new("TextLabel",mf)
mt.Size=UDim2.new(1,0,0,50)
mt.BackgroundTransparency=1
mt.Text="🦸 ULTRA РЕЖИМ"
mt.TextColor3=Color3.fromRGB(255,220,80)
mt.Font=Enum.Font.GothamBold;mt.TextScaled=true

local function modeBtn(txt,y,mode)
    local b=Instance.new("TextButton",mf)
    b.Size=UDim2.new(0.85,0,0,60)
    b.Position=UDim2.new(0.075,0,0,y)
    b.BackgroundColor3=Color3.fromRGB(120,60,220)
    b.Text=txt;b.TextColor3=Color3.fromRGB(255,220,80)
    b.Font=Enum.Font.GothamBold;b.TextSize=18
    cr(b,10)
    gr(b,Color3.fromRGB(160,80,255),Color3.fromRGB(90,40,180))
    stk(b,Color3.fromRGB(255,200,60),1)
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
    local st={nc=false,sp=false,spv=60,fly=false,esp=false,espL={},ac=false,walkc=false,ij=false,aim=false,kaura=false,hb=false,anti=false}
    local isOpen=true

    local tog=Instance.new("TextButton",sg)
    tog.Size=UDim2.new(0,60,0,60)
    tog.Position=UDim2.new(0,20,0.5,-240)
    tog.BackgroundColor3=Color3.fromRGB(120,60,220)
    tog.Text="🦸";tog.TextColor3=Color3.fromRGB(255,220,80)
    tog.Font=Enum.Font.GothamBold;tog.TextSize=28
    tog.ZIndex=10;tog.Visible=false
    cr(tog,30)
    gr(tog,Color3.fromRGB(160,80,255),Color3.fromRGB(90,40,180))
    stk(tog,Color3.fromRGB(255,200,60),2)

    local main=Instance.new("Frame",sg)
    main.Size=UDim2.new(0,290,0,540)
    main.Position=UDim2.new(0,20,0.5,-270)
    main.BackgroundColor3=Color3.fromRGB(30,15,60)
    main.BorderSizePixel=0;main.Active=true
    cr(main,14)
    gr(main,Color3.fromRGB(50,25,100),Color3.fromRGB(20,10,40))
    stk(main,Color3.fromRGB(255,200,60),2)

    local th=Instance.new("Frame",main)
    th.Size=UDim2.new(1,0,0,45)
    th.BackgroundColor3=Color3.fromRGB(60,30,120)
    th.BorderSizePixel=0;cr(th,14)
    gr(th,Color3.fromRGB(90,45,180),Color3.fromRGB(50,25,100))

    local ti=Instance.new("TextLabel",th)
    ti.Size=UDim2.new(1,-120,1,0)
    ti.BackgroundTransparency=1
    ti.Text="🦸 ULTRA | K:"..kills
    ti.TextColor3=Color3.fromRGB(255,220,80)
    ti.Font=Enum.Font.GothamBold;ti.TextScaled=true

    local musicOpenBtn=Instance.new("TextButton",th)
    musicOpenBtn.Size=UDim2.new(0,30,0,30)
    musicOpenBtn.Position=UDim2.new(1,-105,0,7)
    musicOpenBtn.BackgroundColor3=Color3.fromRGB(150,50,150)
    musicOpenBtn.Text="🎵";musicOpenBtn.TextColor3=Color3.fromRGB(255,255,255)
    musicOpenBtn.Font=Enum.Font.GothamBold;musicOpenBtn.TextSize=15
    cr(musicOpenBtn,8)
    musicOpenBtn.MouseButton1Click:Connect(function()
        musPanel.Visible=not musPanel.Visible
    end)

    local minBtn=Instance.new("TextButton",th)
    minBtn.Size=UDim2.new(0,30,0,30)
    minBtn.Position=UDim2.new(1,-38,0,7)
    minBtn.BackgroundColor3=Color3.fromRGB(160,80,255)
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
    sc.ScrollBarImageColor3=Color3.fromRGB(255,200,60)
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
    end)
    mkB(sc,"👥 К игроку",function()
        local ps=Instance.new("ScreenGui",C)
        ps.ResetOnSpawn=false;ps.IgnoreGuiInset=true
        local pf=Instance.new("Frame",ps)
        pf.Size=UDim2.new(0.7,0,0.7,0)
        pf.Position=UDim2.new(0.15,0,0.15,0)
        pf.BackgroundColor3=Color3.fromRGB(30,15,60)
        cr(pf,12)
        gr(pf,Color3.fromRGB(50,25,100),Color3.fromRGB(20,10,40))
        local t=Instance.new("TextLabel",pf)
        t.Size=UDim2.new(1,0,0,40)
        t.BackgroundTransparency=1
        t.Text="👥 ВЫБЕРИ ИГРОКА"
        t.TextColor3=Color3.fromRGB(255,220,80)
        t.Font=Enum.Font.GothamBold;t.TextScaled=true
        local cl=Instance.new("TextButton",pf)
        cl.Size=UDim2.new(0,36,0,36)
        cl.Position=UDim2.new(1,-42,0,4)
        cl.BackgroundColor3=Color3.fromRGB(160,50,50)
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
                b.BackgroundColor3=Color3.fromRGB(90,45,180)
                b.Text=pl.Name;b.TextColor3=Color3.fromRGB(255,220,80)
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
    end)

    mkSec(sc,"УЛЬТРА")
    mkB(sc,"🎯 Aimbot: ВЫКЛ",function()
        st.aim=not st.aim
        if st.aim then
            task.spawn(function()
                while st.aim do
                    task.wait()
                    local c=LP.Character
                    if c and c:FindFirstChild("HumanoidRootPart") then
                        local mp=c.HumanoidRootPart.Position
                        local cl,md=nil,math.huge
                        for _,pl in ipairs(P:GetPlayers()) do
                            if pl~=LP and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                                local d=(pl.Character.HumanoidRootPart.Position-mp).Magnitude
                                if d<md then md=d;cl=pl.Character.HumanoidRootPart end
                            end
                        end
                        if cl then
                            Cam.CFrame=CFrame.new(Cam.CFrame.Position,cl.Position)
                        end
                    end
                end
            end)
        end
    end)
    mkB(sc,"📦 Hitbox: ВЫКЛ",function()
        st.hb=not st.hb
        for _,pl in ipairs(P:GetPlayers()) do
            if pl~=LP and pl.Character then
                local h=pl.Character:FindFirstChild("HumanoidRootPart")
                if h then h.Size=st.hb and Vector3.new(15,15,15) or Vector3.new(2,2,1) end
            end
        end
    end)
    mkB(sc,"💥 Kill Aura: ВЫКЛ",function()
        st.kaura=not st.kaura
        if st.kaura then
            task.spawn(function()
                while st.kaura do
                    task.wait(0.1)
                    local c=LP.Character
                    if c and c:FindFirstChild("HumanoidRootPart") then
                        for _,pl in ipairs(P:GetPlayers()) do
                            if pl~=LP and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                                local d=(pl.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude
                                if d<15 then
                                    local tool=c:FindFirstChildOfClass("Tool")
                                    if tool then tool:Activate() end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    mkB(sc,"🛡️ Anti-Stun: ВЫКЛ",function()
        st.anti=not st.anti
    end)
    mkB(sc,"🦘 Inf Jump: ВЫКЛ",function()
        st.ij=not st.ij
    end)

    if MODE=="d1" or MODE=="d2" or MODE=="d3" then
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
        end)
    end

    mkSec(sc,"ESP")
    local eb=mkB(sc,"👁️ Подсветка: ВЫКЛ",function()
        st.esp=not st.esp
        eb.Text=st.esp and "👁️ Подсветка: ВКЛ" or "👁️ Подсветка: ВЫКЛ"
        if not st.esp then
            for _,o in pairs(st.espL) do
                if o.hl then o.hl:Destroy() end
                if o.bb then o.bb:Destroy() end
            end
            st.espL={}
        end
    end)

    task.spawn(function()
        while sg.Parent do
            task.wait(0.15)
            if st.esp then
                for _,pl in ipairs(P:GetPlayers()) do
                    if pl~=LP and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                        if not st.espL[pl] then
                            local hl=Instance.new("Highlight")
                            hl.FillColor=Color3.fromRGB(180,80,255)
                            hl.OutlineColor=Color3.fromRGB(255,220,80)
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
                            lb.TextColor3=Color3.fromRGB(255,220,80)
                            lb.TextStrokeTransparency=0
                            lb.TextStrokeColor3=Color3.fromRGB(60,20,120)
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
    mkB(sc,"⚡ Авто-комбо: ВЫКЛ",function()
        st.ac=not st.ac
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
    end)
    mkB(sc,"🚶 Валк-комбо: ВЫКЛ",function()
        st.walkc=not st.walkc
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
    end)

    mkSec(sc,"ЧИТЫ")
    mkB(sc,"🕊️ Флай: ВЫКЛ",function()
        st.fly=not st.fly
        if st.fly then
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
                b.BackgroundColor3=Color3.fromRGB(120,60,220)
                b.Text=txt;b.TextColor3=Color3.fromRGB(255,220,80)
                b.Font=Enum.Font.GothamBold;b.TextSize=38
                b.ZIndex=16;b.AutoButtonColor=false
                cr(b,16)
                gr(b,Color3.fromRGB(160,80,255),Color3.fromRGB(90,40,180))
                stk(b,Color3.fromRGB(255,200,60),1)
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
                        setter(true);btn.BackgroundColor3=Color3.fromRGB(200,120,255)
                    end
                end)
                btn.InputEnded:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
                        setter(false);btn.BackgroundColor3=Color3.fromRGB(120,60,220)
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
            local ctrl=sg:FindFirstChild("FlyControls")
            if ctrl then ctrl:Destroy() end
        end
    end)
    mkB(sc,"🚪 No-Clip: ВЫКЛ",function()
        st.nc=not st.nc
    end)
    mkSec(sc,"СКОРОСТЬ")
    local sb=mkB(sc,"🏃 Speed: ВЫКЛ",function()
        st.sp=not st.sp
        sb.Text=st.sp and "🏃 Speed: ВКЛ" or "🏃 Speed: ВЫКЛ"
        local c=LP.Character
        if c and c:FindFirstChild("Humanoid") then
            c.Humanoid.WalkSpeed=st.sp and st.spv or 16
        end
    end)
    local sf=Instance.new("Frame",sc)
    sf.Size=UDim2.new(1,-8,0,55)
    sf.BackgroundColor3=Color3.fromRGB(45,25,80)
    cr(sf,8)
    local sl=Instance.new("TextLabel",sf)
    sl.Size=UDim2.new(1,-10,0,20)
    sl.Position=UDim2.new(0,5,0,4)
    sl.BackgroundTransparency=1
    sl.Text="Скорость: 60"
    sl.TextColor3=Color3.fromRGB(255,220,80)
    sl.Font=Enum.Font.Gotham;sl.TextSize=13
    sl.TextXAlignment=Enum.TextXAlignment.Left
    local str=Instance.new("Frame",sf)
    str.Size=UDim2.new(1,-20,0,12)
    str.Position=UDim2.new(0,10,0,30)
    str.BackgroundColor3=Color3.fromRGB(80,40,140)
    cr(str,6)
    local sfl=Instance.new("Frame",str)
    sfl.Size=UDim2.new(0.24,0,1,0)
    sfl.BackgroundColor3=Color3.fromRGB(255,200,60)
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
        end
    end
    str.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            sdr=true;supd(i)
        end
    end)
    U.InputChanged:Connect(function(i)
        if sdr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            supd(i)
        end
    end)
    U.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sdr=false end
    end)

    R.Stepped:Connect(function()
        if st.nc then
            local c=LP.Character
            if c then
                for _,p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide=false end
                end
            end
        end
        if st.ij then
            local c=LP.Character
            if c then
                local h=c:FindFirstChildOfClass("Humanoid")
                if h and h:GetState()==Enum.HumanoidStateType.Freefall then
                    h:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end)

    R.RenderStepped:Connect(function()
        if not st.sp then return end
        local c=LP.Character
        if not c then return end
        local h=c:FindFirstChildOfClass("Humanoid")
        local r=c:FindFirstChild("HumanoidRootPart")
        if not h or not r then return end
        if h.WalkSpeed ~= st.spv then
            h.WalkSpeed = st.spv
        end
        if h.WalkSpeed < 5 then
            local md = h.MoveDirection
            if md.Magnitude > 0.01 then
                r.CFrame = r.CFrame + md * 0.5
            end
        end
    end)
end
