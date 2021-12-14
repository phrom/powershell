# from: https://github.com/PowerShell/PSReadLine/blob/master/PSReadLine/SamplePSReadLineProfile.ps1

Import-Module PSReadLine

Set-PSReadLineOption -EditMode Emacs

# # Searching for commands with up/down arrow is really handy.  The
# # option "moves to end" is useful if you want the cursor at the end
# # of the line while cycling through history like it does w/o searching,
# # without that option, the cursor will remain at the position it was
# # when you used up arrow, which can be useful if you forget the exact
# # string you started the search on.

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# # Clipboard interaction is bound by default in Windows mode, but not Emacs mode.
Set-PSReadLineKeyHandler -Key Ctrl+C -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste

# # from: https://www.hanselman.com/blog/how-to-make-a-pretty-prompt-in-windows-terminal-with-powerline-nerd-fonts-cascadia-code-wsl-and-ohmyposh

Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme half-life

function Load-DevEnv {
	. "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\Tools\Launch-VsDevShell.ps1"
	$global:VCPKG_INSTALL_DIR=$Env:VCPKG_INSTALL_DIR
	$global:VCPKG_DEFAULT_TRIPLET=$Env:VCPKG_DEFAULT_TRIPLET
}
