## XProtect Antivirus Exclusion PowerShell Script

### Overview

This PowerShell script is designed to configure antivirus exclusions for Milestone XProtect Video Management Software (VMS) servers. Active high-performance databases, such as those used by XProtect, should not be scanned by antivirus software to prevent performance degradation and potential data corruption. This script automates the process of excluding specific files, folders, and processes from antivirus scans, in line with best practices recommended in the provided knowledge base (KB) article.

For more detailed information, please refer to the official Milestone KB article: [Configure anti-virus software on XProtect systems](https://supportcommunity.milestonesys.com/s/article/Configure-anti-virus-software-on-XProtect-systems?language=en_US).

### Script Functionality

The script performs the following tasks:

1. **File Type Exclusions**:
   - Adds specific file types related to XProtect to the antivirus exclusion list.
   - These file types include:
     - `.blk`
     - `.idx`
     - `.pic`
     - `.pqz`
     - `.sts`
     - `.ts`

   These files are integral to the operation of XProtect and should not be scanned by antivirus software to avoid interference with the recording and archiving processes.

2. **Folder Exclusions**:
   - Excludes important directories and their subfolders used by XProtect from antivirus scanning.
   - The key directories excluded are:
     - `C:\Program Files\Milestone\`
     - `C:\Program Files (x86)\Milestone\`
     - `C:\ProgramData\Milestone\`
   - Additionally, the `mediadatabase` directory, which contains recording databases, is excluded. This directory is typically located on a separate drive, and the script allows you to specify the drive letter for this location.

3. **Process Exclusions**:
   - Excludes essential XProtect processes from antivirus scanning to prevent performance issues.
   - The processes excluded include:
     - `VideoOS.Recorder.Service.exe`
     - `VideoOS.Server.Service.exe`
     - `VideoOS.Administration.exe`
     - `VideoOS.Event.Server.exe`
     - `VideoOS.Failover.Service.exe`
     - `RecordingServer.exe`
     - `ImageServer.exe`
     - `ManagementApplication.exe`
     - `ImageImportService.exe`
     - `RecordingServerManager.exe`
     - `VideoOS.ServiceControl.Service.exe`
     - `VideoOS.MobileServer.Service.exe`
     - `VideoOS.LPR.Server.exe`

### Usage Instructions

1. **Download and open the script**: 
   - Save the script to your server where the XProtect VMS is installed.

2. **Specify the drive letter for `mediadatabase`**:
   - At the top of the script, there is a variable named `$mediaDatabaseDrive`. Set this variable to the drive letter where your `mediadatabase` directory is located (e.g., `D:`). This ensures that the correct directory is excluded from antivirus scanning.

3. **Run the script**:
   - Open PowerShell with administrative privileges.
   - Navigate to the directory where the script is located.
   - Execute the script by typing `.\Configure_XProtect_Antivirus_Exclusions.ps1`.

4. **Verify the exclusions**:
   - After running the script, check your antivirus settings to ensure that the specified file types, folders, and processes have been correctly excluded.

### Important Notes

- **Why Exclusions Are Necessary**: 
   - The script follows recommendations from the [KB article](https://supportcommunity.milestonesys.com/s/article/Configure-anti-virus-software-on-XProtect-systems?language=en_US) that highlight the importance of excluding certain files, folders, and processes from antivirus scanning. Scanning active video databases can lead to severe performance degradation and, in some cases, corruption of video recordings.

- **Port Exclusions**: 
   - This script does not include port exclusions as they were deemed unnecessary for the specific requirements. Ensure that your network configuration and firewall rules account for the necessary ports for XProtect to function correctly.

### Customization

- **Drive Letter Configuration**:
   - You can customize the `$mediaDatabaseDrive` variable to match the specific drive where your `mediadatabase` is located. This makes the script adaptable to different system configurations.

- **Adding Additional Exclusions**:
   - If additional folders, file types, or processes need to be excluded, you can easily modify the script by adding them to the corresponding lists.

### Conclusion

By using this script, you ensure that your XProtect VMS operates optimally without interference from antivirus scans.

For more information, refer to the [official Milestone KB article](https://supportcommunity.milestonesys.com/s/article/Configure-anti-virus-software-on-XProtect-systems?language=en_US).
