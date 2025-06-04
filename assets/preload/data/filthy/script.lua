local angleshit = 1;
local anglevar = 1;
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
        end

function onStepHit()
if curStep == 1 then
doTweenAngle('tuin', 'camGame', -10, 3.5, 'linear')
doTweenAngle('tuout', 'camHUD', -10, 3.5, 'linear')
end
if curStep == 32 then
doTweenAngle('tuin', 'camGame', 15, 3.5, 'linear')
doTweenAngle('tuout', 'camHUD', 15, 2.5, 'linear')
end
if curStep == 64 then
cameraFlash('camGame', 'FFFFFF', 0.5, false)
doTweenAngle('tuin', 'camGame', 0, 0.1, 'linear')
doTweenAngle('tuout', 'camHUD', 0, 0.1, 'linear')
canzoom = false
setProperty('defaultCamZoom', 0.65)
setProperty('camGame.zoom', 0.65)
end
if curStep == 192 then
canzoom = true
end
if curStep == 320 then
setProperty('defaultCamZoom', 0.65)
setProperty('camGame.zoom', 0.65)
end
if curStep == 384 then
canzoom = true
end
if curStep == 448 then
cameraFlash('camGame', 'FFFFFF', 0.5, false)
canzoom = false
setProperty('defaultCamZoom', 0.65)
setProperty('camGame.zoom', 0.65)
end
if curStep == 472 then
setProperty('defaultCamZoom', 0.75)
setProperty('camGame.zoom', 0.75)
end
if curStep == 475 then
setProperty('defaultCamZoom', 0.8)
setProperty('camGame.zoom', 0.8)
end
if curStep == 480 then
setProperty('defaultCamZoom', 0.65)
setProperty('camGame.zoom', 0.65)
end
if curStep == 504 then
setProperty('defaultCamZoom', 0.75)
setProperty('camGame.zoom', 0.75)
end
if curStep == 508 then
setProperty('defaultCamZoom', 0.8)
setProperty('camGame.zoom', 0.8)
end
if curStep == 512 then
cameraFlash('camGame', 'FFFFFF', 0.5, false)
canzoom = true
end
if curStep == 576 then
cameraFlash('camGame', 'FFFFFF', 0.5, false)
canzoom = false
setProperty('defaultCamZoom', 0.65)
setProperty('camGame.zoom', 0.65)
end
if curStep == 640 then
cameraFlash('camGame', 'FFFFFF', 0.5, false)
canzoom = true
end
if curStep == 704 then
canzoom = true
doTweenAngle('tuin', 'camGame', -10, 7, 'linear')
doTweenAngle('tuout', 'camHUD', -10, 7, 'linear')
end
if curStep == 768 then
cameraFlash('camGame', 'FFFFFF', 0.5, false)
doTweenAngle('tuin', 'camGame', 0, 0.1, 'linear')
doTweenAngle('tuout', 'camHUD', 0, 0.1, 'linear')
canzoom = false
setProperty('defaultCamZoom', 0.5)
setProperty('camGame.zoom', 0.5)
end
end