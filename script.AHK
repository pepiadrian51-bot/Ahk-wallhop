#MaxThreadsPerHotkey 2

global wallhop_mode := false
global clicker_mode := false

; F1: The working Dance 2 Glitch (Sideways at the wall with W + Shift!)
F1:: {
    ToolTip "Executing Dance 2 Clip..."
    SetTimer () => ToolTip(), -1000
    
    Send "-"
    Sleep 250
    Send "{BackSpace}"
    Sleep 150
    
    SetKeyDelay 30, 30
    SendEvent "/e dance2"
    Sleep 250
    
    Send "{Enter}"
    Sleep 850
    
    Send "{Shift Down}{w Down}"
    Sleep 350
    Send "{Shift Up}{w Up}"
}

; F3: THE SPECIAL LAUGH CLIP (Via the upper white screen border)
F3:: {
    ToolTip "Executing Special Laugh Clip..."
    SetTimer () => ToolTip(), -1000
    
    Send "-"
    Sleep 300
    
    Send "{BackSpace}"
    Sleep 200
    
    SetKeyDelay 40, 40
    SendEvent "/e laugh"
    Sleep 400
    
    Send "{F11}"
    Sleep 600
    
    CoordMode "Mouse", "Screen"
    MouseMove (A_ScreenWidth / 2), 2, 0
    Sleep 400
    
    Send "{Enter}"
    Sleep 450
    
    Click "Right Down"
    Sleep 200
    
    Send "{s Down}{Shift Down}{Space Down}"
    Sleep 600
    
    Send "{s Up}{Shift Up}{Space Up}"
    Click "Right Up"
}

; F8: NEW — The smooth Laugh Wall-Clip (With your back to the wall, no jump!)
F8:: {
    ToolTip "Executing F8 Laugh Wall-Clip..."
    SetTimer () => ToolTip(), -1000
    
    ; 1. Opens the chat using your minus key
    Send "-"
    Sleep 250
    
    ; 2. Deletes the unwanted minus character from the input box
    Send "{BackSpace}"
    Sleep 150
    
    ; 3. Types /e laugh perfectly clean
    SetKeyDelay 30, 30
    SendEvent "/e laugh"
    Sleep 250
    
    ; 4. Presses Enter to send the emote
    Send "{Enter}"
    
    ; 5. THE TIMING: Waits until the head clips maximum into the wall
    Sleep 450
    
    ; 6. Briefly activates Shift-Lock to squeeze yourself into the wall
    Send "{Shift Down}"
    Sleep 60
    Send "{Shift Up}"
    Sleep 30
    
    ; 7. Forces you backward (S) without Shift-Lock completely through the wall
    Send "{s Down}"
    Sleep 500 ; Holds S for half a second
    Send "{s Up}"
}

F2:: {
    global wallhop_mode
    wallhop_mode := !wallhop_mode
    if wallhop_mode {
        ToolTip "Wallhop ON"
        SetTimer () => ToolTip(), -1000
    } else {
        ToolTip "Wallhop OFF"
        SetTimer () => ToolTip(), -1000
    }
}

; F7: Starts clicker, clears 00 via mouse, types 1, presses minus, starts F6 -> Closes immediately hard
F7:: {
    global clicker_mode
    clicker_mode := !clicker_mode
    
    if clicker_mode {
        ToolTip "Clicker Mode ON"
        SetTimer () => ToolTip(), -1000
        
        MouseGetPos &startX, &startY
        
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
        
        if WinExist("ahk_exe RobloxPlayerBeta.exe") {
            WinActivate
            WinWaitActive
            Sleep 50
            CoordMode "Mouse", "Screen"
            Click 1200, 500
        }
        
        MouseMove startX, startY, 0
        
    } else {
        ToolTip "Clicker Mode OFF"
        SetTimer () => ToolTip(), -1000
        
        Send "{F6}"
        Sleep 50
        
        try {
            ProcessClose "AutoClicker (1).exe"
        }
        try {
            ProcessClose "OPAutoClicker.exe"
        }
    }
}

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

; Perfect 45-degree Wallhop / Flick with UP arrow key
*Up:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 350, "Int", 0, "UInt", 0, "UInt", 0)
    Send "{Space}"
    Sleep 50
    DllCall("mouse_event", "UInt", 0x0001, "Int", -350, "Int", 0, "UInt", 0, "UInt", 0)
}

*Left:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 315
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}

*Right:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 145
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}

*Down:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 1
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}
#HotIf

F4::ExitApp
