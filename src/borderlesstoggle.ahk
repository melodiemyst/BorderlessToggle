F11::{
    hwnd := WinExist("A")

    static saved := false
    static x, y, w, h

    if !saved {
        WinGetPos(&x, &y, &w, &h, hwnd)

        saved := true

        ; remove borders + title bar (important fix)
        WinSetStyle("-0xC40000", hwnd)

        ; force fullscreen move
        WinMove(0, 0, A_ScreenWidth, A_ScreenHeight, hwnd)
    } else {
        saved := false

        ; restore borders
        WinSetStyle("+0xC40000", hwnd)

        ; restore original size
        WinMove(x, y, w, h, hwnd)
    }
}
^q::ExitApp
