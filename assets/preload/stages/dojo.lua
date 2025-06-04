function onCreate()

local xx = 525;
local yy = 951;
local xx2 = 1350;
local yy2 = 791;
local ofs = 110;
local xx3 = 1030
local yy3 = 650
local followchars = true;

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-heartbroken');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');

	makeLuaSprite('bopback', 'BGs/DOJO/back', -100, -600);
	setScrollFactor('bopback', 0.8, 0.8);
        scaleObject('bopback', 2.5, 2)
	addLuaSprite('bopback', true);
    setObjectOrder('bopback', 0)

	makeLuaSprite('walls', 'BGs/DOJO/walls', -25, -900);
	setScrollFactor('walls', 0.95, 0.95);
        scaleObject('walls', 2.5, 3)
	addLuaSprite('walls', true);
    setObjectOrder('walls', 1)

	makeLuaSprite('floor', 'BGs/DOJO/floor', 0, 0);
	setScrollFactor('floor', 1, 1);
        scaleObject('floor', 2, 2)
	addLuaSprite('floor', true);
        setObjectOrder('floor', 2)

	makeLuaSprite('roof', 'BGs/DOJO/roof', 0, -850);
	setScrollFactor('roof', 1, 1);
        scaleObject('roof', 2, 2)
	addLuaSprite('roof', true);
        setObjectOrder('roof', 3)


    setScrollFactor('gfGroup', 0.9, 0.9);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 5);

	setScrollFactor('boyfriendGroup', 0.9, 0.9);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 4);

	setScrollFactor('dadGroup', 0.9, 0.9);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 6);
end