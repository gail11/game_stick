local centerX = display.contentCenterX
local centerY = display.contentCenterY
local_W = display.contentWidth
local_H = display.contentHeight

local TOP_REF = 0
local BOTTOM_REF = 1
local LEFT_REF = 0
local RIGHT_REF = 1
local CENTER_REF = 0.5

display.setStatusBar( display.HiddenStatusBar )

local sky = display.newImage("images/sky.jpg", centerX, centerY)

local baseline = 280

local building = {}
building[1] = display.newImage( "images/building01.png" )
building[1].xScale = 0.7; building[1].yScale = 0.7
building[1].anchorY = BOTTOM_REF
building[1].x = 20; building[1].y = baseline
building[1].dx = 0.1
building[2] = display.newImage( "images/building02.png" )
building[2].xScale = 0.6; building[2].yScale = 0.6
building[2].anchorY = BOTTOM_REF
building[2].x = 120; building[2].y = baseline
building[2].dx = 0.2
building[3] = display.newImage( "images/building03.png" )
building[3].xScale = 0.8; building[3].yScale = 0.8
building[3].anchorY = BOTTOM_REF
building[3].x = 200; building[3].y = baseline
building[3].dx = 0.3
building[4] = display.newImage( "images/building04.png" )
building[4].xScale = 0.7; building[4].yScale = 0.7
building[4].anchorY = BOTTOM_REF
building[4].x = baseline; building[4].y = baseline
building[4].dx = 0.4

local sheet2 = graphics.newImageSheet("stickman.png", {width=128, height=128, numFrame=15})

local instance1 = display.newSprite( sheet2, {name = "man", start = 1, count=15, time=500})
instance1.x = 3 * display.contentWidth / 4 + 30
instance1.y = baseline - 55
instance1.play()

local floor = display.newImage( "images/ground.png" )
floor.anchorX = LEFT_REF
floor.x = 0
floor.y = baseline - 20
local floor2 = display.newImage( "images/ground.png" )
floor2.anchorX = LEFT_REF
floor2.x = 480
floor2.y = baseline - 20

local ground = display.newRect(0, baseline, 480, 90)
ground:setFillColor( 0x31/255, 0x5a/255, 0x18/255)
ground.anchorX = LEFT_REF
ground.anchorY = TOP_REF

local tPrevious = system.getTimer()
 local function move(event)
 	local tDelta = event.time - tPrevious
 	tPrevious = event.time
 
 	local xOffset = ( 0.2 * tDelta )
 
 	floor.x = floor.x - xOffset
 	floor2.x = floor2.x - xOffset
 	
 	if (floor.x + floor.contentWidth) < 0 then
 		floor:translate( 480 * 2, 0)
 	end
 	if (floor2.x + floor2.contentWidth) < 0 then
 		floor2:translate( 480 * 2, 0)
 	end
 	
 	local i
 	for i = 1, #building, 1 do
 		building[i].x = building[i].x - building[i].dx * tDelta * 0.2
 		if (building[i].x + building[i].contentWidth) < 0 then
 			building[i]:translate( 480 + building[i].contentWidth * 2, 0 )
 		end
 	end
 end

Runtime:addEventListener("enterFrame", move); 