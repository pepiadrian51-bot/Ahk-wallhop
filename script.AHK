#MaxThreadsPerHotkey 2

/*
=============================================================================
ROBLOX GLITCH & WALLHOP MACRO SUITE (AutoHotkey v2)
=============================================================================
GitHub Release Ready | Optimized for Roblox Physics and Smooth In-Game Actions

[Main Toggles]
- F2: Toggle Wallhop Mechanics (Y/X/C rebinds & Arrow Flicks)
- F9: Toggle Smooth Camera Rotation (Manual Toggle)
- F4: Instant Emergency Exit (Close Script)

[Glitch Macros]
- F1: Active Dance 2 Wall-Clip (Use sideways against wall with W + Shift Lock)
- F3: Advanced Screen-Edge Laugh Clip (Automated top-border window shift)
- F8: Seamless Laugh Wall-Clip (Back against the wall, effortless phase-through)
- F7: Utility Key for Auto-Clicker integration

[Movement & Camera Mappings]
- While F2 (Wallhop) is Active:
    * Y -> Emulates holding 'A'
    * X -> Emulates holding 'Space'
    * C -> Emulates holding 'Shift'
    * Up / Down / Left / Right -> Precision 45-Degree and Flick mouse sweeps
- While F9 (Camera) is Active:
    * Left Ctrl (LCtrl) -> Slow, continuous fluid camera panning to the LEFT
=============================================================================
*/

global wallhop_modus := false
global f9_modus := false 
global clicker_modus := false

; F1: Active Dance 2 Glitch (Sideways against the wall using W + Shift!)
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

; F3: ADVANCED SCREEN-EDGE LAUGH CLIP (Via top white border execution)
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

; F8: Seamless Laugh Wall-Clip (Back facing the wall, clean execution)
F8:: {
    ToolTip "Executing F8 Laugh Wall-Clip..."
    SetTimer () => ToolTip(), -1000
    
    ; 1. Open chat via key bind
    Send "-"
    Sleep 250
    
    ; 2. Clear out the initial text character
    Send "{BackSpace}"
    Sleep 150
    
    ; 3. Clean input of the emote string
    SetKeyDelay 30, 30
    SendEvent "/e laugh"
    Sleep 250
    
    ; 4. Submit emote
    Send "{Enter}"
    
    ; 5. TIMING WINDOW: Waits until character head model pivots deep into geometry
    Sleep 450
    
    ; 6. Quick toggle of shift lock to compress hitboxes
    Send "{Shift Down}"
    Sleep 60
    Send "{Shift Up}"
    Sleep 30
    
    ; 7. Displace character backwards seamlessly through the partition
    Send "{s Down}"
    Sleep 500 
    Send "{s Up}"
}

; F2: Toggles the Core Wallhop Module ONLY
F2:: {
    global wallhop_modus
    wallhop_modus := !wallhop_modus
    if wallhop_modus {
        ToolTip "Wallhop: ENABLED"
        SetTimer () => ToolTip(), -1000
    } else {
        ToolTip "Wallhop: DISABLED"
        SetTimer () => ToolTip(), -1000
    }
}

; F9: MANUALLY toggles the Smooth Camera Rotation Loop
F9:: {
    global f9_modus
    f9_modus := !f9_modus
    if f9_modus {
        ToolTip "F9-Camera: ENABLED"
        SetTimer () => ToolTip(), -1000
    } else {
        ToolTip "F9-Camera: DISABLED"
        SetTimer () => ToolTip(), -1000
    }
}

; F7: Utility Key — Hook Auto Clicker engine, configure configurations, execute, or forcefully close
F7:: {
    global clicker_modus
    clicker_modus := !clicker_modus
    
    if clicker_modus {
        ToolTip "Clicker Mode: ENABLED"
        SetTimer () => ToolTip(), -1000
        
        MouseGetPos &startX, &startY
        
        if !WinExist("OP Auto Clicker") && !WinExist("ahk_class WindowsForms10.Window.8.app.0.141b42a_r6_ad1") {
            try {
                Run A_MyDocuments "\..\Downloads\AutoClicker (1).exe"
            } catch {
                ToolTip "Executable initialization failed!"
                SetTimer () => ToolTip(), -2000
                clicker_modus := false
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
        ToolTip "Clicker Mode: DISABLED"
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

#HotIf wallhop_modus
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

; High-Precision 45-Degree Wallhop / Flick with UP Arrow
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

; Smooth, continuous panning to the LEFT via holding Left Ctrl (LCtrl)
#HotIf f9_modus
*LCtrl:: {
    while GetKeyState("LCtrl", "P") {
        DllCall("mouse_event", "UInt", 0x0001, "Int", -12, "Int", 0, "UInt", 0, "UInt", 0)
        Sleep 10
    }
}
#HotIf

F4::ExitApp
