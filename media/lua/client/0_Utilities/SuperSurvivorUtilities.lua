Orders = {
    "Barricade", 
    "Chop Wood", 
    "Clean Up Inventory", 
    "Doctor", 
    "Explore", 
    "Follow", 
    "Farming", 
    "Forage",
    "Gather Wood", 
    "Go Find Food", 
    "Go Find Water", 
    "Go Find Weapon", 
    "Guard", 
    "Hold Still", 
    "Lock Doors", 
    "Unlock Doors", 
    "Loot Room", 
    "Patrol", 
    "Stand Ground", 
    "Stop", 
    "Dismiss", 
    "Relax", 
    "Return To Base", 
    "Pile Corpses"
};

function getPresetColor(Color)

    if Color == "White" then
        return ImmutableColor.new(0.75, 0.74, 0.72)
    elseif Color == "Grey" then
        return mmutableColor.new(0.48, 0.47, 0.44)
    elseif Color == "Blond" then
        return ImmutableColor.new(0.82, 0.82, 0.39)
    elseif Color == "Sand" then
        return ImmutableColor.new(0.86, 0.78, 0.66)
    elseif Color == "Hazel" then
        return ImmutableColor.new(0.61, 0.50, 0.34)
    elseif Color == "Brown" then
        return ImmutableColor.new(0.62, 0.42, 0.17)
    elseif Color == "Red" then
        return ImmutableColor.new(0.58, 0.25, 0.25)
    elseif Color == "Pink" then
        return ImmutableColor.new(0.59, 0.39, 0.55)
    elseif Color == "Purple" then
        return ImmutableColor.new(0.47, 0.43, 0.59)
    elseif Color == "Blue" then
        return ImmutableColor.new(0.39, 0.47, 0.59)
    elseif Color == "Black" then
        return ImmutableColor.new(0.10, 0.08, 0.09)
    else
        return ImmutableColor.new(0.99, 0.99, 0.99)
    end

end

function getCoordsFromID(id)

    for k, v in pairs(SurvivorMap) do

        for i = 1, #v do
            -- print(tostring(k)..","..tostring(v[i]))
            if (v[i] == id) then
                return k
            end
        end

    end

    return 0

end

