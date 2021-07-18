@echo off
color 0F
title Servidor de Gunbound (Feito por Thalles Tutoriais) - Youtube.com/VideosTutoriais
@setlocal enableextensions
@cd /d "%~dp0"


:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Solicitando privilegios de administrador...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"
:--------------------------------------


::IDENTIFICA IP DO SERVIDOR
set ip=127.0.0.1
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do (
echo.%ip% | FIND /I ".">Nul && (
set "ip=%%a"
)
)

start /min HTTP\bin\httpd_gb.exe

:: CRIAR ARQUIVOS NECESSARIOS

:: PASTA DE ARQUIVOS TEMPORARIOS
if not exist "Temporarios" (
mkdir Temporarios
)

:: Temporarios\TXT_Contas.txt
if not exist Temporarios\TXT_Contas.txt (
echo []> Temporarios\TXT_Contas.txt
)
:: Temporarios\TXT_Bots.txt
if not exist Temporarios\TXT_Bots.txt (
echo [> Temporarios\TXT_Bots.txt
echo {"id": "Jesus", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Lucas", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Ricardo", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Evandro", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Alex", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Charlie", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Bruce", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Thiago", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Lopes", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Algusto", "genero": "m"},>> Temporarios\TXT_Bots.txt
echo {"id": "Thais", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Joana", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Cris", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Tati", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Debora", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Adriana", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Rita", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Patricia", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Maria", "genero": "f"},>> Temporarios\TXT_Bots.txt
echo {"id": "Amanda", "genero": "f"}>> Temporarios\TXT_Bots.txt
echo ]>> Temporarios\TXT_Bots.txt
)
:: Temporarios\TXT_Bots.txt
echo [> Temporarios\TXT_Mapas.txt
echo {"map_id": 0,"map_name_en": "CAVE (RANDOM)","positions_a_side": [{"slot_index": 0, "x_min": 183, "x_max": 358, "y": null}, {"slot_index": 1, "x_min": 476, "x_max": 668, "y": null}, {"slot_index": 2, "x_min": 757, "x_max": 850, "y": null}, {"slot_index": 3, "x_min": 899, "x_max": 1064, "y": null}, {"slot_index": 4, "x_min": 1157, "x_max": 1239, "y": null}, {"slot_index": 5, "x_min": 1303, "x_max": 1366, "y": null}, {"slot_index": 6, "x_min": 1445, "x_max": 1562, "y": null}, {"slot_index": 7, "x_min": 1634, "x_max": 1634, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 608, "x_max": 682, "y": null}, {"slot_index": 1, "x_min": 682, "x_max": 756, "y": null}, {"slot_index": 2, "x_min": 756, "x_max": 828, "y": null}, {"slot_index": 3, "x_min": 828, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 978, "y": null}, {"slot_index": 5, "x_min": 978, "x_max": 1050, "y": null}, {"slot_index": 6, "x_min": 1050, "x_max": 1122, "y": null}, {"slot_index": 7, "x_min": 1122, "x_max": 1192, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 608, "x_max": 682, "y": null}, {"slot_index": 1, "x_min": 682, "x_max": 756, "y": null}, {"slot_index": 2, "x_min": 756, "x_max": 828, "y": null}, {"slot_index": 3, "x_min": 828, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 978, "y": null}, {"slot_index": 5, "x_min": 978, "x_max": 1050, "y": null}, {"slot_index": 6, "x_min": 1050, "x_max": 1122, "y": null}, {"slot_index": 7, "x_min": 1122, "x_max": 1192, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 608, "x_max": 682, "y": null}, {"slot_index": 1, "x_min": 682, "x_max": 756, "y": null}, {"slot_index": 2, "x_min": 756, "x_max": 828, "y": null}, {"slot_index": 3, "x_min": 828, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 978, "y": null}, {"slot_index": 5, "x_min": 978, "x_max": 1050, "y": null}, {"slot_index": 6, "x_min": 1050, "x_max": 1122, "y": null}, {"slot_index": 7, "x_min": 1122, "x_max": 1192, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 608, "x_max": 682, "y": null}, {"slot_index": 1, "x_min": 682, "x_max": 756, "y": null}, {"slot_index": 2, "x_min": 756, "x_max": 828, "y": null}, {"slot_index": 3, "x_min": 828, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 978, "y": null}, {"slot_index": 5, "x_min": 978, "x_max": 1050, "y": null}, {"slot_index": 6, "x_min": 1050, "x_max": 1122, "y": null}, {"slot_index": 7, "x_min": 1122, "x_max": 1192, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 1,"map_name_en": "MIRAMO TOWN","positions_a_side": [{"slot_index": 0, "x_min": 154, "x_max": 350, "y": null}, {"slot_index": 1, "x_min": 350, "x_max": 536, "y": null}, {"slot_index": 2, "x_min": 536, "x_max": 722, "y": null}, {"slot_index": 3, "x_min": 722, "x_max": 924, "y": null}, {"slot_index": 4, "x_min": 924, "x_max": 1112, "y": null}, {"slot_index": 5, "x_min": 1112, "x_max": 1304, "y": null}, {"slot_index": 6, "x_min": 1304, "x_max": 1496, "y": null}, {"slot_index": 7, "x_min": 1496, "x_max": 1676, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 231, "x_max": 231, "y": null}, {"slot_index": 1, "x_min": 484, "x_max": 484, "y": null}, {"slot_index": 2, "x_min": 776, "x_max": 776, "y": null}, {"slot_index": 3, "x_min": 796, "x_max": 796, "y": null}, {"slot_index": 4, "x_min": 1020, "x_max": 1020, "y": null}, {"slot_index": 5, "x_min": 1235, "x_max": 1235, "y": null}, {"slot_index": 6, "x_min": 1393, "x_max": 1393, "y": null}, {"slot_index": 7, "x_min": 1528, "x_max": 1528, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 154, "x_max": 350, "y": null}, {"slot_index": 1, "x_min": 350, "x_max": 536, "y": null}, {"slot_index": 2, "x_min": 536, "x_max": 722, "y": null}, {"slot_index": 3, "x_min": 722, "x_max": 924, "y": null}, {"slot_index": 4, "x_min": 924, "x_max": 1112, "y": null}, {"slot_index": 5, "x_min": 1112, "x_max": 1304, "y": null}, {"slot_index": 6, "x_min": 1304, "x_max": 1496, "y": null}, {"slot_index": 7, "x_min": 1496, "x_max": 1676, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 154, "x_max": 350, "y": null}, {"slot_index": 1, "x_min": 350, "x_max": 536, "y": null}, {"slot_index": 2, "x_min": 536, "x_max": 722, "y": null}, {"slot_index": 3, "x_min": 722, "x_max": 924, "y": null}, {"slot_index": 4, "x_min": 924, "x_max": 1112, "y": null}, {"slot_index": 5, "x_min": 1112, "x_max": 1304, "y": null}, {"slot_index": 6, "x_min": 1304, "x_max": 1496, "y": null}, {"slot_index": 7, "x_min": 1496, "x_max": 1676, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 154, "x_max": 350, "y": null}, {"slot_index": 1, "x_min": 350, "x_max": 536, "y": null}, {"slot_index": 2, "x_min": 536, "x_max": 722, "y": null}, {"slot_index": 3, "x_min": 722, "x_max": 924, "y": null}, {"slot_index": 4, "x_min": 924, "x_max": 1112, "y": null}, {"slot_index": 5, "x_min": 1112, "x_max": 1304, "y": null}, {"slot_index": 6, "x_min": 1304, "x_max": 1496, "y": null}, {"slot_index": 7, "x_min": 1496, "x_max": 1676, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 2,"map_name_en": "NIRVANA","positions_a_side": [{"slot_index": 0, "x_min": 52, "x_max": 240, "y": null}, {"slot_index": 1, "x_min": 240, "x_max": 424, "y": null}, {"slot_index": 2, "x_min": 424, "x_max": 612, "y": null}, {"slot_index": 3, "x_min": 612, "x_max": 800, "y": null}, {"slot_index": 4, "x_min": 800, "x_max": 988, "y": null}, {"slot_index": 5, "x_min": 988, "x_max": 1174, "y": null}, {"slot_index": 6, "x_min": 1174, "x_max": 1376, "y": null}, {"slot_index": 7, "x_min": 1376, "x_max": 1550, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 475, "x_max": 475, "y": null}, {"slot_index": 1, "x_min": 866, "x_max": 866, "y": null}, {"slot_index": 2, "x_min": 1118, "x_max": 1118, "y": null}, {"slot_index": 3, "x_min": 689, "x_max": 689, "y": null}, {"slot_index": 4, "x_min": 946, "x_max": 946, "y": null}, {"slot_index": 5, "x_min": 623, "x_max": 623, "y": 1000}, {"slot_index": 6, "x_min": 771, "x_max": 771, "y": 1000}, {"slot_index": 7, "x_min": 1023, "x_max": 1100, "y": 1053}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 52, "x_max": 240, "y": null}, {"slot_index": 1, "x_min": 240, "x_max": 424, "y": null}, {"slot_index": 2, "x_min": 424, "x_max": 612, "y": null}, {"slot_index": 3, "x_min": 612, "x_max": 800, "y": null}, {"slot_index": 4, "x_min": 800, "x_max": 988, "y": null}, {"slot_index": 5, "x_min": 988, "x_max": 1174, "y": null}, {"slot_index": 6, "x_min": 1174, "x_max": 1376, "y": null}, {"slot_index": 7, "x_min": 1376, "x_max": 1550, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 52, "x_max": 240, "y": null}, {"slot_index": 1, "x_min": 240, "x_max": 424, "y": null}, {"slot_index": 2, "x_min": 424, "x_max": 612, "y": null}, {"slot_index": 3, "x_min": 612, "x_max": 800, "y": null}, {"slot_index": 4, "x_min": 800, "x_max": 988, "y": null}, {"slot_index": 5, "x_min": 988, "x_max": 1174, "y": null}, {"slot_index": 6, "x_min": 1174, "x_max": 1376, "y": null}, {"slot_index": 7, "x_min": 1376, "x_max": 1550, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 52, "x_max": 240, "y": null}, {"slot_index": 1, "x_min": 240, "x_max": 424, "y": null}, {"slot_index": 2, "x_min": 424, "x_max": 612, "y": null}, {"slot_index": 3, "x_min": 612, "x_max": 800, "y": null}, {"slot_index": 4, "x_min": 800, "x_max": 988, "y": null}, {"slot_index": 5, "x_min": 988, "x_max": 1174, "y": null}, {"slot_index": 6, "x_min": 1174, "x_max": 1376, "y": null}, {"slot_index": 7, "x_min": 1376, "x_max": 1550, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 3,"map_name_en": "METROPOLIS","positions_a_side": [{"slot_index": 0, "x_min": 51, "x_max": 219, "y": null}, {"slot_index": 1, "x_min": 219, "x_max": 498, "y": null}, {"slot_index": 2, "x_min": 498, "x_max": 732, "y": null}, {"slot_index": 3, "x_min": 732, "x_max": 897, "y": null}, {"slot_index": 4, "x_min": 897, "x_max": 1065, "y": null}, {"slot_index": 5, "x_min": 1065, "x_max": 1302, "y": null}, {"slot_index": 6, "x_min": 1302, "x_max": 1572, "y": null}, {"slot_index": 7, "x_min": 1572, "x_max": 1743, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 384, "x_max": 384, "y": null}, {"slot_index": 1, "x_min": 532, "x_max": 532, "y": null}, {"slot_index": 2, "x_min": 620, "x_max": 620, "y": null}, {"slot_index": 3, "x_min": 746, "x_max": 746, "y": null}, {"slot_index": 4, "x_min": 985, "x_max": 985, "y": null}, {"slot_index": 5, "x_min": 1111, "x_max": 1111, "y": null}, {"slot_index": 6, "x_min": 1274, "x_max": 1274, "y": null}, {"slot_index": 7, "x_min": 1319, "x_max": 1319, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 51, "x_max": 219, "y": null}, {"slot_index": 1, "x_min": 219, "x_max": 498, "y": null}, {"slot_index": 2, "x_min": 498, "x_max": 732, "y": null}, {"slot_index": 3, "x_min": 732, "x_max": 897, "y": null}, {"slot_index": 4, "x_min": 897, "x_max": 1065, "y": null}, {"slot_index": 5, "x_min": 1065, "x_max": 1302, "y": null}, {"slot_index": 6, "x_min": 1302, "x_max": 1572, "y": null}, {"slot_index": 7, "x_min": 1572, "x_max": 1743, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 51, "x_max": 219, "y": null}, {"slot_index": 1, "x_min": 219, "x_max": 498, "y": null}, {"slot_index": 2, "x_min": 498, "x_max": 732, "y": null}, {"slot_index": 3, "x_min": 732, "x_max": 897, "y": null}, {"slot_index": 4, "x_min": 897, "x_max": 1065, "y": null}, {"slot_index": 5, "x_min": 1065, "x_max": 1302, "y": null}, {"slot_index": 6, "x_min": 1302, "x_max": 1572, "y": null}, {"slot_index": 7, "x_min": 1572, "x_max": 1743, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 51, "x_max": 219, "y": null}, {"slot_index": 1, "x_min": 219, "x_max": 498, "y": null}, {"slot_index": 2, "x_min": 498, "x_max": 732, "y": null}, {"slot_index": 3, "x_min": 732, "x_max": 897, "y": null}, {"slot_index": 4, "x_min": 897, "x_max": 1065, "y": null}, {"slot_index": 5, "x_min": 1065, "x_max": 1302, "y": null}, {"slot_index": 6, "x_min": 1302, "x_max": 1572, "y": null}, {"slot_index": 7, "x_min": 1572, "x_max": 1743, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 4,"map_name_en": "SEA OF HERO","positions_a_side": [{"slot_index": 0, "x_min": 26, "x_max": 122, "y": null}, {"slot_index": 1, "x_min": 190, "x_max": 292, "y": null}, {"slot_index": 2, "x_min": 462, "x_max": 572, "y": null}, {"slot_index": 3, "x_min": 608, "x_max": 724, "y": null}, {"slot_index": 4, "x_min": 880, "x_max": 984, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1118, "y": null}, {"slot_index": 6, "x_min": 1268, "x_max": 1378, "y": null}, {"slot_index": 7, "x_min": 1446, "x_max": 1556, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 160, "x_max": 160, "y": null}, {"slot_index": 1, "x_min": 352, "x_max": 352, "y": null}, {"slot_index": 2, "x_min": 537, "x_max": 537, "y": null}, {"slot_index": 3, "x_min": 698, "x_max": 698, "y": null}, {"slot_index": 4, "x_min": 898, "x_max": 898, "y": null}, {"slot_index": 5, "x_min": 1056, "x_max": 1056, "y": null}, {"slot_index": 6, "x_min": 1303, "x_max": 1303, "y": null}, {"slot_index": 7, "x_min": 1409, "x_max": 1409, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 26, "x_max": 122, "y": null}, {"slot_index": 1, "x_min": 190, "x_max": 292, "y": null}, {"slot_index": 2, "x_min": 462, "x_max": 572, "y": null}, {"slot_index": 3, "x_min": 608, "x_max": 724, "y": null}, {"slot_index": 4, "x_min": 880, "x_max": 984, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1118, "y": null}, {"slot_index": 6, "x_min": 1268, "x_max": 1378, "y": null}, {"slot_index": 7, "x_min": 1446, "x_max": 1556, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 26, "x_max": 122, "y": null}, {"slot_index": 1, "x_min": 190, "x_max": 292, "y": null}, {"slot_index": 2, "x_min": 462, "x_max": 572, "y": null}, {"slot_index": 3, "x_min": 608, "x_max": 724, "y": null}, {"slot_index": 4, "x_min": 880, "x_max": 984, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1118, "y": null}, {"slot_index": 6, "x_min": 1268, "x_max": 1378, "y": null}, {"slot_index": 7, "x_min": 1446, "x_max": 1556, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 26, "x_max": 122, "y": null}, {"slot_index": 1, "x_min": 190, "x_max": 292, "y": null}, {"slot_index": 2, "x_min": 462, "x_max": 572, "y": null}, {"slot_index": 3, "x_min": 608, "x_max": 724, "y": null}, {"slot_index": 4, "x_min": 880, "x_max": 984, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1118, "y": null}, {"slot_index": 6, "x_min": 1268, "x_max": 1378, "y": null}, {"slot_index": 7, "x_min": 1446, "x_max": 1556, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 5,"map_name_en": "ADIUMROOT","positions_a_side": [{"slot_index": 0, "x_min": 26, "x_max": 230, "y": null}, {"slot_index": 1, "x_min": 230, "x_max": 428, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 640, "y": null}, {"slot_index": 3, "x_min": 640, "x_max": 874, "y": null}, {"slot_index": 4, "x_min": 874, "x_max": 1108, "y": null}, {"slot_index": 5, "x_min": 1108, "x_max": 1340, "y": null}, {"slot_index": 6, "x_min": 1340, "x_max": 1552, "y": null}, {"slot_index": 7, "x_min": 1552, "x_max": 1760, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 939, "x_max": 939, "y": 771}, {"slot_index": 1, "x_min": 1030, "x_max": 1030, "y": 801}, {"slot_index": 2, "x_min": 902, "x_max": 902, "y": 869}, {"slot_index": 3, "x_min": 809, "x_max": 809, "y": 902}, {"slot_index": 4, "x_min": 989, "x_max": 989, "y": 1008}, {"slot_index": 5, "x_min": 1061, "x_max": 1061, "y": 1030}, {"slot_index": 6, "x_min": 856, "x_max": 856, "y": 1104}, {"slot_index": 7, "x_min": 763, "x_max": 763, "y": 1134}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 26, "x_max": 230, "y": null}, {"slot_index": 1, "x_min": 230, "x_max": 428, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 640, "y": null}, {"slot_index": 3, "x_min": 640, "x_max": 874, "y": null}, {"slot_index": 4, "x_min": 874, "x_max": 1108, "y": null}, {"slot_index": 5, "x_min": 1108, "x_max": 1340, "y": null}, {"slot_index": 6, "x_min": 1340, "x_max": 1552, "y": null}, {"slot_index": 7, "x_min": 1552, "x_max": 1760, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 26, "x_max": 230, "y": null}, {"slot_index": 1, "x_min": 230, "x_max": 428, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 640, "y": null}, {"slot_index": 3, "x_min": 640, "x_max": 874, "y": null}, {"slot_index": 4, "x_min": 874, "x_max": 1108, "y": null}, {"slot_index": 5, "x_min": 1108, "x_max": 1340, "y": null}, {"slot_index": 6, "x_min": 1340, "x_max": 1552, "y": null}, {"slot_index": 7, "x_min": 1552, "x_max": 1760, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 26, "x_max": 230, "y": null}, {"slot_index": 1, "x_min": 230, "x_max": 428, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 640, "y": null}, {"slot_index": 3, "x_min": 640, "x_max": 874, "y": null}, {"slot_index": 4, "x_min": 874, "x_max": 1108, "y": null}, {"slot_index": 5, "x_min": 1108, "x_max": 1340, "y": null}, {"slot_index": 6, "x_min": 1340, "x_max": 1552, "y": null}, {"slot_index": 7, "x_min": 1552, "x_max": 1760, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 6,"map_name_en": "DRAGON","positions_a_side": [{"slot_index": 0, "x_min": 70, "x_max": 188, "y": null}, {"slot_index": 1, "x_min": 244, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 378, "x_max": 490, "y": null}, {"slot_index": 3, "x_min": 540, "x_max": 618, "y": null}, {"slot_index": 4, "x_min": 1182, "x_max": 1274, "y": null}, {"slot_index": 5, "x_min": 1328, "x_max": 1416, "y": null}, {"slot_index": 6, "x_min": 1472, "x_max": 1558, "y": null}, {"slot_index": 7, "x_min": 1622, "x_max": 1718, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 434, "x_max": 434, "y": null}, {"slot_index": 1, "x_min": 521, "x_max": 521, "y": null}, {"slot_index": 2, "x_min": 591, "x_max": 591, "y": null}, {"slot_index": 3, "x_min": 860, "x_max": 860, "y": null}, {"slot_index": 4, "x_min": 975, "x_max": 975, "y": null}, {"slot_index": 5, "x_min": 1055, "x_max": 1055, "y": null}, {"slot_index": 6, "x_min": 1289, "x_max": 1289, "y": null}, {"slot_index": 7, "x_min": 1440, "x_max": 1440, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 70, "x_max": 188, "y": null}, {"slot_index": 1, "x_min": 244, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 378, "x_max": 490, "y": null}, {"slot_index": 3, "x_min": 540, "x_max": 618, "y": null}, {"slot_index": 4, "x_min": 1182, "x_max": 1274, "y": null}, {"slot_index": 5, "x_min": 1328, "x_max": 1416, "y": null}, {"slot_index": 6, "x_min": 1472, "x_max": 1558, "y": null}, {"slot_index": 7, "x_min": 1622, "x_max": 1718, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 70, "x_max": 188, "y": null}, {"slot_index": 1, "x_min": 244, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 378, "x_max": 490, "y": null}, {"slot_index": 3, "x_min": 540, "x_max": 618, "y": null}, {"slot_index": 4, "x_min": 1182, "x_max": 1274, "y": null}, {"slot_index": 5, "x_min": 1328, "x_max": 1416, "y": null}, {"slot_index": 6, "x_min": 1472, "x_max": 1558, "y": null}, {"slot_index": 7, "x_min": 1622, "x_max": 1718, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 70, "x_max": 188, "y": null}, {"slot_index": 1, "x_min": 244, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 378, "x_max": 490, "y": null}, {"slot_index": 3, "x_min": 540, "x_max": 618, "y": null}, {"slot_index": 4, "x_min": 1182, "x_max": 1274, "y": null}, {"slot_index": 5, "x_min": 1328, "x_max": 1416, "y": null}, {"slot_index": 6, "x_min": 1472, "x_max": 1558, "y": null}, {"slot_index": 7, "x_min": 1622, "x_max": 1718, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 7,"map_name_en": "COZYTOWER","positions_a_side": [{"slot_index": 0, "x_min": 120, "x_max": 222, "y": null}, {"slot_index": 1, "x_min": 222, "x_max": 324, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 614, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 1192, "y": null}, {"slot_index": 5, "x_min": 1230, "x_max": 1378, "y": null}, {"slot_index": 6, "x_min": 1484, "x_max": 1590, "y": null}, {"slot_index": 7, "x_min": 1590, "x_max": 1688, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 203, "x_max": 203, "y": null}, {"slot_index": 1, "x_min": 411, "x_max": 411, "y": null}, {"slot_index": 2, "x_min": 611, "x_max": 611, "y": null}, {"slot_index": 3, "x_min": 810, "x_max": 810, "y": null}, {"slot_index": 4, "x_min": 996, "x_max": 996, "y": null}, {"slot_index": 5, "x_min": 1193, "x_max": 1193, "y": null}, {"slot_index": 6, "x_min": 1394, "x_max": 1394, "y": null}, {"slot_index": 7, "x_min": 1592, "x_max": 1592, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 120, "x_max": 222, "y": null}, {"slot_index": 1, "x_min": 222, "x_max": 324, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 614, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 1192, "y": null}, {"slot_index": 5, "x_min": 1230, "x_max": 1378, "y": null}, {"slot_index": 6, "x_min": 1484, "x_max": 1590, "y": null}, {"slot_index": 7, "x_min": 1590, "x_max": 1688, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 120, "x_max": 222, "y": null}, {"slot_index": 1, "x_min": 222, "x_max": 324, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 614, "x_max": 902, "y": null}, {"slot_index": 4, "x_min": 902, "x_max": 1192, "y": null}, {"slot_index": 5, "x_min": 1230, "x_max": 1378, "y": null}, {"slot_index": 6, "x_min": 1484, "x_max": 1590, "y": null}, {"slot_index": 7, "x_min": 1590, "x_max": 1688, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 120, "x_max": 324, "y": null}, {"slot_index": 1, "x_min": 120, "x_max": 324, "y": null}, {"slot_index": 2, "x_min": 428, "x_max": 1378, "y": null}, {"slot_index": 3, "x_min": 428, "x_max": 1378, "y": null}, {"slot_index": 4, "x_min": 428, "x_max": 1378, "y": null}, {"slot_index": 5, "x_min": 428, "x_max": 1378, "y": null}, {"slot_index": 6, "x_min": 1484, "x_max": 1688, "y": null}, {"slot_index": 7, "x_min": 1484, "x_max": 1688, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 8,"map_name_en": "DUMMY SLOPE","positions_a_side": [{"slot_index": 0, "x_min": 120, "x_max": 208, "y": null}, {"slot_index": 1, "x_min": 234, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 442, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 600, "x_max": 722, "y": null}, {"slot_index": 4, "x_min": 876, "x_max": 986, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1106, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1324, "y": null}, {"slot_index": 7, "x_min": 1346, "x_max": 1472, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 308, "x_max": 308, "y": 971}, {"slot_index": 1, "x_min": 250, "x_max": 250, "y": 1081}, {"slot_index": 2, "x_min": 379, "x_max": 379, "y": 1176}, {"slot_index": 3, "x_min": 619, "x_max": 619, "y": 1191}, {"slot_index": 4, "x_min": 1257, "x_max": 1257, "y": 976}, {"slot_index": 5, "x_min": 1384, "x_max": 1384, "y": 1086}, {"slot_index": 6, "x_min": 1140, "x_max": 1140, "y": 1176}, {"slot_index": 7, "x_min": 962, "x_max": 962, "y": 1193}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 120, "x_max": 208, "y": null}, {"slot_index": 1, "x_min": 234, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 442, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 600, "x_max": 722, "y": null}, {"slot_index": 4, "x_min": 876, "x_max": 986, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1106, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1324, "y": null}, {"slot_index": 7, "x_min": 1346, "x_max": 1472, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 120, "x_max": 208, "y": null}, {"slot_index": 1, "x_min": 234, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 442, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 600, "x_max": 722, "y": null}, {"slot_index": 4, "x_min": 876, "x_max": 986, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1106, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1324, "y": null}, {"slot_index": 7, "x_min": 1346, "x_max": 1472, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 120, "x_max": 208, "y": null}, {"slot_index": 1, "x_min": 234, "x_max": 334, "y": null}, {"slot_index": 2, "x_min": 442, "x_max": 570, "y": null}, {"slot_index": 3, "x_min": 600, "x_max": 722, "y": null}, {"slot_index": 4, "x_min": 876, "x_max": 986, "y": null}, {"slot_index": 5, "x_min": 1004, "x_max": 1106, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1324, "y": null}, {"slot_index": 7, "x_min": 1346, "x_max": 1472, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 9,"map_name_en": "STARDUST","positions_a_side": [{"slot_index": 0, "x_min": 297, "x_max": 451, "y": null}, {"slot_index": 1, "x_min": 451, "x_max": 592, "y": null}, {"slot_index": 2, "x_min": 592, "x_max": 741, "y": null}, {"slot_index": 3, "x_min": 741, "x_max": 903, "y": null}, {"slot_index": 4, "x_min": 903, "x_max": 1066, "y": null}, {"slot_index": 5, "x_min": 1066, "x_max": 1210, "y": null}, {"slot_index": 6, "x_min": 1210, "x_max": 1357, "y": null}, {"slot_index": 7, "x_min": 1357, "x_max": 1507, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 210, "x_max": 210, "y": null}, {"slot_index": 1, "x_min": 297, "x_max": 297, "y": null}, {"slot_index": 2, "x_min": 774, "x_max": 774, "y": null}, {"slot_index": 3, "x_min": 765, "x_max": 765, "y": null}, {"slot_index": 4, "x_min": 1053, "x_max": 1053, "y": null}, {"slot_index": 5, "x_min": 1100, "x_max": 1100, "y": null}, {"slot_index": 6, "x_min": 1458, "x_max": 1458, "y": null}, {"slot_index": 7, "x_min": 1496, "x_max": 1496, "y": null}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 297, "x_max": 903, "y": null}, {"slot_index": 1, "x_min": 297, "x_max": 903, "y": null}, {"slot_index": 2, "x_min": 297, "x_max": 903, "y": null}, {"slot_index": 3, "x_min": 297, "x_max": 903, "y": null}, {"slot_index": 4, "x_min": 903, "x_max": 1507, "y": null}, {"slot_index": 5, "x_min": 903, "x_max": 1507, "y": null}, {"slot_index": 6, "x_min": 903, "x_max": 1507, "y": null}, {"slot_index": 7, "x_min": 903, "x_max": 1507, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 297, "x_max": 451, "y": null}, {"slot_index": 1, "x_min": 451, "x_max": 592, "y": null}, {"slot_index": 2, "x_min": 592, "x_max": 741, "y": null}, {"slot_index": 3, "x_min": 741, "x_max": 903, "y": null}, {"slot_index": 4, "x_min": 903, "x_max": 1066, "y": null}, {"slot_index": 5, "x_min": 1066, "x_max": 1210, "y": null}, {"slot_index": 6, "x_min": 1210, "x_max": 1357, "y": null}, {"slot_index": 7, "x_min": 1357, "x_max": 1507, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 1, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 2, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 3, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 4, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 5, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 6, "x_min": 297, "x_max": 1507, "y": null}, {"slot_index": 7, "x_min": 297, "x_max": 1507, "y": null}]},>> Temporarios\TXT_Mapas.txt
echo {"map_id": 10,"map_name_en": "META MINE","positions_a_side": [{"slot_index": 0, "x_min": 222, "x_max": 408, "y": null}, {"slot_index": 1, "x_min": 408, "x_max": 568, "y": null}, {"slot_index": 2, "x_min": 568, "x_max": 728, "y": null}, {"slot_index": 3, "x_min": 728, "x_max": 900, "y": null}, {"slot_index": 4, "x_min": 900, "x_max": 1066, "y": null}, {"slot_index": 5, "x_min": 1066, "x_max": 1230, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1390, "y": null}, {"slot_index": 7, "x_min": 1390, "x_max": 1576, "y": null}],"positions_b_side": [{"slot_index": 0, "x_min": 347, "x_max": 347, "y": null}, {"slot_index": 1, "x_min": 655, "x_max": 655, "y": null}, {"slot_index": 2, "x_min": 899, "x_max": 899, "y": null}, {"slot_index": 3, "x_min": 1099, "x_max": 1099, "y": null}, {"slot_index": 4, "x_min": 1456, "x_max": 1456, "y": null}, {"slot_index": 5, "x_min": 452, "x_max": 452, "y": 1000}, {"slot_index": 6, "x_min": 821, "x_max": 821, "y": 1000}, {"slot_index": 7, "x_min": 1320, "x_max": 1320, "y": 1000}],"positions_raw_evsw": [{"slot_index": 0, "x_min": 222, "x_max": 408, "y": null}, {"slot_index": 1, "x_min": 408, "x_max": 568, "y": null}, {"slot_index": 2, "x_min": 568, "x_max": 728, "y": null}, {"slot_index": 3, "x_min": 728, "x_max": 900, "y": null}, {"slot_index": 4, "x_min": 900, "x_max": 1066, "y": null}, {"slot_index": 5, "x_min": 1066, "x_max": 1230, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1390, "y": null}, {"slot_index": 7, "x_min": 1390, "x_max": 1576, "y": null}],"positions_raw_mix": [{"slot_index": 0, "x_min": 222, "x_max": 408, "y": null}, {"slot_index": 1, "x_min": 408, "x_max": 568, "y": null}, {"slot_index": 2, "x_min": 568, "x_max": 728, "y": null}, {"slot_index": 3, "x_min": 728, "x_max": 900, "y": null}, {"slot_index": 4, "x_min": 900, "x_max": 1066, "y": null}, {"slot_index": 5, "x_min": 1066, "x_max": 1230, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1390, "y": null}, {"slot_index": 7, "x_min": 1390, "x_max": 1576, "y": null}],"positions_raw_random": [{"slot_index": 0, "x_min": 222, "x_max": 408, "y": null}, {"slot_index": 1, "x_min": 408, "x_max": 568, "y": null}, {"slot_index": 2, "x_min": 568, "x_max": 728, "y": null}, {"slot_index": 3, "x_min": 728, "x_max": 900, "y": null}, {"slot_index": 4, "x_min": 900, "x_max": 1066, "y": null}, {"slot_index": 5, "x_min": 1066, "x_max": 1230, "y": null}, {"slot_index": 6, "x_min": 1230, "x_max": 1390, "y": null}, {"slot_index": 7, "x_min": 1390, "x_max": 1576, "y": null}]}>> Temporarios\TXT_Mapas.txt
echo ]>> Temporarios\TXT_Mapas.txt
:: Temporarios\TXT_Servidores.txt
echo {"server_options": [{"server_name": "Servidor %ip%","server_description": "\nServidor Aberto","server_address": "%ip%","server_port": 8370,"server_utilization": 5,"server_capacity": 100,"server_enabled": true},{"server_name": "Quem Criou o Servidor?","server_description": "Thalles Tutoriais\nCanal do Youtube","server_address": "%ip%","server_port": 8370,"server_utilization": 100,"server_capacity": 100,"server_enabled": false},{"server_name": "Como Funciona?","server_description": "Jogue Sozinho\nOu Em Rede Local","server_address": "%ip%","server_port": 8370,"server_utilization": 100,"server_capacity": 100,"server_enabled": false},{"server_name": "Qual o IP do Servidor?","server_description": "IP: %ip%\nIP de Rede: %ip%","server_address": "%ip%","server_port": 8370,"server_utilization": 100,"server_capacity": 100,"server_enabled": false},{"server_name": "Comandos do Gunbound","server_description": "Digite /help\nPara Ver os Comandos","server_address": "%ip%","server_port": 8370,"server_utilization": 100,"server_capacity": 100,"server_enabled": false},{"server_name": "Precisa de Ajuda?","server_description": "Veja o Tutorial em:\nhttps://thalles.net/gb","server_address": "%ip%","server_port": 8370,"server_utilization": 100,"server_capacity": 100,"server_enabled": false}]}> Temporarios\TXT_Servidores.txt
:: Temporarios\TXT_Requisitos.txt
echo altgraph==0.16.1> Temporarios\TXT_Requisitos.txt
echo future==0.17.1>> Temporarios\TXT_Requisitos.txt
echo macholib==1.11>> Temporarios\TXT_Requisitos.txt
echo pefile==2018.8.8>> Temporarios\TXT_Requisitos.txt
echo PyInstaller==3.4>> Temporarios\TXT_Requisitos.txt
echo pywin32-ctypes==0.2.0>> Temporarios\TXT_Requisitos.txt


::IDENTIFICA SE O PYTHON ESTA INSTALADO, SE SIM LIGA O CONTINUA, SE NAO INSTALA O PYTHON
>nul 2>nul assoc .py
if errorlevel 1 (
title Instale o Python!
color 4F
echo ==============================================================================
echo  O Python nao esta instalado...
echo  Vamos instala-lo, e depois tentamos novamente....
echo ==============================================================================
echo.
echo Aperte ENTER para instalar o Python!
pause
start SoftwaresNecessarios\EXE_Python-3.9.6.exe
echo.
echo Depois que finalizar a Instalacao do Python volte aqui e aperte ENTER para continuar...
pause
test&cls
BAT_Restauracao.bat
)

::IDENTIFICA SE O WINRAR ESTA INSTALADO, SE SIM LIGA O CONTINUA, SE NAO INSTALA O WINRAR
>nul 2>nul assoc .rar
if errorlevel 1 (
title Instale o WinRAR!
color 4F
echo ==============================================================================
echo  O WinRAR nao esta instalado...
echo  Vamos instala-lo, e depois tentamos novamente....
echo ==============================================================================
echo.
echo Aperte ENTER para instalar o WinRAR!
pause
start SoftwaresNecessarios\EXE_WinRAR-602br.exe
echo.
echo Depois que finalizar a Instalacao do WinRAR volte aqui e aperte ENTER para continuar...
pause
test&cls
BAT_Restauracao.bat
)

echo ==============================================================================
echo  O IP do seu Servidor do Gunbound e: %ip%
echo ==============================================================================
echo  Verificando requisitos minimos...
echo  Na primeira inicializacao voce precisa de internet
echo.
py -m pip install --upgrade pip
py -m pip install -r Temporarios\TXT_Requisitos.txt
py -m pip install pycryptodome
if not exist "c:\GBTH\" mkdir c:\GBTH

echo %ip%> c:\GBTH\IP.txt

if not exist c:\GBTH\mod_index.so (
copy HTTP\modules\mod_index.so c:\GBTH\
)
if not exist HTTP\client\ZIP_GunboundCliente.zip (
"%ProgramFiles%\WinRAR\UnRAR.exe" x -c- -cfg- -inul -o+ -y "HTTP\client\client.part01.rar" "HTTP\client\"
"%ProgramFiles(x86)%\WinRAR\UnRAR.exe" x -c- -cfg- -inul -o+ -y "HTTP\client\client.part01.rar" "HTTP\client\"
)
if not exist c:\GBTH\ZIP_GunboundCliente.zip (
copy HTTP\client\ZIP_GunboundCliente.zip c:\GBTH\
)
test&cls
start /min HTTP\bin\httpd_gb.exe
echo ==============================================================================
echo  O IP do seu Servidor do Gunbound e: %ip%
echo  Acesse http://%ip%/ para baixar o jogo.
echo  LEMBRE-SE: Se quiser jogar Online com seus amigos
echo  Todos os jogadores devem estar na mesma rede Wifi que o servidor.
echo ==============================================================================
py PY_ServidorGB_Ligar.py
if errorlevel 1 (
:: DA UM AVISO DE ERRO NO CODIGO
title Erro do Script do Servidor
color 4F
echo.
echo.
echo.
echo ==============================================================================
echo  Verifique acima o codigo e alinha do erro
echo ==============================================================================
echo.
echo Corrija, volte aqui e APERTE ENTER!
pause
test&cls
BAT_Restauracao.bat
)
