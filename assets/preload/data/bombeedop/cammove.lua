local xx = 1225;
local yy = 51;
local xx2 = 2250;
local yy2 = 251;
local ofs = 130;
local xx3 = 2250;
local yy3 = 251;
local followchars = true;

function onUpdate(elapsed)
	if mustHitSection == false then
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
        end
        if getProperty('gf.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx3,yy3)
        end
    else
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'dodge3' then
            triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'dodge2' then
            triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'dodge1' then
            triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
        end
		if getProperty('boyfriend.animation.curAnim.name') == 'box1' then
            triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
        end
		if getProperty('boyfriend.animation.curAnim.name') == 'box2' then
            triggerEvent('Camera Follow Pos',xx3-ofs*1.2,yy3)
        end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx3,yy3)
        end
		end
	end