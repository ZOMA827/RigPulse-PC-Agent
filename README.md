# ⚡ RigPulse PRO - Cloud Telemetry System

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-a08021?style=for-the-badge&logo=firebase&logoColor=ffcd34)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Socket.io](https://img.shields.io/badge/Socket.io-black?style=for-the-badge&logo=socket.io&badgeColor=010101)

<div align="center">
  <h3>📥 Download Latest Release (v1.0.0)</h3>
  <a href="https://github.com/ZOMA827/RigPulse-PC-Agent/releases/download/v1.0.0/RigPulsePro.apk">
    <img src="https://img.shields.io/badge/Download-Android_APK-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Download APK" height="40" />
  </a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://github.com/ZOMA827/RigPulse-PC-Agent/releases/download/v1.0.0/pcAgent.exe">
    <img src="https://img.shields.io/badge/Download-PC_Agent_EXE-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Download EXE" height="40" />
  </a>
</div>

<br>

**RigPulse PRO** is an advanced, real-time PC hardware telemetry and cloud control system. Built entirely from scratch, it bridges a futuristic Flutter mobile HUD with a robust Python PC Agent, allowing users to monitor and control their desktop performance remotely via Google Cloud Authentication.

---

## 🚀 Key Features

* **🌌 Cyberpunk Holographic UI:** A meticulously designed interface featuring neon glows, glassmorphism, and smooth animations.
* **📊 Real-Time Telemetry HUD:** Monitor CPU/GPU temps, usage, VRAM allocation, fan speeds, and live FPS with zero latency.
* **🗂️ Smart Task Manager:** View running PC processes grouped by RAM/CPU usage and kill them remotely directly from your phone.
* **🛡️ Smart Alerts & Automation:** Set custom thermal thresholds (e.g., 85°C) to trigger haptic feedback and visual alarms on the mobile app.
* **☁️ Secure Cloud Link:** Powered by Firebase Google Sign-In, ensuring that only the authorized commander can access the PC data.

---

## 🏗️ System Architecture

The project consists of two main components:
1. **The Mobile App (Flutter):** Acts as the remote command center.
2. **The PC Agent (Python/.exe):** Runs silently on the desktop, gathers hardware metrics (using libraries like `psutil`, `GPUtil`), and broadcasts them via a local `Socket.IO` server.

---

## ⚙️ Installation & Setup Guide

### 1. Quick Install (Recommended)
* **Mobile App:** Click the green **Download APK** button above, or [download it here](https://github.com/ZOMA827/RigPulse-PC-Agent/releases/download/v1.0.0/RigPulsePro.apk), and install it on your Android device.
* **PC Agent:** Click the blue **Download EXE** button above, or [download it here](https://github.com/ZOMA827/RigPulse-PC-Agent/releases/download/v1.0.0/pcAgent.exe), and run it as Administrator on your gaming rig.

### 2. Build from Source
If you want to build the Flutter app yourself:
1. Clone this repository:
   ```bash
   git clone [https://github.com/ZOMA827/RigPulse-PC-Agent.git](https://github.com/ZOMA827/RigPulse-PC-Agent.git)
