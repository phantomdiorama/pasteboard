#NoEnv 
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, NoStandard
Menu, Tray, Icon, icon.ico
Menu, Tray, Add, Open, OpenL
Menu, Tray, Add, Exit, ExitL

!c::
clipboard := "" 
SendInput, ^c
ClipWait, 500, 0
FileAppend, %clipboard%`n`n, pasteboard.txt
return

OpenL:
run, pasteboard.txt
return 

ExitL:
MsgBox, 4,, Back up  Pasteboard?
IfMsgBox Yes
{
 FileCopy, pasteboard.txt, backup\pasteboard.%A_DD%.%A_MM%.%A_YYYY%.txt
 FileDelete, pasteboard.txt
 msgbox, Pasteboard backed up
 Exitapp
}
else
{
 Exitapp
}
