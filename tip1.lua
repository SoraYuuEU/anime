
local unitsToFeed = {
    "Admiral of Lava",
    "The Beast",
}

local plrControl = require(game.ReplicatedFirst.Classes.PlayerControl)

if plrControl.LocalPlayer == nil then
    plrControl.LocalPlayerLoaded.Event:Wait()
end

repeat task.wait(0.1) until game:IsLoaded()

if game.PlaceId == 17017769292 then
    local toFeed = {
"Meat",
"Alien Fruit",
"Donut of Prosperity",

}


    data = game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer()

    for i, v in data.EquippedUnits do
        for k, l in data.Units do
            if k == v then
                if not table.find(unitsToFeed, l.Type) then continue end

                for x, z in unitsToFeed do
                    if z == l.Type then
                        unitsToFeed[x] = nil
                    end
                end

                print("id found",v)
                table.insert(toFeed, v)
            end
        end
    end

    print(#toFeed,"Troops to feed")
    for i, v in toFeed do
        for k, l in game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer().Items do
            local amt = math.floor(l / #toFeed)

            print(amt,"Per troop")

            local newTable = {
                [k] = amt
            }

            game:GetService("ReplicatedStorage").Remotes.UseItem:InvokeServer(newTable, v)
        end
    end
end
