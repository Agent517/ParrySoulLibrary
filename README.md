# Parry Soul Library by Agent 7
A recreation of the Patience Soul interpretation seen in Deltatraveler, as a [Kristal](https://github.com/KristalTeam/Kristal) library.
Due to the fact that there are multiple interpretations of what the soul would do, all instances of this one are referred to as `ParrySoul` to avoid confusion.

## How to use

### Gameplay

This readme assumes default controls.

The soul moves at half speed, equivalent to holding X. Pressing Z right before getting hit will initiate a parry, granting you brief invincibility, indicated by the soul glowing.
The invincibility can be extended by parrying multiple times quickly, although there is a cap.
Missing the window will result in a short cooldown before you can parry again, indicated by the soul darkening


### Swapping Souls

Like any custom soul, you'll want to follow the process detailed at the bottom of the [Enemy Attacks wiki page](https://github.com/KristalTeam/Kristal/wiki/Enemy-Attacks#soul) on the Kristal wiki, creating a `ParrySoul` instance.
The constructor takes the arguments `x` and `y`, and nothing else.

## ParrySoul

The ParrySoul object has a few variables and functions that can be used to determine its state and change how parrying works. The variables involving timing are in frames, at 30 FPS.  They are:

`can_parry`: Whether the soul can parry. Defaults to true.<br>
`parry_window`: How large of a window you have to parry a bullet. Defaults to 5.<br>
`parry_length`: Invincibility length after a successful parry. Defaults to 30.<br>
`parry_cap`: Maximum duration for parry invincibility. Defaults to 60.<br>
`cooldown`: Cooldown period after a failed parry. Defaults to 30.

`canParry()`: Returns if the soul can parry. Depends on if parrying is enabled to begin with, if the soul is already parrying, if cooldown is active, and if the soul has damage i-frames.<br>
`isParrying()`: Returns if the soul is currently parrying. Calling this in a bullet's `onCollide()` function is a convenient way to have a bullet react to being parried.
