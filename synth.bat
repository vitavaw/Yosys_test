@echo off
call ..\oss-cad-suite\environment.bat
cd /d "%~dp0"
yosys synth.ys counter.sv
