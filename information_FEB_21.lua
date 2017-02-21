
local s = require('storage')
local w = require('widget')

local back = display.newRect(display.contentWidth*0.5, display.contentHeight*0.5, display.contentWidth*2, display.contentHeight*2 )
local title = display.newText("Information", display.contentWidth*0.5, display.contentHeight*0.1, s.headerFont, 32)
title:setFillColor(0, 0, 0)

local subtitle = display.newText("Helping to further inform you on bullying.", display.contentWidth*0.5, display.contentHeight*0.2, s.headerFont, 18)
subtitle:setFillColor(0, 0, 0)

local function btnHandler_1(event)

	if (event.phase == "ended") then
		
		print('btn was just finished being pressed!!!')
		
	end

end

local function btnHandler_2(event)

	if (event.phase == "ended") then
		
		print('btn was just finished being pressed!!!')
		
	end

end

local newTextParams = {
	text = "Loaded by the first tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
	x = display.contentWidth*0.5, 
	y = display.contentHeight*0.6,
	width = 310, height = 310, 
	font = s.bodyFont, fontSize = 18, 
	align = "center"
}
local infoBlock = display.newText(newTextParams)
infoBlock:setFillColor(0, 0, 0)
--infoBlock.anchorY = display.contentHeight*0.3


local btn_1 = w.newButton(
    {
        label = "Prev.",
		labelColor = {
			default = {0, 0, 0},
			over = {1, 0, 0},
		},
        onEvent = btnHandler_1,
        shape = "roundedRect",
        width = display.contentWidth*0.3,
        height = 40,
        cornerRadius = 2,
        strokeColor = { default={0.92,0.95,1,1}, over={0.92, 0.95, 1, 1} },
        fillColor = { default={0.85,0.9,1,1}, over={0.7,0.7,0.8,1} },
        strokeWidth = 10
    }
)

local btn_2 = w.newButton(
    {
        label = "Next",
		labelColor = {
			default = {0, 0, 0},
			over = {1, 0, 0},
		},
        onEvent = btnHandler_2,
        shape = "roundedRect",
        width = display.contentWidth*0.3,
        height = 40,
        cornerRadius = 2,
        strokeColor = { default={0.92,0.95,1,1}, over={0.92, 0.95, 1, 1} },
        fillColor = { default={0.85,0.9,1,1}, over={0.7,0.7,0.8,1} },
        strokeWidth = 10
    }
)

btn_1.x = display.contentWidth*0.2
btn_1.y = display.contentHeight*0.92

btn_2.x = display.contentWidth*0.8
btn_2.y = display.contentHeight*0.92









