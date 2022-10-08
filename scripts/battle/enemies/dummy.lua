local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super:init(self)

    -- Enemy name
    self.name = "Dummy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 4
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        --"movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        --"..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DF 0\n* Cotton heart and button eye\n* Looks just like a fluffy guy."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The dummy gives you a soft\nsmile.",
        "* The power of fluffy boys is\nin the air.",
        "* Smells like cardboard.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The dummy looks like it's\nabout to fall over."

    
end

function Dummy:onAct(battler, name)

    if name == "Check" then
        return {
            "DUMMY - AT 4 DF 0\n* Cotton heart and button eye\n* Looks just like a fluffy guy.",
            "* Today, it wants to help you\npractice [color:#00ffff]PARRYING[color:reset].",
            "* When your SOUL is [color:#00ffff]CYAN[color:reset],[wait:5]\nPress [color:yellow]" .. Input.getText("confirm") .. "[color:reset] before getting hit\nto parry!"
        }
    end
    
    return super:onAct(self, battler, name)
end

return Dummy