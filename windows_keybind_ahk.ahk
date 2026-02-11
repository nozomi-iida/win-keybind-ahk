#Requires AutoHotkey v2.0
#SingleInstance Force

; --- WSL (Windows Terminal) では無効化 ---
#HotIf !WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")

; --- 基本カーソル移動 ---
^f::Send("{Right}")      ; Ctrl+F → 右
^b::Send("{Left}")       ; Ctrl+B → 左
^n::Send("{Down}")       ; Ctrl+N → 下
^p::Send("{Up}")         ; Ctrl+P → 上

; --- 行頭・行末 ---
^a::Send("{Home}")       ; Ctrl+A → 行頭
^e::Send("{End}")        ; Ctrl+E → 行末

; --- 削除 ---
^d::Send("{Delete}")     ; Ctrl+D → Delete（カーソル右の文字を削除）
^k::{                    ; Ctrl+K → 行末まで削除
    Send("{Shift Down}{End}{Shift Up}")
    Send("{Delete}")
}

; --- 検索の退避 ---
; Ctrl+F を移動に使うため、元の検索は Ctrl+Shift+F に退避
^+f::{                   ; Ctrl+Shift+F → 検索（元の Ctrl+F）
    Hotkey("^f", "Off")
    Send("^f")
    Hotkey("^f", "On")
}

; --- 除外設定の終了 ---
#HotIf

#Space::return  ; Win+Space を無効化
