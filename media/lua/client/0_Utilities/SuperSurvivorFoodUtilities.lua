-- TODO: add berries, mushrooms and medicinal plants
FoodsToExlude = {"Bleach", "Cigarettes", "HCCigar", "Antibiotics", "Teabag2", "Salt", "Pepper", "EggCarton"}

local FoodScores = {
    Cooked = 5,
    Fresh = 4,
    FruitsAndVegetables = 3,
    Fish = 3, --not implemented
    OpenCanned = 2,
    Canned = 1,
    Alchool = 0,
    DryGoods = -2,
    Burned = -4,
    DogFood = -5,
    Spice = -5,
    Coffee = -6,
    Raw = -8,
    Rotten = -10,
    Unknown = -15
}

function isCanOpen(thisFood)
    if not thisFood then
        return false
    end

    return string.match(thisFood:getDisplayName(), "Open")
end

function isDogFood(thisFood)
    if not thisFood then
        return false
    end

    return string.match(thisFood:getDisplayName(), "Dog Food")
end

function isCanned(thisFood)
	if not thisFood then 
        return false 
    end

    return string.match(thisFood:getType() .. thisFood:getDisplayName(), "Canned")
end


function FindAndReturnFood(thisItemContainer)
    if (not thisItemContainer) then
        return nil
    end
    local items = thisItemContainer:getItems()

    if (items ~= nil) and (items:size() > 0) then
        for i = 1, items:size() - 1 do
            local item = items:get(i)
            if (item ~= nil) and (item:getCategory() == "Food") and not (item:getPoisonPower() > 1) and
                (not has_value(FoodsToExlude, item:getType())) then
                return item
            end
        end
    end
    return nil
end

function GetFoodScore(item)
    local Score = 1.0

    if (item:getUnhappyChange() > 0) then
        Score = Score - math.floor(item:getUnhappyChange() / (item:getHungerChange() * -10.0))
    elseif (item:getUnhappyChange() < 0) then
        Score = Score + 1
    end

    if (item:getBoredomChange() > 0) then
        Score = Score - math.floor(item:getBoredomChange() / (item:getHungerChange() * -10.0) / 2.0)
    elseif (item:getBoredomChange() < 0) then
        Score = Score + 1
    end

    if (item:isFresh()) then
        Score = Score + FoodScores.Fresh
    elseif (item:IsRotten()) then
        Score = Score + FoodScores.Rotten
    end

    if (item:isAlcoholic()) then
        Score = Score + FoodScores.Alchool
    end
    if (item:isSpice()) then
        Score = Score + FoodScores.Spice
    end

    if not (item:isCooked()) then
        Score = Score + FoodScores.Raw
    end

    if (item:isbDangerousUncooked()) then
        Score = Score + FoodScores.Burned
    end

    local FoodType = item:getFoodType()
    if (FoodType == "NoExplicit") or (FoodType == nil) or (tostring(FoodType) == "nil") then

        if isCanned(item) and isCanOpen(item) then
            Score = Score + FoodScores.OpenCanned
        elseif isCanned(item) then
            Score = Score + FoodScores.Canned
        elseif isDogFood(item) then
            Score = Score + FoodScores.DogFood
        elseif (item:getHungerChange()) == nil or (item:getHungerChange() == 0) then
            Score = Score + FoodScores.Unknown
        end 
        if (item:isCooked()) then
            Score = Score + FoodScores.Cooked
        end
    elseif (FoodType == "Fruits") or (FoodType == "Vegetables") then
        Score = Score + FoodScores.FruitsAndVegetables
    elseif (FoodType == "Pasta") or (FoodType == "Rice") then
        Score = Score + FoodScores.DryGoods
    elseif ((FoodType == "Egg") or (FoodType == "Meat")) or item:isIsCookable() then
        if (item:isCooked()) then
            Score = Score + 2
        end
    elseif (FoodType == "Coffee") then
        Score = Score + FoodScores.Coffee
    else
        Score = Score + FoodScores.Unknown
        print("Unknown food type " .. FoodType)
    end

    return Score
end

function FindAndReturnBestFoodOnFloor(sq, survivor)
    if (not sq) then
        return nil
    end
    local BestFood = nil
    local BestScore = 1

    if (survivor == nil) or (survivor:isStarving()) then
        -- if starving, willing to eat anything
        BestScore = -999
    elseif (survivor:isVHungry()) then
        -- not too picky, eat stale food
        BestScore = -10
    end

    items = sq:getWorldObjects()
    -- print("Checking " .. tostring(items:size()) .. " world objects.")
    for j = 0, items:size() - 1 do
        if (items:get(j):getItem()) then
            local item = items:get(j):getItem()
            if (item ~= nil) and (item:getCategory() == "Food") and not (item:getPoisonPower() > 1) and
                (not has_value(FoodsToExlude, item:getType())) then
                local Score = GetFoodScore(item)

                -- ContainerItemsScore[i] = Score
                -- print("BestFood Floor " .. item:getDisplayName() .. ": " .. tostring(Score))
                if Score > BestScore then
                    BestFood = item
                    BestScore = Score
                end
            end
        end
    end
    return BestFood
end

function FindAndReturnBestFood(thisItemContainer, survivor)
    if (not thisItemContainer) then
        return nil
    end
    local items = thisItemContainer:getItems()
    local ID = -1
    local BestFood = nil
    -- local ContainerItemsScore = {}
    local BestScore = 1

    if (survivor == nil) or (survivor:isStarving()) then
        -- if starving, willing to eat anything
        BestScore = -999
    elseif (survivor:isVHungry()) then
        -- not too picky, eat stale food
        BestScore = -10
    end

    if (items ~= nil) and (items:size() > 0) then
        for i = 1, items:size() - 1 do
            local item = items:get(i)
            if (item ~= nil) and (item:getCategory() == "Food") and 
                not (item:getPoisonPower() > 1) and (not has_value(FoodsToExlude, item:getType())) then
                local Score = GetFoodScore(item)
                if Score > BestScore then
                    BestFood = item
                    BestScore = Score
                end
            end
        end
    end

    return BestFood
end

function FindAndReturnWater(thisItemContainer) -- exlude bleach
    if (not thisItemContainer) then
        return nil
    end
    local items = thisItemContainer:getItems()

    if (items ~= nil) and (items:size() > 0) then
        for i = 1, items:size() - 1 do
            local item = items:get(i)
            if (item ~= nil) and isItemWater(item) then
                return item
            end
        end
    end
    return nil
end
