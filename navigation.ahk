#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff

; Move left
CapsLock & j::
    if GetKeyState("Alt","p")
        ; by a word
        Send, ^{Left}
	else
        ; by a character
        Send, {Left}
return

; Move right
CapsLock & l::
    if GetKeyState("Alt","p")
        ; by a word
        Send, ^{Right}
	else
        ; by a character
        Send, {Right}
return

; Move up
CapsLock & i::
    if GetKeyState("Alt","p")
        ; by 10 lines
        Send, {Up 10}
	else
        ; by one line
        Send, {Up}
return

; Move down
CapsLock & k::
    if GetKeyState("Alt","p")
        ; by 10 lines
        Send, {Down 10}
	else
        ; by one line
        Send, {Down}
return

; Move to the start
CapsLock & u::
    if GetKeyState("Alt","p")
        ; of the file
        Send, ^{Home}
	else
        ; of the line
        Send, {Home}
return

; Move to the end
CapsLock & o::
    if GetKeyState("Alt","p")
        ; of the file
        Send, ^{End}
	else
        ; of the line
        Send, {End}
return

; Copy
CapsLock & c::
    if GetKeyState("Alt","p")
    {
        ; from the current character to the end of the line
        Send, +{End}
        Send, ^c
    }
	else
        ; the entire line
        Send, ^c
return

; Paste
CapsLock & v::
    if GetKeyState("Alt","p")
    {
        ; a copy of the current line in the next line
        Send, {Home}
        Send, +{End}
        Send, ^c
        Send, {End}
        Send, {Enter}
        Send, ^v
    }
	else
        ; from the clipboard
        Send, ^v
return

; Cut
CapsLock & x::
    if GetKeyState("Alt","p")
    {
        ; from the current character to the end of the line
        Send, +{End}
        Send, ^x
    }
	else
        ; the entire line
        Send, ^x
return