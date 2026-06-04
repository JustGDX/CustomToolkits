[README.md](https://github.com/user-attachments/files/28583668/README.md)
# 🖥️ Windows Toolkit Suite
**Created by JustGDX**

A collection of lightweight, menu-driven Windows batch scripts for system diagnostics, maintenance, network management, and PC utilities — no installation required.

---

## 📦 Included Tools

| File | Description | Admin Required |
|------|-------------|:--------------:|
| `Device_Checker_Toolkit.bat` | Hardware diagnostics & system info | No |
| `WINDOWS_CLEANUP_TOOLKIT.bat` | Safe temp file & junk cleanup | Recommended |
| `PC_UTILITY_TOOLKIT.bat` | Disk, BIOS, partition & activation tools | ✅ Yes |
| `NetworkToolkit.bat` | Network diagnostics, repair & Wi-Fi tools | ✅ Yes |

---

## 🚀 How to Use

1. **Download** the `.bat` file(s) you need.
2. **Right-click** the file → **Run as Administrator** *(required for some tools)*.
3. **Select an option** from the interactive menu using number keys.
4. Follow any on-screen prompts.

> ⚠️ Windows may show a SmartScreen warning for unsigned batch files. Click **More info → Run anyway** to proceed.

---

## 🔍 Tool Breakdown

### 1. Device Checker Toolkit
> `Device_Checker_Toolkit.bat`

A read-only hardware inspection tool. Pulls live data from Windows built-in commands — nothing is modified.

**Features:**
- System information overview (`systeminfo`)
- Disk model and health status
- RAM capacity, speed, and manufacturer
- CPU name, clock speed, and core count
- Battery health report (saves to `battery-report.html`)
- Network status and connectivity ping
- Full quick scan (runs all checks at once)

---

### 2. Windows Cleanup Toolkit
> `WINDOWS_CLEANUP_TOOLKIT.bat`

Safely removes junk files that accumulate over time. Each action has a confirmation prompt before executing.

**Cleans:**
- User temp files (`%TEMP%`)
- Windows temp files (`C:\Windows\Temp`)
- Prefetch cache (`C:\Windows\Prefetch`)
- Recycle Bin contents

**Does NOT touch:**
- Personal documents or files
- Installed programs or drivers
- System or registry files

---

### 3. PC Utility Toolkit
> `PC_UTILITY_TOOLKIT.bat`

Advanced system utility tool. Auto-requests Administrator elevation on launch.

**Features:**
- GPT vs MBR partition detection (via `diskpart`)
- UEFI vs Legacy BIOS detection (via `bcdedit`)
- Disk Management GUI launcher
- SMART disk health status
- Detailed system specs (CPU, RAM, GPU, storage, BIOS)
- Windows activation status check (`slmgr`)
- Diskpart format command reference guide
- Rufus bootable USB guide with BIOS key reference

---

### 4. Advanced Network Toolkit v3.0
> `NetworkToolkit.bat`

Comprehensive network diagnostics and repair tool. Auto-exits if not run as Administrator.

**Diagnostics:**
- Full IP configuration (`ipconfig /all`)
- Ping tests (Google DNS & domain)
- Traceroute (`tracert`)
- DNS lookup (`nslookup`)
- Active connections (`netstat -ano`)
- ARP cache and routing table

**Repair:**
- Flush DNS cache
- Release and renew IP address
- Winsock reset
- TCP/IP stack reset
- Windows Network Troubleshooter

**Wi-Fi Tools:**
- View saved Wi-Fi profiles
- Interface and driver info
- Open Wi-Fi settings directly

**Reports:**
- Network adapter status (PowerShell)
- MAC address lookup
- Full network report export to `Network_Report.txt`

---

## ✅ Safety Notes

- **No data is collected.** All scripts run locally and offline.
- **No system files are modified** by the Device Checker or diagnostic tools.
- Cleanup actions require **manual confirmation** before executing.
- Scripts use only **built-in Windows commands** (`wmic`, `ipconfig`, `netsh`, `diskpart`, etc.) — no third-party dependencies.

---

## 🛠️ Requirements

- **OS:** Windows 10 / 11
- **Dependencies:** None (uses built-in Windows tools only)
- **Privileges:** Administrator rights required for `PC_UTILITY_TOOLKIT.bat` and `NetworkToolkit.bat`

---

## 📁 File Structure

```
Windows-Toolkit-Suite/
├── Device_Checker_Toolkit.bat
├── WINDOWS_CLEANUP_TOOLKIT.bat
├── PC_UTILITY_TOOLKIT.bat
├── NetworkToolkit.bat
└── README.md
```

---

## 📄 License

These scripts are free to use and modify for personal use. Credit to **JustGDX** appreciated but not required.

---

*Built with plain Windows Batch scripting — no PowerShell modules, no third-party tools, no bloat.*