function getSpeech(key)
    if (not SurvivorSpeechTable[key]) then
        return "?"
    end
    local result = ZombRand(1, #SurvivorSpeechTable[key]);
    return tostring(SurvivorSpeechTable[key][result]);
end

function getAmmoBox(bullets)
    if (isModEnabled("ORGM")) then
        return bullets .. "_Box"
    end

    if (bullets == "BB177") then
        return "BB177Box"
    elseif (bullets == "Bullets22") then
        return "Bullets22Box"
    elseif (bullets == "Bullets57") then
        return "Bullets57Box"
    elseif (bullets == "Bullets380") then
        return "Bullets380Box"
    elseif (bullets == "Bullets9mm") then
        return "Bullets9mmBox"
    elseif (bullets == "Bullets38") then
        return "Bullets38Box"
    elseif (bullets == "Bullets357") then
        return "Bullets357Box"
    elseif (bullets == "Bullets45") then
        return "Bullets45Box"
    elseif (bullets == "Bullets45LC") then
        return "Bullets45LCBox"
    elseif (bullets == "Bullets44") then
        return "Bullets44Box"
    elseif (bullets == "Bullets4570") then
        return "Bullets4570Box"

    elseif (bullets == "410gShotgunShells") then
        return "410gShotgunShellsBox"
    elseif (bullets == "20gShotgunShells") then
        return "20gShotgunShellsBox"
    elseif (bullets == "ShotgunShells") then
        return "ShotgunShellsBox"
    elseif (bullets == "10gShotgunShells") then
        return "10gShotgunShellsBox"
    elseif (bullets == "4gShotgunShells") then
        return "4gShotgunShellsBox"

    elseif (bullets == "223Bullets") then
        return "223Box"
    elseif (bullets == "556Bullets") then
        return "556Box"
    elseif (bullets == "762x39Bullets") then
        return "762x39Box"
    elseif (bullets == "308Bullets") then
        return "308Box"
    elseif (bullets == "762x51Bullets") then
        return "762x51Box"
    elseif (bullets == "762x54rBullets") then
        return "762x54rBox"
    elseif (bullets == "3006Bullets") then
        return "3006Box"
    elseif (bullets == "50BMGBullets") then
        return "50BMGBox"

    elseif (bullets == "Nails") then
        return "NailsBox" -- For Nailgun Mod
    end

    print("no ammo box found for bullets " .. tostring(bullets))
    return ""
end

function getBoxCount(box)
    if (box == "BB177Box") then
        return 500
    elseif (box == "Bullets22Box") then
        return 100
    elseif (box == "Bullets57Box") then
        return 50
    elseif (box == "Bullets380Box") then
        return 50
    elseif (box == "Bullets9mmBox") then
        return 50
    elseif (box == "Bullets38Box") then
        return 50
    elseif (box == "Bullets357Box") then
        return 50
    elseif (box == "Bullets45Box") then
        return 50
    elseif (box == "Bullets45LCBox") then
        return 50
    elseif (box == "Bullets44Box") then
        return 50
    elseif (box == "Bullets4570Box") then
        return 20

    elseif (box == "410gShotgunShellsBox") then
        return 25
    elseif (box == "20gShotgunShellsBox") then
        return 25
    elseif (box == "ShotgunShellsBox") then
        return 25
    elseif (box == "10gShotgunShellsBox") then
        return 25
    elseif (box == "4gShotgunShellsBox") then
        return 10

    elseif (box == "223Box") then
        return 20
    elseif (box == "556Box") then
        return 20
    elseif (box == "762x39Box") then
        return 20
    elseif (box == "308Box") then
        return 20
    elseif (box == "762x51Box") then
        return 20
    elseif (box == "762x54rBox") then
        return 20
    elseif (box == "3006Box") then
        return 20
    elseif (box == "50BMGBox") then
        return 10
    elseif (box == "NailsBox") then
        return 100 -- For Nailgun Mod

    elseif (isModEnabled("ORGM")) then
        return 50

    else
        return 0
    end
end

SuperSurvivorsAmmoBoxes = { -- for the loot stores that are spawned with preset spawns.
"Base.223Box", "Base.308Box", "Base.Bullets9mm", "Base.Bullets9mm", "Base.Bullets9mm", "Base.ShotgunShellsBox",
"Base.ShotgunShellsBox", "Base.ShotgunShellsBox"}

SurvivorPerks = {"Aiming", "Axe", "Combat", "SmallBlade", "LongBlade", "SmallBlunt", "Blunt", "Maintenance", "Spear",
                 "Doctor", "Farming", "Firearm", "Reloading", "Fitness", "Lightfoot", -- "Melee",
"Nimble", "PlantScavenging", "Reloading", "Sneak", "Strength", "Survivalist"}

function getAPerk()
    local result = ZombRand(size(SurvivorPerks) - 1) + 1;
    return SurvivorPerks[result];
end

function has_value(tab, val)
    if (tab ~= nil) and (val ~= nil) then
        -- for index, value in ipairs (tab) do
        for k = 1, #tab do
            local value = tab[k]
            if value == val then
                return true
            end
        end
    end
    return false
end

function SurvivorTogglePVP()

    if (IsoPlayer.getCoopPVP() == true) then
        getSpecificPlayer(0):Say("PVP Disabled");
        IsoPlayer.setCoopPVP(false);
        getSpecificPlayer(0):getModData().PVP = false;
        PVPDefault = false;
        PVPButton:setImage(PVPTextureOff)
    elseif (IsoPlayer.getCoopPVP() == false) then

        IsoPlayer.setCoopPVP(true);
        if (ForcePVPOn ~= true) then
            getSpecificPlayer(0):getModData().PVP = true;
            PVPDefault = true;
            getSpecificPlayer(0):Say("PVP Enabled");
        else
            getSpecificPlayer(0):Say("PVP Forced On");
        end
        ForcePVPOn = false;
        PVPButton:setImage(PVPTextureOn)
    end
end

function getAmmoType(weapon, incModule)

    if (weapon == nil) or (weapon.getAmmoType == nil) then
        return nil
    end
    local out = '';
    local modulename = 'Base';
    local wepType = weapon:getType();

    out = weapon:getAmmoType()

    if (out == nil) then
        local s = weapon:getMagazineType();
        i, j = string.find(s, "Clip")
        out = s:sub(i)
    end

    if (out == nil) then
        print("no bullets found for weapon: " .. wepType)
        return nil
    end

    out = out:sub(6)
    --[[
	print("weapong type: "..wepType);
	local wepdata = ReloadUtil:getWeaponData(wepType);
	if(not wepdata or not wepdata.ammoType) then
		--if(wepdata) then print("no weapon data for:"..tostring(weapon:getType()) .. "["..tostring(wepdata.ammoType).."]");
		--else print("no weapon data for:"..tostring(weapon:getType())); end
		return nil
	end
	local clipdata = ReloadUtil:getClipData(wepdata.ammoType);

	if(clipdata) then
		if(clipdata.ammoType) then
			--print("ifif"..tostring(clipdata.ammoType));
			out = tostring(clipdata.ammoType);
			modulename = clipdata.moduleName;
		else
			--print("if-else"..tostring(wepdata.ammoType));
			out = tostring(wepdata.ammoType);
			modulename = wepdata.moduleName;
		end
	elseif(wepdata.ammoType) then
		--print("else"..tostring(wepdata.ammoType));
		out = tostring(wepdata.ammoType);
		modulename = wepdata.moduleName;
	else
		--print("else?");
	end
	--]]

    -- if(incModule) then out = modulename .. "." .. out; end
    return out;

end

function getAmmoBullets(weapon, incModule)

    if (weapon == nil) then
        return nil
    end

    if (instanceof(weapon, "HandWeapon")) and (weapon:isAimedFirearm()) then
        local bullets = {}

        if (isModEnabled("ORGM")) then
            local ammoTbl = ORGM.AlternateAmmoTable[getAmmoType(weapon, false)]
            if (ammoTbl) then
                -- for _, name in ipairs(ammoTbl) do
                for k = 1, #ammoTbl do
                    local name = ammoTbl[k]
                    if (incModule) then
                        table.insert(bullets, "ORGM." .. name)
                    else
                        table.insert(bullets, name)
                    end
                end
            end

            return bullets
        end

        if (incModule) then
            table.insert(bullets, getAmmoType(weapon, incModule))
        else
            table.insert(bullets, getAmmoType(weapon, incModule))
        end

        return bullets;
    end

    return nil
end

function makeToolTip(option, name, desc)
    local toolTip = ISToolTip:new();
    toolTip:initialise();
    toolTip:setVisible(false);
    -- add it to our current option
    option.toolTip = toolTip;
    toolTip:setName(name);
    toolTip.description = desc .. " <LINE> ";
    -- toolTip:setTexture("crafted_01_16");

    -- toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> More Desc" ;
    -- option.notAvailable = true;
    return toolTip;
end

function getMouseSquare()
    local sw = (128 / getCore():getZoom(0));
    local sh = (64 / getCore():getZoom(0));

    local mapx = getSpecificPlayer(0):getX();
    local mapy = getSpecificPlayer(0):getY();
    local mousex = ((getMouseX() - (getCore():getScreenWidth() / 2)));
    local mousey = ((getMouseY() - (getCore():getScreenHeight() / 2)));

    local sx = mapx + (mousex / (sw / 2) + mousey / (sh / 2)) / 2;
    local sy = mapy + (mousey / (sh / 2) - (mousex / (sw / 2))) / 2;

    local sq = getCell():getGridSquare(sx, sy, getSpecificPlayer(0):getZ());
    return sq;
end

function getMouseSquareY()
    local sw = (128 / getCore():getZoom(0));
    local sh = (64 / getCore():getZoom(0));

    local mapx = getSpecificPlayer(0):getX();
    local mapy = getSpecificPlayer(0):getY();
    local mousex = ((getMouseX() - (getCore():getScreenWidth() / 2)));
    local mousey = ((getMouseY() - (getCore():getScreenHeight() / 2)));

    local sy = mapy + (mousey / (sh / 2) - (mousex / (sw / 2))) / 2;

    return sy
end

function getMouseSquareX()
    local sw = (128 / getCore():getZoom(0));
    local sh = (64 / getCore():getZoom(0));

    local mapx = getSpecificPlayer(0):getX();
    local mapy = getSpecificPlayer(0):getY();
    local mousex = ((getMouseX() - (getCore():getScreenWidth() / 2)));
    local mousey = ((getMouseY() - (getCore():getScreenHeight() / 2)));

    local sx = mapx + (mousex / (sw / 2) + mousey / (sh / 2)) / 2;

    return sx
end

function AbsoluteValue(value)
    if (value >= 0) then
        return value;
    else
        return (value * -1);
    end
end

function size(a)
    local i = 1
    while a[i] do
        i = i + 1
    end
    return i;
end

function MyFindAndReturnCategory(thisItemContainer, thisCategory, survivor)

    if (thisCategory == "Food") then
        return FindAndReturnBestFood(thisItemContainer, survivor)
    elseif (thisCategory == "Water") then
        return FindAndReturnWater(thisItemContainer)
    elseif (thisCategory == "Weapon") then
        return FindAndReturnWeapon(thisItemContainer)
    else
        return thisItemContainer:FindAndReturnCategory(thisCategory)
    end

end

function FindAndReturnWeapon(thisItemContainer) -- exlude crap weapons
    if (not thisItemContainer) then
        return nil
    end
    local items = thisItemContainer:getItems()

    if (items ~= nil) and (items:size() > 0) then
        for i = 1, items:size() - 1 do
            local item = items:get(i)
            if (item ~= nil) and (item:getCategory() == "Weapon") and (item:getMaxDamage() > 0.1) then
                -- print("FindAndReturnWeapon " .. item:getDisplayName() .. " - " .. tostring(item:getMaxDamage()))
                return item
            end
        end
    end
    return nil
end

function FindAndReturnBestWeapon(thisItemContainer) -- exlude crap weapons
    if (not thisItemContainer) then
        return nil
    end
    local items = thisItemContainer:getItems()
    local bestItem = nil

    if (items ~= nil) and (items:size() > 0) then
        for i = 1, items:size() - 1 do
            local item = items:get(i)
            if (item ~= nil) and (item:getCategory() == "Weapon") and (item:getMaxDamage() > 0.1) and
                (bestItem == nil or bestItem:getMaxDamage() < item:getMaxDamage()) then
                bestItem = item
            end
        end
    end
    if (bestItem ~= nil) then
        -- print("FindAndReturnBestWeapon " .. tostring(bestItem:getDisplayName()) .. " - " .. tostring(bestItem:getMaxDamage()))
    end
    return bestItem
end

function myIsCategory(item, category)

    if (category == "Water") and (isItemWater(item)) then
        return true
    elseif (category == "Weapon") and (item:getCategory() == category) and (item:getMaxDamage() > 0.1) then
        return true
    else
        return (item:getCategory() == category)
    end

end

function table.randFrom(t)
    local keys = {}
    for key, value in pairs(t) do
        keys[#keys + 1] = key -- Store keys in another table
    end
    local key = ZombRand(1, #keys)
    index = keys[key]
    -- return t[index]
    return index
end

function print_r(t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            print(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    elseif (type(val) == "string") then
                        print(indent .. "[" .. pos .. '] => "' .. val .. '"')
                    else
                        print(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                print(indent .. tostring(t))
            end
        end
    end
    if (type(t) == "table") then
        print(tostring(t) .. " {")
        sub_print_r(t, "  ")
        print("}")
    else
        sub_print_r(t, "  ")
    end
    print()
end
