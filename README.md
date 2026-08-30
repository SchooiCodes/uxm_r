# UXM_R

**U\* XMRig Injection Miner Remover** — a Windows batch script that detects and removes a specific XMRig-based cryptomining infection ("u\*" injection xmrig miner), including its USB propagation folders and the Windows System32 service/files it installs.

```
██╗   ██╗██╗  ██╗███╗   ███╗        ██████╗  U* XMRig Injection Miner Remover
██║   ██║╚██╗██╔╝████╗ ████║        ██╔══██╗ Made by SchooiCodes
██║   ██║ ╚███╔╝ ██╔████╔██║        ██████╔╝ https://github.com/SchooiCodes/uxm_r
██║   ██║ ██╔██╗ ██║╚██╔╝██║        ██╔══██╗
╚██████╔╝██╔╝ ██╗██║ ╚═╝ ██║███████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
```

## What it does

`UXM_R.bat` walks through manual disinfection steps for PCs infected with the u\*xm injection miner:

1. **Scans connected USB drives** (letters D–Z) for a hidden `sysvolume` folder used by the malware to spread, and attempts to automatically recover the original hidden files and remove the infected folder.
2. **Checks the Windows installation** for the malware's telltale `C:\Windows\System32\wsvcz` folder to determine whether the machine is infected.
3. **Locates and stops the malicious service**, matching the malware's `u######.dll` naming pattern in `System32`, then asks for confirmation before deleting it.
4. **Finds and kills the miner executable** inside the `wsvcz` folder, asking for confirmation before terminating and deleting it.
5. **Cleans up remaining artifacts**, removing the `wsvcz` folder and the injected `svctrl64.exe` system file.

The script prompts for confirmation before destructive file deletions and logs each step with a timestamp to the console.

## Usage

1. Download or clone this repository.
2. Right-click `UXM_R.bat` and **Run as administrator** (administrator privileges are required to stop services and modify files in `System32`).
3. Follow the on-screen prompts.

```
git clone https://github.com/SchooiCodes/uxm_r.git
cd uxm_r
```

## Requirements

- Windows with `cmd.exe` and PowerShell available (PowerShell is used to identify infected USB disks).
- Administrator privileges.

## Disclaimer

This tool performs direct, irreversible modifications to system files and services (service deletion, file deletion). Use at your own risk, review the script before running it, and make sure you understand what it is removing. This project is provided "as is," with no warranty — see [LICENSE](LICENSE).

## License

Licensed under the [MIT License](LICENSE) © 2026 SchooiCodes.