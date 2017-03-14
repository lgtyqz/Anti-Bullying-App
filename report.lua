-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local s = require('storage')
local w = require('widget')
local table = require('table')

checkTable = {}

local function btnHandler_1(event)

	if (event.phase == "ended") then
		
	end

end

local function btnHandler_2(event)

	if (event.phase == "ended") then
		
		print('next was pressed!')
		
		local backer = display.newRect(display.contentWidth*0.5, display.contentHeight*0.5, display.contentWidth*1.5, display.contentHeight*0.3)
		backer:setFillColor(200/255, 200/255, 200/255, 0.6)
		checkedObjects = {}
		newCombinedString = ''
		for i=1, #checkTable do
			if checkTable[i].isOn == true then
				table.insert(checkedObjects, #checkedObjects+1, checkTable[i])
				
			end
		end
		for i=1, #checkedObjects do
			newCombinedString = newCombinedString .. checkTable[i] .. ', '
		end
		local txt = display.newText('You have claimed that the bully(ies) has(have) demonstrated ' .. newCombinedString .. ' is this correct?', 100, 100)
		txt:setFillColor(1, 1, 0)
				
	end

end
--
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

function scene:create( event )
	local sceneGroup = self.view
	
	local back = display.newRect(display.contentWidth*0.5, display.contentHeight*0.5, display.contentWidth*2, display.contentHeight*2 )
	local title = display.newText("Steps to Report", display.contentWidth*0.5, display.contentHeight*0.1, s.headerFont, 32)
	title:setFillColor(0, 0, 0)

	local subtitle = display.newText("First please help us", display.contentWidth*0.5, display.contentHeight*0.2, s.headerFont, 18)
	subtitle:setFillColor(0, 0, 0)
	local subtitleCont = display.newText("by checking what did (or has) occur", display.contentWidth*0.5, display.contentHeight*0.25, s.headerFont, 18)
	subtitleCont:setFillColor(0, 0, 0)

local q1 = display.newText("Physically Bullied", display.contentWidth*0.45, display.contentHeight*0.3525, s.buttonFont, 18)
q1:setFillColor(0, 0, 0)
local check_1 = w.newSwitch(
    {
        left = display.contentWidth*0.07,
        top = display.contentHeight*0.32,
        style = "checkbox",
        id = "Physically Bullied",
        --onPress = function
    }
)

local q2 = display.newText("Verbally Bullied", display.contentWidth*0.45, display.contentHeight*0.4525, s.buttonFont, 18)
q2:setFillColor(0, 0, 0)	
local check_2 = w.newSwitch(
    {
        left = display.contentWidth*0.07,
        top = display.contentHeight*0.42,
        style = "checkbox",
        id = "Verbally Bullied",
        --onPress = function
    }
)

local q3 = display.newText("Sexually Bullied", display.contentWidth*0.45, display.contentHeight*0.5525, s.buttonFont, 18)
q3:setFillColor(0, 0, 0)
local check_3 = w.newSwitch(
    {
        left = display.contentWidth*0.07,
        top = display.contentHeight*0.52,
        style = "checkbox",
        id = "Sexually Bullied",
        --onPress = function
    }
)

local q4 = display.newText("Cyber Bullied", display.contentWidth*0.45, display.contentHeight*0.6525, s.buttonFont, 18)
q4:setFillColor(0, 0, 0)
local check_4 = w.newSwitch(
    {
        left = display.contentWidth*0.07,
        top = display.contentHeight*0.62,
        style = "checkbox",
        id = "Cyber Bullied",
        --onPress = function
    }
)

local q5 = display.newText("Other Form", display.contentWidth*0.45, display.contentHeight*0.7525, s.buttonFont, 18)
q5:setFillColor(0, 0, 0)
local check_5 = w.newSwitch(
    {
        left = display.contentWidth*0.07,
        top = display.contentHeight*0.72,
        style = "checkbox",
        id = "Other Bullied",
        --onPress = function
    }
)

table.insert(checkTable, #checkTable+1, check_1)
table.insert(checkTable, #checkTable+1, check_2)
table.insert(checkTable, #checkTable+1, check_3)
table.insert(checkTable, #checkTable+1, check_4)
table.insert(checkTable, #checkTable+1, check_5)

local globOp = {
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
		strokeWidth = 10,
		font=s.buttonFont,
	fontSize=15,
	}
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
		strokeWidth = 10,
		font=s.buttonFont,
	fontSize=15,
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
	strokeWidth = 10,
	font=s.buttonFont,
	fontSize=15,
	}
)
local backButOp = deepcopy(globOp)
print(backButOp)
btn_2.x = display.contentWidth*0.8
btn_2.y = display.contentHeight*0.92
backButOp.label = "Back"
backButOp.x = display.contentWidth/2
backButOp.y = display.contentHeight*0.92
backButOp.onEvent = function (event) if("ended" == event.phase) then composer.gotoScene("home") end end
backButOp = w.newButton(backButOp)
btn_1.x = display.contentWidth*0.2
btn_1.y = display.contentHeight*0.92

sceneGroup:insert(back)
sceneGroup:insert(title)
sceneGroup:insert(subtitle)
sceneGroup:insert(subtitleCont)
sceneGroup:insert(btn_1)
sceneGroup:insert(btn_2)
sceneGroup:insert(backButOp)
sceneGroup:insert(q1)
sceneGroup:insert(q2)
sceneGroup:insert(q3)
sceneGroup:insert(q4)
sceneGroup:insert(q5)
sceneGroup:insert(check_1)
sceneGroup:insert(check_2)
sceneGroup:insert(check_3)
sceneGroup:insert(check_4)
sceneGroup:insert(check_5)


end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	
	elseif phase == "did" then
	
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
	
	elseif phase == "did" then
	
	end
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene
