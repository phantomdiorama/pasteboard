#NoEnv 
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
#Persistent
#SingleInstance, Force

; Menu
Menu, Tray, NoStandard
Menu, Tray, Icon, pasteboard.ico
Menu, Tray, Add, Open, OpenHandler
Menu, Tray, Add, Archive, ArchiveHandler
Menu, Tray, Add, Quit, ExitHandler

; Main Prog
#RButton::
SendInput, ^c
CoordMode, mouse, Screen
MouseGetPos, xpos, ypos 
Gui, Color, black
Gui, Font, s12 cWhite, Consolas
Gui, Add,  Text, gAddClip, Add
Gui, Add,  Text, X+5, |
Gui, Add,  Text, gOpenClip X+5, Open
Gui, -Caption
Gui, Show, X%xpos% Y%ypos%
Sleep,3000
Gui, destroy 
return 

; Labels
AddClip:
FileAppend, %clipboard%`n`n, pasteboard.txt
Gui, destroy 
return

OpenHandler:
OpenClip:
Run, pasteboard.txt
Gui, destroy 
return 

ArchiveHandler:
FileCopy, pasteboard.txt, Archive\pasteboard.%A_DD%.%A_MM%.%A_YYYY%.txt
FileDelete, pasteboard.txt
msgbox, Pasteboard archived
return 

ExitHandler:
MsgBox, 4,, Quitting. Archive pasteboard?
IfMsgBox Yes
{
    FileCopy, pasteboard.txt, Archive\pasteboard.%A_DD%.%A_MM%.%A_YYYY%.txt
    FileDelete, pasteboard.txt
    msgbox, Pasteboard archived
    Exitapp
}
else
{
    Exitapp
}
return  