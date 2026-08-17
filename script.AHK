#MaxThreadsPerHotkey 2

global wallhop_mode := false
global clicker_mode := false

; F1: Executes the perfect Dance 2 Glitch (Sideways at the wall using W + Shift)
F1:: {
    ToolTip "Executing Dance 2 Clip..."
    SetTimer () => ToolTip(), -1000
    
    ; 1. Opens the chat using your minus key
    Send "-"
    Sleep 250
    
    ; 2. Deletes the unwanted minus character from the input box
    Send "{BackSpace}"
    Sleep 150
    
    ; 3. Types the command smoothly letter by letter
    SetKeyDelay 30, 30
    SendEvent "/e dance2"
    Sleep 250
    
    ; 4. Presses Enter to submit the emote
    Send "{Enter}"
    
    ; 5. Optimized Dance 2 timing for the clip moment
    Sleep 850
    
    ; 6. Presses Shift and W absolutely simultaneously to glitch through
    Send "{Shift Down}{w Down}"
    Sleep 350
    Send "{Shift Up}{w Up}"
}

; F3: REPAIRED LAUGH CLIP (Teleports the mouse guaranteed to the top window bar!)
F3:: {
    ToolTip "Executing Special Laugh Clip..."
    SetTimer () => ToolTip(), -1000
    
    ; 1. Opens the chat using your minus key
    Send "-"
    Sleep 300
    
    ; 2. Deletes the unwanted minus character
    Send "{BackSpace}"
    Sleep 200
    
    ; 3. Types /e laugh (BUT DOES NOT PRESS ENTER YET!)
    SetKeyDelay 40, 40
    SendEvent "/e laugh"
    Sleep 400
    
    ; 4. Takes you out of Fullscreen (F11) to make the white top bar visible
    Send "{F11}"
    Sleep 600 ; Gives the window enough time to resize
    
    ; 5. WINDOW BAR REFIX: Teleports the mouse exactly to the top edge of your monitor
    CoordMode "Mouse", "Screen"
    ; A_ScreenWidth/2 moves the mouse to the center of your monitor, Y=2 pushes it to the very top bar
    MouseMove (A_ScreenWidth / 2), 2, 0
    Sleep 400
    
    ; 6. Now Enter is pressed to actually start the emote
    Send "{Enter}"
    
    ; 7. TIMING: Waits until your character's head fully extends backwards
    Sleep 450
    
    ; 8. Holds down the Right Mouse Button on the window bar to freeze Roblox physics
    Click "Right Down"
    Sleep 200
    
    ; 9. ABSOLUTELY SIMULTANEOUSLY: Holds S, Shift, and Space in the exact same millisecond!
    Send "{s Down}{Shift Down}{Space Down}"
    Sleep 600 ; Holds everything for over half a second to slide through
    
    ; 10. Cleanly releases all keys and mouse inputs
    Send "{s Up}{Shift Up}{Space Up}"
    Click "Right Up"
}

; F2: Toggles the Wallhop / Movement glitch macros on and off
F2:: {
    global wallhop_mode
    wallhop_mode := !wallhop_mode
    if wallhop_mode {
        ToolTip "Wallhop MODE: ON"
        SetTimer () => ToolTip(), -1000
    } else {
        ToolTip "Wallhop MODE: OFF"
        SetTimer () => ToolTip(), -1000
    }
}

; F7: Launches OP Auto Clicker, optimizes its settings to 11ms, and returns focus to Roblox
F7:: {
    global clicker_mode
    clicker_mode := !clicker_mode
    
    if clicker_mode {
        ToolTip "Clicker Mode: ON"
        SetTimer () => ToolTip(), -1000
        
        MouseGetPos &startX, &startY
        
        ; Automatically launches the software from your Downloads folder
        if !WinExist("OP Auto Clicker") && !WinExist("ahk_class WindowsForms10.Window.8.app.0.141b42a_r6_ad1") {
            try {
                Run A_MyDocuments "\..\Downloads\AutoClicker (1).exe"
            } catch {
                ToolTip "File could not be started!"
                SetTimer () => ToolTip(), -2000
                clicker_mode := false
                return
            }
        }
        
        ; Confirms the window is ready and updates the click speed settings
        if WinWait("OP Auto Clicker", , 3) || WinWait("ahk_class WindowsForms10.Window.8.app.0.141b42a_r6_ad1", , 3) {
            WinActivate
            WinWaitActive
            Sleep 200
            
            CoordMode "Mouse", "Window"
            Click 582, 380
            Sleep 50
            
            Send "{BackSpace 2}"
            Sleep 50
            
            Send "1"
            Sleep 50
            
            Send "-"
            Sleep 50
            
            Send "{F6}"
            Sleep 50
        }
        
        ; Shifts focus instantly back into your Roblox game window
        if WinExist("ahk_exe RobloxPlayerBeta.exe") {
            WinActivate
            WinWaitActive
            Sleep 50
            CoordMode "Mouse", "Screen"
            Click 1200, 500 ; Clicks inside the game viewport
        }
        
        MouseMove startX, startY, 0
        
    } else {
        ToolTip "Clicker Mode: OFF"
        SetTimer () => ToolTip(), -1000
        
        ; Stops the clicking immediately using F6
        Send "{F6}"
        Sleep 50
        
        ; Instantly closes the process to avoid any windows delays
        try {
            ProcessClose "AutoClicker (1).exe"
        }
        try {
            ProcessClose "OPAutoClicker.exe"
        }
    }
}

; The following hotkeys are only active if the F2 Wallhop mode is turned ON
#HotIf wallhop_mode
*y:: {
    if !GetKeyState("a")
        Send "{a Down}"
}
*y Up::Send "{a Up}"

*x:: {
    if !GetKeyState("Space")
        Send "{Space Down}"
}
*x Up::Send "{Space Up}"

*c:: {
    if !GetKeyState("Shift")
        Send "{Shift Down}"
}
*c Up::Send "{Shift Up}"

; Perfect 45-Degree Wallhop / Flick using the UP Arrow key
*Up:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 350, "Int", 0, "UInt", 0, "UInt", 0)
    Send "{Space}"
    Sleep 50
    DllCall("mouse_event", "UInt", 0x0001, "Int", -350, "Int", 0, "UInt", 0, "UInt", 0)
}

; Standard Left Flick
*Left:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 315
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}

; Standard Right Flick
*Right:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 145
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}

; Standard Down Flick
*Down:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 1
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}
#HotIf

; F4: Instantly closes the script completely
F4::ExitApp
