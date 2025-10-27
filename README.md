# WSL (Windows Subsystem for Linux)
## Table of Contents
- [1. Overview](#1-overview)
- [2. Requirements](#2-requirements)
- [3. How to Install](#3-how-to-install)
    - [3.1. Enable features](#31-enable-features)
    - [3.2. Install Ubuntu](#32-install-ubuntu)
    - [3.3. Basic navigation to Windows drives](#33-basic-navigation-to-windows-drive)

## 1. Overview
- **WSL2** lets you run a real Linux kernel on Windows with excellent integration (terminal, file access, and VS Code). It’s ideal for learning Bash, C/C++, CMake, Neovim, and common dev workflows.

## 2. Requirements
- Windows 11 (recommended) 
- Run PowerShell as **Administrator** for installation steps

## 3. How to Install
### 3.1. Enable features 
- First, searching for **Turn Windows features on or off** on Windows, enable 2 options:
    - Virtual Machine Platform.
    - Windows Subsystem for Linux.
    >*This step will require to restart the computer.*
### 3.2. Install Ubuntu
- Open **Command Prompt**, type `wsl.exe --install ubuntu` to install.
- Type `wsl --status` to check the version.
### 3.3. Basic navigation to Windows drives
- Go to searching bar, type `ubuntu` and hit enter, it'll open the ubuntu cmd. For the first time, it'll tell to enter Linux username and password.
- It'll shows something like **hieudo@LAPTOP-4HKNNFF2:**, and we want to go to **C:/** or **D:/** hard disk on Windows, follow the steps below:
    ```bash
    $ cd ../..  # go to root folder
    $ cd mnt    # go to mounting hard disk
    
    # Now we can choose the hard disk to get in
    $ cd c      # go to C:/ hard disk
    # or
    $ cd d      # go to D:/ hard disk
    ```
- Faster way (when open the new unbuntu cmd)
    ```bash
    $ cd /mnt/c
    # or
    $ cd /mnt/d
    ```
