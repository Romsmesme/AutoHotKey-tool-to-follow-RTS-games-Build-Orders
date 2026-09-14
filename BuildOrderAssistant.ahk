#Requires AutoHotkey v2.0

; ==========================
; Configuration
; ==========================

buildFolder := A_ScriptDir


; ==========================
; Build selection
; ==========================

buildList := []

Loop Files, buildFolder "\*.txt"
{
    buildList.Push(A_LoopFileName)
}

buildList := SortArray(buildList)

if (buildList.Length = 0)
{
    MsgBox "Aucun fichier .txt trouvé dans le dossier Builds."
    ExitApp
}

selectGui := Gui("+AlwaysOnTop", "Build Order Selection")

selectGui.AddText("w300", "Choose your Build Order :")

buildChoice := selectGui.AddDropDownList("w300", buildList)

okButton := selectGui.AddButton("w100", "OK")
okButton.OnEvent("Click", LoadSelectedBuild)

selectGui.Show()


; ==========================
; Selected Build Loading
; ==========================

LoadSelectedBuild(*)
{
    global buildChoice, selectGui
    global buildFolder, buildFile
    global title, steps, current

    buildFile := buildFolder "\" buildChoice.Text

    selectGui.Destroy()

    content := FileRead(buildFile)
    lines := StrSplit(content, "`n", "`r")

    title := lines[1]
    steps := []

    Loop lines.Length
    {
        if (A_Index > 1 && Trim(lines[A_Index]) != "")
            steps.Push(Trim(lines[A_Index]))
    }

    current := 1

    CreateOverlay()
}


; ==========================
; Window creation
; ==========================

CreateOverlay()
{
    global myGui
    global titleText, prevText, currText
    global next1Text, next2Text, next3Text

    myGui := Gui("+AlwaysOnTop +ToolWindow -Caption")
    myGui.BackColor := "202020"

    myGui.SetFont("s14 Bold", "Segoe UI")
    titleText := myGui.AddText("c4FC3F7 w800 h40", "")

    myGui.SetFont("s14", "Segoe UI")
    prevText := myGui.AddText("c66FF66 w800", "")

    myGui.SetFont("s16 Bold", "Segoe UI")
    currText := myGui.AddText("cFF5555 w800", "")

    myGui.SetFont("s14", "Segoe UI")
    next1Text := myGui.AddText("cFFFFFF w800", "")
    next2Text := myGui.AddText("cFFFFFF w800", "")
    next3Text := myGui.AddText("cFFFFFF w800", "")

    myGui.Show("x0 y880 w600 h300")

    WinSetExStyle("+0x20", "ahk_id " myGui.Hwnd)
    WinSetTransColor("202020 255", "ahk_id " myGui.Hwnd)

    UpdateDisplay()
}

; ==========================
; Display
; ==========================

UpdateDisplay()
{
    global titleText, prevText, currText
    global next1Text, next2Text, next3Text
    global title, steps, current

    titleText.Value := title "`n────────────────────"

    if (current > 1)
        prevText.Value := "✓ " steps[current-1]
    else
        prevText.Value := ""

    currText.Value := "► " steps[current]

    if (current + 1 <= steps.Length)
        next1Text.Value := "○ " steps[current+1]
    else
        next1Text.Value := ""

    if (current + 2 <= steps.Length)
        next2Text.Value := "○ " steps[current+2]
    else
        next2Text.Value := ""

    if (current + 3 <= steps.Length)
        next3Text.Value := "○ " steps[current+3]
    else
        next3Text.Value := ""
}

SortArray(arr) {
    result := []

    for item in arr
        result.Push(item)

    Loop result.Length {
        for i, item in result {
            if (i < result.Length && StrCompare(result[i], result[i+1]) > 0) {
                temp := result[i]
                result[i] := result[i+1]
                result[i+1] := temp
            }
        }
    }

    return result
}

; ==========================
; Hotkeys
; ==========================

F1::
{
    global current, steps

    if (current < steps.Length)
    {
        current++
        UpdateDisplay()
    }
    else
    {
        ExitApp
    }
}

F4::
{
    ExitApp
}
