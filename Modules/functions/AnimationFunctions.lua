local AnimationFunctions = { 
	AnimationList = {}
}

local Players = getgenv().Services and getgenv().Services.Players or game:GetService("Players")

local function GetCharacter(Player)
	local Character = nil

	if (Players:FindFirstChild(Player)) then
		if (Players:FindFirstChild(Player).Character) then
			Character = Players:FindFirstChild(Player).Character
		end
	end

	return Character
end

function AnimationFunctions:PlayingTracksConnection(TargetCharacter)
	if (not TargetCharacter) then
		return
	end

	local Character = GetCharacter(TargetCharacter)
	if (not Character) then
		return
	end

	local Humanoid = Character:FindFirstChild("Humanoid")
	if (not Humanoid) then
		return
	end

	if (not self.AnimationList[Character.Name]) then
		self.AnimationList[Character.Name] = {
			Animations = {};
			AnimationPlayed = Instance.new("BindableEvent");
		}
	end

	for _,Track in pairs(Humanoid:GetPlayingAnimationTracks()) do
		if (not self.AnimationList[Character.Name].Animations[Track.Animation.AnimationId]) then
			local AnimationId = tonumber(Track.Animation.AnimationId:match("%d+"))
			local AnimationName = Track.Animation.Name
			
			self.AnimationList[Character.Name].Animations[Track.Animation.AnimationId] =  AnimationId
			self.AnimationList[Character.Name].AnimationPlayed:Fire(AnimationName, AnimationId)
		end
	end
end

return AnimationFunctions
