local Dummy, super = Class(Encounter)

function Dummy:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = ("* Testing start!")

    -- Battle music ("battle" is rude buster)
    self.music = "battle_vapor"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("dummy", 550, 220)

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
end

function Dummy:createSoul(x, y)
    return ParrySoul(x, y)
end

return Dummy