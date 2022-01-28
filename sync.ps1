git clone --depth=1 https://github.com/rust-lang/cargo.git
Set-Location "./cargo"
git log -n1 --format=format:"%H%n%ai" | Out-File -FilePath "../commit-hash.txt"
Set-Location ".."
Remove-Item -Force -r "./doc"
Move-Item -Force "./cargo/src/doc" "./doc"
Remove-Item -Force -r "./cargo"
git add .
$DATE = Get-Date -Format 'yyyy-m-d-H-m-s'
git commit -m "$DATE"