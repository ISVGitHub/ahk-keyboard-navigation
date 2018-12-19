#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff

; Move left by a word or character
CapsLock & j::
    if GetKeyState("Alt","p")
        Send, ^{Left}
    else
        Send, {Left}
return

; Move right by a word or character
CapsLock & l::
    if GetKeyState("Alt","p")
        Send, ^{Right}
    else
        Send, {Right}
return

; Move up by 10 lines or one line
CapsLock & i::
    if GetKeyState("Alt","p")
        Send, {Up 10}
    else
        Send, {Up}
return

; Move down by 10 lines or one line
CapsLock & k::
    if GetKeyState("Alt","p")
        Send, {Down 10}
    else
        Send, {Down}
return

; Move to the start of the file or the line
CapsLock & u::
    if GetKeyState("Alt","p")
        Send, ^{Home}
    else
        Send, {Home}
return

; Move to the end of the file or the line
CapsLock & o::
    if GetKeyState("Alt","p")
        Send, ^{End}
    else
        Send, {End}
return

; Copy the entire line or from the current character to the end of the line
CapsLock & c::
    if GetKeyState("Alt","p")
    {
        Send, +{End}
        Send, ^c
    }
    else
        Send, ^c
return

; Paste from the clipboard or a copy of the current line in the next line
CapsLock & v::
    if GetKeyState("Alt","p")
    {
        Send, {Home}
        Send, +{End}
        Send, ^c
        Send, {End}
        Send, {Enter}
        Send, ^v
    }
    else
        Send, ^v
return

; Cut the entire line or from the current character to the end of the line
CapsLock & x::
    if GetKeyState("Alt","p")
    {
        Send, +{End}
        Send, ^x
    }
    else
        Send, ^x
return

; Move left (selecting) by a word or character
CapsLock & n::
    if GetKeyState("Alt","p")
        Send, ^+{Left}
    else
        Send, +{Left}
return

; Move right (selecting) by a word or character
CapsLock & m::
    if GetKeyState("Alt","p")
        Send, ^+{Right}
    else
        Send, +{Right}
return

; Move up (selecting) or page up
CapsLock & y::
    if GetKeyState("Alt","p")
        Send, +{Up}
    else
        Send, {PgUp}
return

; Move down (selecting) or page down
CapsLock & h::
    if GetKeyState("Alt","p")
        Send, +{Down}
    else
        Send, {PgDn}
return