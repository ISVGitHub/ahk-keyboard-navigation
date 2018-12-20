﻿; VARIABLES
lines = 10
primaryModifier = CapsLock
secondaryModifier = Alt
hotkeys := [] 
hotkeys.Push("j")
hotkeys.Push("l")
hotkeys.Push("i")
hotkeys.Push("k")
hotkeys.Push("u")
hotkeys.Push("o")
hotkeys.Push("c")
hotkeys.Push("v")
hotkeys.Push("x")
hotkeys.Push("n")
hotkeys.Push("m")
hotkeys.Push("y")
hotkeys.Push("h")
hotkeys.Push("BackSpace")
hotkeys.Push("p")

for index, element in hotkeys
{
    i := index - 1
    Hotkey, %primaryModifier% & %element%, Hotkey%i%, On
}

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff

; Move left by a word or character
Hotkey0:
    if GetKeyState(secondaryModifier,"p")
        Send, ^{Left}
    else
        Send, {Left}
return

; Move right by a word or character
Hotkey1:
    if GetKeyState(secondaryModifier,"p")
        Send, ^{Right}
    else
        Send, {Right}
return

; Move up by n lines or one line
Hotkey2:
    if GetKeyState(secondaryModifier,"p")
        Send, {Up %lines%}
    else
        Send, {Up}
return

; Move down by n lines or one line
Hotkey3:
    if GetKeyState(secondaryModifier,"p")
        Send, {Down %lines%}
    else
        Send, {Down}
return

; Move to the start of the file or the line
Hotkey4:
    if GetKeyState(secondaryModifier,"p")
        Send, ^{Home}
    else
        Send, {Home}
return

; Move to the end of the file or the line
Hotkey5:
    if GetKeyState(secondaryModifier,"p")
        Send, ^{End}
    else
        Send, {End}
return

; Copy the entire line or from the current character to the end of the line
Hotkey6:
    if GetKeyState(secondaryModifier,"p")
    {
        Send, +{End}
        Send, ^c
    }
    else
        Send, ^c
return

; Paste from the clipboard or a copy of the current line in the next line
Hotkey7:
    if GetKeyState(secondaryModifier,"p")
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
Hotkey8:
    if GetKeyState(secondaryModifier,"p")
    {
        Send, +{End}
        Send, ^x
    }
    else
        Send, ^x
return

; Move left (selecting) by a word or character
Hotkey9:
    if GetKeyState(secondaryModifier,"p")
        Send, ^+{Left}
    else
        Send, +{Left}
return

; Move right (selecting) by a word or character
Hotkey10:
    if GetKeyState(secondaryModifier,"p")
        Send, ^+{Right}
    else
        Send, +{Right}
return

; Move up (selecting) or page up
Hotkey11:
    if GetKeyState(secondaryModifier,"p")
        Send, +{Up}
    else
        Send, {PgUp}
return

; Move down (selecting) or page down
Hotkey12:
    if GetKeyState(secondaryModifier,"p")
        Send, +{Down}
    else
        Send, {PgDn}
return

; Delete the next character or the entire line
Hotkey13:
    if GetKeyState(secondaryModifier,"p")
        Send, +{Del}
    else
        Send, {Del}
return

; Combine the current line with the next line or replace the current word with the text on clipboard 
Hotkey14:
    if GetKeyState(secondaryModifier,"p")
    {
        Send, ^{Right}
        Send, ^+{Left}
        Send, ^v
    }
    else
    {
        Send, {End}
        Send, {Right}
        Send, {BackSpace}
        Send, {Space}
    }
return