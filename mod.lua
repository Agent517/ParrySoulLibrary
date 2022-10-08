function Mod:init()
    print("Loaded "..self.info.name.."!")
    
    Utils.hook(GameOver, "update", function(orig)
        Game:clear()
        Kristal.returnToMenu()
    end)
end