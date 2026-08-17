#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2

; ==========================================
; GLOBAL VARIABLES (Toggle States)
; ==========================================
global wallhop_modus := false
global s_jump_modus := false

; ==========================================
; F2: Toggle Wallhop Mode
; ==========================================
F2:: {
    global wallhop_modus
    wallhop_modus := !wallhop_modus
    if wallhop_modus {
        ToolTip "Wallhop ON"
        SetTimer () => ToolTip(), -1000
    } else {
        ToolTip "Wallhop OFF"
        SetTimer () => ToolTip(), -1000
    }
}

; ==========================================
; F3: Toggle Laugh Clip Mode
; ==========================================
F3:: {
    global s_jump_modus
    s_jump_modus := !s_jump_modus
    if s_jump_modus {
        ToolTip "Laugh clip ON"
        SetTimer () => ToolTip(), -1000
    } else {
        ToolTip "Laugh clip OFF"
        SetTimer () => ToolTip(), -1000
    }
}

; ==========================================
; HOTKEYS FOR WALLHOP MODE (Only active if F2 is ON)
; ==========================================
#HotIf wallhop_modus

; Pressing 'Y' holds down 'A' (Strafing Left)
*y:: {
    if !GetKeyState("a")
        Send "{a Down}"
}
*y Up::Send "{a Up}"

; Pressing 'X' holds down 'Space' (Jumping)
*x:: {
    if !GetKeyState("Space")
        Send "{Space Down}"
}
*x Up::Send "{Space Up}"

; Pressing 'C' holds down 'Shift' (Sprinting/Crouching)
*c:: {
    if !GetKeyState("Shift")
        Send "{Shift Down}"
}
*c Up::Send "{Shift Up}"

; Left Arrow: Instantly flicks mouse right by 250 units, waits 315ms, and flicks back
*Left:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 315
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}

; Right Arrow: Instantly flicks mouse right by 250 units, waits 145ms, and flicks back
*Right:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 145
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}

; Down Arrow: Micro-flick mouse right by 250 units and instantly back (1ms delay)
*Down:: {
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UInt", 0)
    Sleep 1
    DllCall("mouse_event", "UInt", 0x0001, "Int", -250, "Int", 0, "UInt", 0, "UInt", 0)
}
#HotIf

; ==========================================
; HOTKEYS FOR LAUGH CLIP MODE (Only active if F3 is ON)
; ==========================================
#HotIf s_jump_modus

; Pressing 'Shift' triggers a macro that holds Shift, S, and Space for 50ms (Slide-Jump/Laugh Clip)
$Shift:: {
    Send "{Shift Down}{s Down}{Space Down}"
    Sleep 50
    Send "{Shift Up}{s Up}{Space Up}"
}
#HotIf

; ==========================================
; EMERGENCY EXIT
; ==========================================
; F4: Instantly closes the AutoHotkey script
F4::ExitApp
