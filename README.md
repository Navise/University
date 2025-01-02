# Laboratory Programs of Information Science and Engineering 

This repository contains a collection of all the lab programs for each semester, completed in the Department of Information Science and Engineering.

---

## Django Script Execution

To execute the PowerShell scripts for Django Lab, follow these steps:
The script is  according to lab program number with .ps1

### Option 1: Download Locally
1. Download the required `.ps1` script file to your local system.
2. Open PowerShell and navigate to the folder containing the downloaded script.
3. Run the script using:
   ```powershell
   .\<program no>.ps1

### Option 2: Run Directly via PowerShell

1. Open PowerShell on your system.

2. Run one of the following commands to fetch and execute the script directly from the repository:

   - Using `irm` (Invoke-RestMethod):
     ```powershell
     irm https://raw.githubusercontent.com/navise/university/main/django/1.ps1 | iex
     ```

     or :
     ```powershell
     Invoke-RestMethod https://raw.githubusercontent.com/navise/university/main/django/1.ps1 | Invoke-Expression
     ```
  wait for some time and this will run the 1st lab program of django.
