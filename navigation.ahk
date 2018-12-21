﻿; Definitions
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff
SetTitleMatchMode, 2

; List of hotkey names
hotkeys := []
; List of program windows with which this script does not interact
programs := []
; GetKeyState mode
ksMode := "p"

; Read modifier, hotkey and program names from the config file and assign them to string variables
Loop, read, config
{
    StringSplit, l, A_LoopReadLine, '=
    e1 := l1
    e2 := l2
    if e1 = primaryModifier
        primaryModifier := e2
    else if e1 = secondaryModifier
        secondaryModifier := e2
    else if e1 = linesUp
        linesUp := e2
    else if e1 = linesDown
        linesDown := e2
    else if e1 = wordsLeft
        wordsLeft := e2
    else if e1 = wordsRight
        wordsRight := e2
    else if e1 = wordsLeftSel
        wordsLeftSel := e2
    else if e1 = wordsRightSel
        wordsRightSel := e2
    else if e1 = program
        programs.Push(e2)
    else
        hotkeys.Push(e2)
}

; Combine hotkey names to create the hotkeys
for index, element in hotkeys
{
    i := index - 1
    Hotkey, %primaryModifier% & %element%, Hotkey%i%, On
}

; Function that returns whether the active window is listed in config
CheckActiveWindow()
{
    global programs
    for index, element in programs
        if WinActive(element)
            return false
    return true
}

; Check if the script will interact with the active window
#If (CheckActiveWindow())
{
    ; Move left by a word or character
    Hotkey0:
        if GetKeyState(secondaryModifier, ksMode)
            Send, ^{Left %wordsLeft%}
        else
            Send, {Left}
    return

    ; Move right by a word or character
    Hotkey1:
        if GetKeyState(secondaryModifier, ksMode)
            Send, ^{Right %wordsRight%}
        else
            Send, {Right}
    return

    ; Move up by n lines or one line
    Hotkey2:
        if GetKeyState(secondaryModifier, ksMode)
            Send, {Up %linesUp%}
        else
            Send, {Up}
    return

    ; Move down by n lines or one line
    Hotkey3:
        if GetKeyState(secondaryModifier, ksMode)
            Send, {Down %linesDown%}
        else
            Send, {Down}
    return

    ; Move to the start of the file or line
    Hotkey4:
        if GetKeyState(secondaryModifier, ksMode)
            Send, ^{Home}
        else
            Send, {Home}
    return

    ; Move to the end of the file or line
    Hotkey5:
        if GetKeyState(secondaryModifier, ksMode)
            Send, ^{End}
        else
            Send, {End}
    return

    ; Copy the entire line or from the current character to the end of the line
    Hotkey6:
        if GetKeyState(secondaryModifier, ksMode)
        {
            Send, +{End}
            Send, ^c
        }
        else
            Send, ^c
    return

    ; Paste from the clipboard or paste a copy of the current line in the next line
    Hotkey7:
        if GetKeyState(secondaryModifier, ksMode)
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
        if GetKeyState(secondaryModifier, ksMode)
        {
            Send, +{End}
            Send, ^x
        }
        else
            Send, ^x
    return

    ; Move left (selecting) by a word or character
    Hotkey9:
        if GetKeyState(secondaryModifier, ksMode)
            Send, ^+{Left %wordsLeftSel%}
        else
            Send, +{Left}
    return

    ; Move right (selecting) by a word or character
    Hotkey10:
        if GetKeyState(secondaryModifier, ksMode)
            Send, ^+{Right %wordsRightSel%}
        else
            Send, +{Right}
    return

    ; Move up (selecting) or page up
    Hotkey11:
        if GetKeyState(secondaryModifier, ksMode)
            Send, +{Up}
        else
            Send, {PgUp}
    return

    ; Move down (selecting) or page down
    Hotkey12:
        if GetKeyState(secondaryModifier, ksMode)
            Send, +{Down}
        else
            Send, {PgDn}
    return

    ; Delete the next character or the entire line
    Hotkey13:
        if GetKeyState(secondaryModifier, ksMode)
            Send, +{Del}
        else
            Send, {Del}
    return

    ; Combine the current line with the next line or replace the current word with the text on clipboard
    Hotkey14:
        if GetKeyState(secondaryModifier, ksMode)
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
}

; Enable or disable hotkeys
Hotkey15:
    Suspend
return