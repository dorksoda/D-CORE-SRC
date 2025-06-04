local anims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}

function onCreate()
    canzoom = true;
end
    function onUpdate()
        if curBeat >= 1 and curBeat < 690 and canzoom == true then
            if mustHitSection == false then
            setProperty("defaultCamZoom", 0.6)
            doTweenColor('timeBar', 'timeBar', '5177CF', 4, 'circOut');
            doTweenColor('scoreTxt', 'scoreTxt', '5177CF', 4, 'circOut');
            else
            setProperty("defaultCamZoom", 1)
            doTweenColor('timeBar', 'timeBar', 'EF3838', 4, 'circOut');
            doTweenColor('scoreTxt', 'scoreTxt', 'EF3838', 4, 'circOut')
        end
        end
    for i = 0, 3 do
        if keyJustPressed(getKeyName(i)) then
            if not hasNoteToHit(i) then
                playAnim('boyfriend', anims[i + 1], true)
            end
        end
    end
        end

function onStepHit()
end

function getKeyName(i)
    local keys = {'left', 'down', 'up', 'right'}
    return keys[i + 1]
end

function hasNoteToHit(dir)
    local count = getProperty('notes.length')
    for i = 0, count - 1 do
        local note = 'notes[' .. i .. ']'
        if getProperty(note .. '.mustPress') and
           getProperty(note .. '.canBeHit') and
           getProperty(note .. '.noteData') == dir then
            return true
        end
    end
    return false
end
