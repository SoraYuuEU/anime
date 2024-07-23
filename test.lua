if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.wait( math.random() )

local games = {
	[34121350] = 'https://api.luarmor.net/files/v3/loaders/1b4c42f5913d7a5b7be56ee7766eb814.lua' -- AD
}

if games[game.CreatorId] then
	if game.CreatorId == 34121350 then
		repeat
			loadstring(game:HttpGet(games[game.CreatorId]))()
			task.wait(10)
		until getgenv().buanghub ~= nil;
	else
		loadstring(game:HttpGet(games[game.CreatorId]))()
	end
end
