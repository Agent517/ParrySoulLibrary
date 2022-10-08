local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super:init(self, x, y, "bullets/smallbullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.damage = 1
    
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super:update(self)
end

function SmallBullet:onCollide(soul)

    if soul:isParrying() then
        if self.attacker.mercy >= 90 then
            self.attacker:addMercy(100)
            self.attacker.text = {"* The dummy is satisfied with your skills."}
        else
            self.attacker:addMercy(10)
        end
    end

    -- Default behavior        
    if soul.inv_timer == 0 then
        self:onDamage(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end
return SmallBullet