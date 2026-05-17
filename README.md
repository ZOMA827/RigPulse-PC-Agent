# ⚡ RigPulse PRO - Cloud Telemetry System

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-a08021?style=for-the-badge&logo=firebase&logoColor=ffcd34)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Socket.io](https://img.shields.io/badge/Socket.io-black?style=for-the-badge&logo=socket.io&badgeColor=010101)

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

### 1. Setting up the PC Agent (Desktop)
1. Navigate to the **Releases** section of this repository.
2. Download the latest `pcAgent.exe` file.
3. Run `pcAgent.exe` on your gaming PC (Run as Administrator is recommended for killing tasks).
4. The agent will automatically start a local server and begin broadcasting hardware metrics.

### 2. Setting up the Mobile App (Android/iOS)
1. Clone this repository:
   ```bash
   git clone [https://github.com/YOUR_USERNAME/RigPulse-App-Flutter.git](https://github.com/YOUR_USERNAME/RigPulse-App-Flutter.git)
