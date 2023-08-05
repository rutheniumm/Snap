local RRagdoll, UUnragdoll = loadstring(game:GetService("HttpService"):GetAsync("https://rentry.co/hh5g2/raw"))(); local LightningBolt = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/rutheniumm/Snap/main/Lightning2.lua"))()
local GHFP = function(P)
	if P:FindFirstAncestorOfClass("Model") then
		if P:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") then
			local H = P:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")
			return H
		end
	end
end
Ragdoll = function(H) if H:GetAttribute("Ragdolled") then return end H:SetAttribute("Ragdolled", true) RRagdoll(H) end; Unragdoll = function(H) if H:GetAttribute("Ragdolled") then else return end H:SetAttribute("Ragdolled", false) UUnragdoll(H) end
local Snap = Instance.new("Tool"); Snap.Parent = owner.Backpack; Snap.Name = "Snap"; Snap.TextureId = `rbxassetid://7805822660`; Snap.ToolTip = "Snap"; FX = Instance.new("Sound"); FX.Parent = owner.Character["Right Arm"]; FX.SoundId = `rbxassetid://9114427348`; local R = Instance.new("RemoteFunction", owner.Backpack); R.Name = "S"; local FH = Instance.new("Part") FH.Parent = Snap; FH.Name = "Handle"; FH.CanCollide = false; FH.CanTouch = false; FH.Transparency = 1; FH.Size = Vector3.new(1,1,0); local HD=Instance.new("Decal",FH) HD.Color3 = owner.Character.Torso.Color ; HD.Face = Enum.NormalId.Front; HD.Texture = `rbxassetid://14013378040` CollectionService = game:GetService("CollectionService"); CollectionService:AddTag(Snap, "SnapTool"); if not game:GetService("PhysicsService"):IsCollisionGroupRegistered("NoCollision") then game:GetService("PhysicsService"):RegisterCollisionGroup("NoCollision"); game:GetService("PhysicsService"):CollisionGroupSetCollidable("NoCollision", "Default", false) end; 
local Methods = {
	["Poop"] = function(P) P.Color = Color3.fromHex"#875623" end,
	["Destroy"] = function(P) P:Destroy() end, 
	["Fling"] = function(P) local T = Instance.new("BodyThrust", P); T.Location = P.Position; T.Force = Vector3.one * 200 end, 
	["Acid"] = function(P) end, 
	["Fire"] = function(P) CollectionService:AddTag(P, "OnFire%") end,
	["Shrink"] = function(P) P.Size = P.Size * 0.5 end,
	["Deshrink"] = function(P) P.Size = P.Size * 1.5; end, 
	["Break"] = function(P) P:BreakJoints() end,
	["Clone"] = function(P) pcall(function() P:Clone().Parent = P.Parent end) end,
	["Thaw"] = function(P) if CollectionService:HasTag(P, "OnFire%") then CollectionService:RemoveTag(P, "OnFire%") end end,
	["Anchor"] = function(P) P.Anchored = true end,
	["NetworkOwnership"] = function(P) if P:CanSetNetworkOwnership() then P:SetNetworkOwner(owner) end end,
	["Unanchor"] = function(P) P.Anchored = false end,
	["NoCollision"] = function(P) if P.CollisionGroup ~= "NoCollision" then P:SetAttribute("O_CG", P.CollisionGroup) end; P.CollisionGroup = "NoCollision" end,
	["FixCollision"] = function(P) if P:GetAttribute("O_CG") then P.CollisionGroup = P:GetAttribute("O_CG") end end,
	["Vapourize"] = function(P) end,
	["StruckByLightning"] = function(P, PP, N)
		local A0 = Instance.new("Attachment", FH)
		local A1 = Instance.new("Attachment", P);
		local A2 = Instance.new("Attachment", workspace.Terrain)
		A2.WorldCFrame = FH.CFrame
		A1.WorldCFrame = CFrame.fromMatrix(PP, -Vector3.xAxis:Cross(N), N, Vector3.zAxis)
		local BoltSound = Instance.new("Sound", A2)
		BoltSound.RollOffMode = Enum.RollOffMode.LinearSquare;
		BoltSound.Volume = 2;
		BoltSound.TimePosition = Random.new():NextNumber(0, 34)
		BoltSound.SoundId = `rbxassetid://9114234827`
		BoltSound.Looped = true;
		BoltSound:Play()
		local Time = (FH.Position - PP).Magnitude/50
		local NewBolt = LightningBolt.new(A0, A1, math.random(7, 15), function(NextPoint)
			A2.Visible = true
			A2.WorldCFrame = NextPoint.CFrame;
		end)
		NewBolt.CurveSize0, NewBolt.CurveSize1 = 2, 2
		NewBolt.PulseLength = 0.5
		NewBolt.FadeLength = 0.25
		NewBolt.PulseSpeed = 100/(FH.Position - PP).Magnitude
		NewBolt.MaxRadius = 1
		NewBolt.Color = Color3.new(Random.new():NextNumber(0, 1), Random.new():NextNumber(0, 1), Random.new():NextNumber(0, 1)):Lerp(Color3.new(Random.new():NextInteger(0, 1), Random.new():NextInteger(0, 1), Random.new():NextInteger(0, 1)), Random.new():NextNumber(0, 1))
		game:GetService("TweenService"):Create(BoltSound, TweenInfo.new(Time, Enum.EasingStyle.Exponential), {Volume = 0}):Play()
		pcall(function() A0:Destroy(); A1:Destroy(); BoltSound:Destroy() end);
		
	end,
	["Explode"] = function(P) local Explosion = Instance.new("Explosion", script); Explosion.Position = P.Position; task.wait(3); Explosion:Destroy() end,
	["Screenshot"] = function(P, PO, N) local C = Instance.new("Part", script); game:GetService("Chat"):Chat(C, `bro part {P.Name} got caught laucking!`, Enum.ChatColor.White); C.Size = Vector3.new(145.892, 93.093, 82.167)*0.003; local M = Instance.new("SpecialMesh", C); M.Scale = Vector3.one*0.01 M.MeshId = `rbxassetid://515752158` M.TextureId = `rbxassetid://515752160`; C.CanCollide = false; C.Anchored = true; C.CFrame = CFrame.new(owner.Character.Head.CFrame:ToWorldSpace(CFrame.new(0, -0.5, -3)).Position:Lerp(PO, 0.85), P.Position); local FXS = Instance.new("Sound", C) FXS.SoundId = `rbxassetid://8550763922` FXS.PlayOnRemove = true; FXS:Destroy() task.wait(0.5) C.CanCollide = true; C.Anchored = false game:GetService("Debris"):AddItem(C, 5)  end,
	["NeckSnap"] = function(P)
		local H = GHFP(P);
		if H then else return end
		if H.Parent:FindFirstChild("Neck", true) then
			if H.Parent:FindFirstChild("Neck", true):GetAttribute("Snapped") then
				return
			end
		else return end
		H.Parent:FindFirstChild("Neck", true):SetAttribute("Snapped", true);
		P:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false;
		H.Parent:FindFirstChild("Neck", true).C0=H.Parent:FindFirstChild("Neck", true).C0*CFrame.Angles(math.rad(P:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").RigType==Enum.HumanoidRigType.R6 and -90 or 90), 0, 0);
		H.Health = H.Health - H.MaxHealth
		local NeckSnapSound = Instance.new("Sound"); NeckSnapSound.Parent = H.Parent.Head; NeckSnapSound.Pitch = 2.3; NeckSnapSound.SoundId = `rbxassetid://4086190876`; NeckSnapSound.Volume = 6; NeckSnapSound.RollOffMode = Enum.RollOffMode.InverseTapered; NeckSnapSound:Play(); NeckSnapSound.RollOffMaxDistance = 140;
		NeckSnapSound.Ended:Once(function()NeckSnapSound:Destroy()end)

	end,
	["HeadDestroy"] = function(P)
		local H = GHFP(P);
		if H then else return end
		H.Parent:SetAttribute("HeadDestroyed", true);
		P:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false;
		pcall(function()
			Ragdoll(H)
			local HeadCF = H.Parent.Head.CFrame;
			H.Parent.Head:Destroy();
			task.spawn(function()
				for i = 1, 18 do 
					local gore = Instance.new("Part", script); gore.CFrame = HeadCF; gore.Color = Color3.new(0.7, 0, 0); gore.Size = Vector3.one*0.2; gore:SetNetworkOwner(owner); gore.AssemblyLinearVelocity = Random.new():NextUnitVector()*15; gore.Material = Enum.Material.Mud; task.delay(6, game.Destroy, gore)
					task.wait()
				end
			end)
			H.Parent:FindFirstChild("HumanoidRootPart"):SetNetworkOwner(owner)
			H.Parent:FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity=(Random.new():NextUnitVector()*90)
			H.Parent:FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity=(Random.new():NextUnitVector()*125)
			local ExplodeHead = Instance.new("Sound"); ExplodeHead.Parent = H.Parent:WaitForChild("HumanoidRootPart"); ExplodeHead.SoundId = `rbxassetid://6148096445`; ExplodeHead.Volume = 6; ExplodeHead.RollOffMode = Enum.RollOffMode.InverseTapered; ExplodeHead:Play(); ExplodeHead.RollOffMaxDistance = 140;
		end)
		H.Health = H.Health - H.MaxHealth
	end,
	["Ragdoll"] = function(P)
		local H = GHFP(P);
		if H then else return end
		Ragdoll(H)
	end,
	["Unragdoll"] = function(P)
		local H = GHFP(P);
		if H then else return end
		UUnragdoll(H)
	end,
}
local Storage = {ObjectItems = {},TimeScale = 1};
CollectionService:GetInstanceAddedSignal("OnFire%"):Connect(function(Object)
	if Object:IsA("BasePart") then
		local FireParticle = Instance.new("Fire"); FireParticle.Parent = Object; FireParticle.Heat = Object.Size.Magnitude; FireParticle.Size = Object.Size.Magnitude; FireParticle.TimeScale = Storage.TimeScale or 1;
		Storage.ObjectItems[Object] = {}
		local FireSound = Instance.new("Sound"); FireSound.Parent = Object; FireSound.SoundId = `rbxassetid://7106658953`; FireSound.Looped = true; FireSound.Volume = 1.05; FireSound.RollOffMode = Enum.RollOffMode.InverseTapered; FireSound:Play(); FireSound.RollOffMaxDistance = 60;
		table.insert(Storage.ObjectItems[Object], FireParticle); 	table.insert(Storage.ObjectItems[Object], FireSound);
		table.insert(Storage.ObjectItems[Object], task.spawn(function()
			local TimePassed = 0
			while task.wait(0.5/(Storage.TimeScale or 1)) do
				if typeof(Object) ~= "Instance" or (typeof(Object) == "Instance" and not (Object:IsA"BasePart")) or Object == nil then
					break
				end
				TimePassed = TimePassed + 0.5;
				if TimePassed > 10 and TimePassed < 30 then
				elseif TimePassed >= 30 then
					Object:BreakJoints();
					CollectionService:RemoveTag(Object, "OnFire%")
					local Burnify = Instance.new("Sound"); Burnify.Parent = Object; Burnify.PlayOnRemove = true; Burnify.SoundId = `rbxassetid://3755119951`; Burnify:Destroy();
					Object.Material = Enum.Material.Slate;
					if Object.Anchored then Object.Anchored = false end
					break
				end
				Object.Color = Object.Color:Lerp(Color3.new(0, 0, 0), 0.05);
			end
		end));
	end
end)
CollectionService:GetInstanceRemovedSignal("OnFire%"):Connect(function(Object)
	if Object:IsA("BasePart") then
		if Storage.ObjectItems[Object] then
			for i, v in pairs(Storage.ObjectItems[Object]) do 
				if typeof(v) == "Instance" then
					v:Destroy();
				elseif typeof(v) == "thread" then
					pcall(task.cancel, v);
				end
			end
			Storage.ObjectItems[Object] = nil;
		end
	end
end)
function R.OnServerInvoke(Player, Request, Hit, Method) if Player ~= owner then return end local Params = RaycastParams.new(); Params.FilterType = Enum.RaycastFilterType.Exclude; Params.FilterDescendantsInstances = {owner.Character, script, workspace.Base};
	if Request == "Snap" then local RaycastResult = workspace:Raycast(owner.Character["HumanoidRootPart"].Position, (Hit.Position - owner.Character["HumanoidRootPart"].Position).Unit * 10000000, Params); if RaycastResult then FX:Play() if Methods[Method] then Methods[Method](RaycastResult.Instance, RaycastResult.Position, RaycastResult.Normal) end; local SFM = Instance.new("StringValue"); SFM.Name = "toolanim"; SFM.Value = "Slash" SFM.Parent = Snap end elseif Request == "GetMethods" then local FM = {} for i, v in pairs(Methods) do table.insert(FM, i) end return FM end
end
NLS([[local CurrentMethod = 1; local R = owner.Backpack:WaitForChild("S", 100) ; local Methods = R:InvokeServer("GetMethods") local Snap = game:GetService("CollectionService"):GetTagged("SnapTool")[1] Snap.Activated:Connect(function() R:InvokeServer("Snap", owner:GetMouse().Hit, Methods[CurrentMethod]) end);
local UIS = game:GetService("UserInputService")
local CountMethod = 1
local GUI = Instance.new("ScreenGui", owner.PlayerGui);
GUI.Name = "SnapGUI";
local SFrame = Instance.new("ScrollingFrame", GUI)
SFrame.Size = UDim2.fromScale(0.2, 0.5)
SFrame.Position = UDim2.fromScale(0.785, 0, 0.25, 0)
SFrame.BorderSizePixel = 0;
SFrame.BackgroundColor3 = Color3.new(0.7, 0.7, 0.7);
SFrame.Name = "SnapList";
local List = Instance.new("UIListLayout", SFrame)
List.Padding = UDim.new(0, 5);
for i, v in pairs(Methods) do 
local MethodButton = Instance.new("TextButton", SFrame);
MethodButton.Text = v;
MethodButton.TextScaled = true;
MethodButton.TextStrokeTransparency = 0;
MethodButton.TextColor3 = Color3.new(1, 1, 1)
MethodButton.Size = UDim2.fromScale(1, 0.015);
MethodButton.BorderSizePixel = 0;
MethodButton.MouseButton1Down:Connect(function()
CurrentMethod = i
end)
end
UIS.InputBegan:Connect(function(InputObject, GameProcessed) if GameProcessed then return end if Snap.Parent ~= owner.Character then return end; if InputObject.KeyCode == Enum.KeyCode.E then R:InvokeServer("UpdateMethod"); CurrentMethod = math.clamp((CurrentMethod - CountMethod) % (#Methods + 1), 1, #Methods) end  if InputObject.KeyCode == Enum.KeyCode.Q then R:InvokeServer("UpdateMethod"); CurrentMethod = math.clamp((CurrentMethod + CountMethod) % (#Methods + 1), 1, #Methods) game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Snap Mode", Text = string.format("Snap mode set to %s", Methods[CurrentMethod])}) end end)
]])
print("Press Q to go through the different abilities.")

