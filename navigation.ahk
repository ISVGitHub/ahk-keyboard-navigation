#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff

CapsLock & j::
	Send, {Left}
return

CapsLock & l::
	Send, {Right}
return

CapsLock & i::
    Send, {Up}
return

CapsLock & k::
	Send, {Down}
return

CapsLock & u::
    Send, {Home}
return

CapsLock & o::
	Send, {End}
return