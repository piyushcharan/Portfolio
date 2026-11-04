$dir = "C:\Users\LENOVO\.gemini\antigravity\scratch\faculty-portfolio\assets"
if (Test-Path "$dir\image5.jpeg") {
    Copy-Item "$dir\image5.jpeg" "$dir\engineers_day_award.jpeg" -Force
}
if (Test-Path "$dir\image4.png") {
    Copy-Item "$dir\image4.png" "$dir\google_educator_badges.png" -Force
}
if (Test-Path "$dir\image6.jpeg") {
    Copy-Item "$dir\image6.jpeg" "$dir\signature.jpeg" -Force
}
if (Test-Path "C:\Users\LENOVO\.gemini\antigravity\brain\844b1524-0f60-4967-a3b4-8cf928409d07\.user_uploaded\media_1793332656089_387384fb.jpg") {
    Copy-Item "C:\Users\LENOVO\.gemini\antigravity\brain\844b1524-0f60-4967-a3b4-8cf928409d07\.user_uploaded\media_1793332656089_387384fb.jpg" "$dir\piyush_charan_profile.jpg" -Force
}
Get-ChildItem $dir | Select-Object Name, Length
