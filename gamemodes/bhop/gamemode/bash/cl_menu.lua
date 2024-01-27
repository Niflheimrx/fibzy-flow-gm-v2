local ID = "claz_sm_menu"

local g_menus = {}
local g_keycodeHandler = nil

-- TODO: open menu from client-side

local function SendMenuResponse(id, action, key)
	net.Start(ID)
		net.WriteUInt(id, 32)
		net.WriteString(action)
		net.WriteString(key or "")
	net.SendToServer()
end

-- Use sm_sidebar assets instead --
local frame

local function OpenMenu(m)
	frame = GUI.CreateSidebar "Bash Stats"
	frame:SetSubtitle(m._title)

	-- Override default think action --
	frame.Think = function() end

	frame.OnClose = function()
		g_keycodeHandler = nil
		if self._close_key then
			self:MarkForClose()
			SendMenuResponse(m._id, "end", self._close_key)
		end
	end

	local hotKeys = {
		[KEY_0] = function()
			if not g_keycodeHandler then return end

			g_keycodeHandler = nil
			frame:MarkForClose()
		end
	}

	g_keycodeHandler = function(keyCode)
		local func = hotKeys[keyCode]
		if func and IsValid(frame) then
			frame:DisableInput()
			frame:AlphaTo(150, 0.5)

			func()
		end
	end

	if m._duration ~= 0 then
		local prog = vgui.Create("DProgress", frame)
		prog:DockMargin(2, 2, 2, 2)
		prog:SetHeight(16)
		prog:Dock(BOTTOM)
		prog:SetFraction(0)

		prog.Think = function()
			prog:SetFraction((m._endTime - RealTime()) / m._duration)
		end
	end

	for i, item in ipairs(m._items) do
		local text = #item.text ~= 0 and item.text or language.GetPhrase(item.key) or ""

		if item.key == "cancel" then
			frame:CreateClose("9. " .. text)

			hotKeys[KEY_9] = function()
				SendMenuResponse(m._id, "cancel", "")
				frame._close_key = nil
				frame:MarkForClose()
			end
		else
			if item.disabled then
				frame:AddToLabel(text)
			else
				frame:AddToLabel(text, false, "")

				if (i < 10) then
					hotKeys[KEY_0 + i] = function()
						surface.PlaySound "buttons/button24.wav"
						SendMenuResponse(m._id, "select", item.key or "")
						frame._close_key = nil
					end
				end
			end
		end
	end

	if (#m._items <= 1) then
		frame:AddToLabel "Nothing to show here!"
	end

	m._frame, frame._close_key = frame, "user"
	g_menus[m._id] = m

	frame:SetActive()
end

hook.Add("PlayerButtonDown", ID, function(ply, key)
	if not g_keycodeHandler or not IsFirstTimePredicted() then return end
	g_keycodeHandler(key)
end)

local function CloseMenu(id, key)
	local m = g_menus[id]
	if not m then return end

	local w = m._frame
	if IsValid(w) then
		w._close_key = key
		w:MarkForClose()
	end

	g_menus[id] = nil
	timer.Remove(ID .. tostring(id))
end

net.Receive(ID, function()
	local id = net.ReadUInt(32)
	local action = net.ReadString()

	if action == "close" then
		CloseMenu(id)
		return
	end

	if action == "display" then
		local m = {
			_id = id,
			_duration = net.ReadUInt(32),
			_title = net.ReadString(),
			_items = {},
		}

		local size = net.ReadUInt(16)
		for i = 1, size do
			table.insert(m._items, {
				disabled = net.ReadUInt(8) ~= 0,
				key = net.ReadString(),
				text = net.ReadString(),
			})
		end

		m._endTime = m._duration ~= 0 and RealTime() + m._duration or 0
		OpenMenu(m)

		if m._duration == 0 then return end
		timer.Create(ID .. tostring(id), m._duration, 0, function()
			CloseMenu(id, "timeout")
		end)
	end
end)
