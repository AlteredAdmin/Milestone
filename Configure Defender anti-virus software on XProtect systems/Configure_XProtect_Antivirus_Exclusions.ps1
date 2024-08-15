# Define the drive letter for the mediadatabase location
$mediaDatabaseDrive = "D:"  # Change this to the appropriate drive letter

# Define file type exclusions
$fileTypeExclusions = @(
    '.blk', 
    '.idx', 
    '.pic', 
    '.pqz', 
    '.sts', 
    '.ts'
)

# Define folder exclusions
$folderExclusions = @(
    "$mediaDatabaseDrive\mediadatabase", 
    "C:\Program Files\Milestone\", 
    "C:\Program Files (x86)\Milestone\", 
    "C:\ProgramData\Milestone\"
)

# Add folder exclusions and subfolders
foreach ($folder in $folderExclusions) {
    Add-MpPreference -ExclusionPath $folder
}

# Add file type exclusions
foreach ($fileType in $fileTypeExclusions) {
    Add-MpPreference -ExclusionExtension $fileType
}

# Define process exclusions for all XProtect Products
$processExclusions = @(
    "VideoOS.Recorder.Service.exe",
    "VideoOS.Server.Service.exe",
    "VideoOS.Administration.exe",
    "VideoOS.Event.Server.exe",
    "VideoOS.Failover.Service.exe",
    "RecordingServer.exe",
    "ImageServer.exe",
    "ManagementApplication.exe",
    "ImageImportService.exe",
    "RecordingServerManager.exe",
    "VideoOS.ServiceControl.Service.exe",
    "VideoOS.MobileServer.Service.exe",
    "VideoOS.LPR.Server.exe"
)

# Add process exclusions
foreach ($process in $processExclusions) {
    Add-MpPreference -ExclusionProcess $process
}

# Output a message indicating completion
Write-Output "Antivirus exclusions for XProtect have been configured."
