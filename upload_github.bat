@echo off
title Upload ShakeLab ke GitHub
echo ============================================================
echo   UPLOAD SHAKELAB KE GITHUB
echo ============================================================
echo.
echo Pastikan Anda sudah:
echo   1. Membuat akun GitHub di https://github.com
echo   2. Membuat repository baru bernama "ShakeLab" (Public)
echo   3. Menginstal Git: https://git-scm.com/download/win
echo.
set /p GITHUB_USER=Masukkan username GitHub Anda: 
echo.

REM Cek apakah Git terinstall
where git >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git tidak terinstall.
    echo Download dari: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Buat .gitignore
echo Membuat .gitignore...
(
echo __pycache__/
echo *.pyc
echo *.pyo
echo build/
echo dist/
echo *.spec
echo *.csv
echo *.xlsx
echo *.txt
echo grafik_*.png
echo tabel_*.txt
echo data_*.csv
echo data_*.xlsx
echo ShakeLab_CodeSign.pfx
echo .gitignore
) > .gitignore_temp
move /Y .gitignore_temp .gitignore

REM Inisialisasi Git
git init
git add gui_app.py marker.py kalibrasi.py requirements.txt
git add logo.png logo.ico arrow_up.png arrow_down.png
git add app.manifest AppxManifest.xml
git add .gitignore
git commit -m "Initial commit: ShakeLab v2.4.0"

REM Set remote dan push
git remote add origin https://github.com/%GITHUB_USER%/ShakeLab.git
git branch -M main
git push -u origin main

echo.
echo BERHASIL! Kode sudah diupload ke:
echo https://github.com/%GITHUB_USER%/ShakeLab
echo.
pause
