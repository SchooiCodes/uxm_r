# UXM_R

**U\* XMRig Injection Miner Remover** — a Windows batch script that detects and removes a specific XMRig-based cryptomining infection (the "u\*" injection miner), including the files and service it installs in `System32` and the hidden folders it uses to spread over USB drives.

```
██╗   ██╗██╗  ██╗███╗   ███╗        ██████╗  U* XMRig Injection Miner Remover
██║   ██║╚██╗██╔╝████╗ ████║        ██╔══██╗ Made by SchooiCodes
██║   ██║ ╚███╔╝ ██╔████╔██║        ██████╔╝ https://github.com/SchooiCodes/uxm_r
██║   ██║ ██╔██╗ ██║╚██╔╝██║        ██╔══██╗
╚██████╔╝██╔╝ ██╗██║ ╚═╝ ██║███████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
```

**Current version:** v1.3

## What it does

`UXM_R.bat` automates the manual disinfection steps for this miner. It runs in two phases:

### 1. Windows cleanup

The script checks for the malware's telltale folder, `C:\Windows\System32\wsvcz`. If it isn't there, the machine is treated as clean and this phase is skipped. Otherwise:

1. **Finds the malicious service DLL** in `System32`, matching the pattern `u` + six digits (e.g. `u123456.dll`), then stops and deletes the service of the same name.
2. **Deletes the DLL** after asking for confirmation.
3. **Finds the miner executable** (`u*.exe`) inside `wsvcz`, asks for confirmation, kills the process, and deletes it.
4. **Removes the `wsvcz` folder** and the injected `svctrl64.exe` system file.

### 2. USB drive cleanup

The script scans drive letters **C–Z** for a hidden `sysvolume` folder. For each infected drive it:

1. Removes the `sysvolume` folder.
2. Restores the original folder's visibility (clears the System/Hidden attributes).
3. Deletes the fake `.lnk` shortcut that replaced it.

If a folder/shortcut pair doesn't match the expected attribute pattern, the script leaves it alone and tells you so rather than guessing.

Every step is logged to the console with a timestamp.

## Usage

1. Download or clone this repository:
   ```
   git clone https://github.com/SchooiCodes/uxm_r.git
   cd uxm_r
   ```
2. Plug in any USB drives you want checked.
3. Run `UXM_R.bat`. If it isn't already elevated, it relaunches itself with a UAC prompt (or right-click → **Run as administrator**).
4. Answer the `Y/N` prompts. Answering `N` aborts the script.

## Requirements

- Windows with `cmd.exe`
- PowerShell (used to relaunch the script with administrator rights)
- Administrator privileges (needed to stop services and modify `System32`)

## Notes and limitations

- **Targets one specific variant.** It looks for the exact file names and folders listed above. A modified or different miner won't be detected.
- **The service is stopped and deleted before the DLL confirmation prompt.** Only the DLL deletion itself is gated by the prompt.
- It does not replace antivirus. After running it, a full scan with an up-to-date scanner is a good idea.

## Disclaimer

This tool makes direct, irreversible changes to system files and services. Read the script before running it, understand what it removes, and use it at your own risk. Provided "as is" with no warranty — see [LICENSE](LICENSE).

## License

Licensed under the [MIT License](LICENSE) © 2026 SchooiCodes.