Add-Type -AssemblyName System.IO.Compression.FileSystem
$docxPath = "C:\Users\LENOVO\.gemini\antigravity\brain\844b1524-0f60-4967-a3b4-8cf928409d07\.user_uploaded\media_1793332639139_e6cb7228.docx"
$targetDir = "C:\Users\LENOVO\.gemini\antigravity\scratch\faculty-portfolio\assets"
if (!(Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
}

$zip = [System.IO.Compression.ZipFile]::OpenRead($docxPath)
foreach ($entry in $zip.Entries) {
    if ($entry.FullName -like "word/media/*") {
        $fileName = [System.IO.Path]::GetFileName($entry.FullName)
        if ($fileName -ne "") {
            $destPath = Join-Path $targetDir $fileName
            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $destPath, $true)
            Write-Host "Extracted: $destPath ($($entry.Length) bytes)"
        }
    }
}
$zip.Dispose()

# Also copy the high quality uploaded portrait photograph
$photoSource = "C:\Users\LENOVO\.gemini\antigravity\brain\844b1524-0f60-4967-a3b4-8cf928409d07\.user_uploaded\media_1793332656089_387384fb.jpg"
$photoDest = Join-Path $targetDir "piyush_charan_profile.jpg"
Copy-Item $photoSource -Destination $photoDest -Force
Write-Host "Copied profile photo to $photoDest"

Get-ChildItem -Path $targetDir | Format-Table Name, Length
