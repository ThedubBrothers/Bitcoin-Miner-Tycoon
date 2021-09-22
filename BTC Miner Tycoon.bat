@echo off
title Bitcoin Miner Tycoon
color 0e
chcp 65001 >nul
set /a bitcoin=0
set /a bitcoinclickvalue=1
set /a money=0
set /a moneyexchangevalue=3
set /a devmode=false
set /a debounce=0
set eastereggowned=0
set pageauth=0
:languagecheck
cls
set baselang=EN
echo Please Choose Your Language.
echo 1: English
echo 2: French
echo 3: German
choice /c 123 /n >nul
if %errorlevel%==1 (
cls
goto btcmine
)
if %errorlevel%==2 (
cls
goto btcminefr
)
if %errorlevel%==3 (
cls
goto btcminede
)
:btcmine
echo MINE
echo Bitcoin: %bitcoin%
echo Money: %money%
echo 1: Mine %bitcoinclickvalue% Bitcoin
echo 2: Goto Exchange
echo 3: Goto Upgrade Station
echo 4: Save
echo 5: Load
echo 6: Settings
echo 7: Shop
choice /c 1234567 /n >nul
if %errorlevel%==1 (
if %errorlevel%==0 (
echo Macro "1" Error: 0 >> log.log
exit
)
if %debounce%==1 (
timeout /T 0.50 /nobreak >nul
set /a debounce=0
cls
goto btcmine
)
if %debounce%==0 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
set /a debounce=1
cls
goto btcmine
)
)
if %errorlevel%==2 (goto btcexchange)
if %errorlevel%==3 (goto btcupgrade)
if %errorlevel%==4 (goto save)
if %errorlevel%==5 (goto load)
if %errorlevel%==6 (goto settings)
if %errorlevel%==7 (goto shop)
:btcmineru
echo ????
echo ???????: %bitcoin%
echo ?????: %money%

:modsen
cls
if %pageauth%==0 (
cls
echo Page Not Authenticated This Is Likeley Due To A Mod Opening The Incorrect Page, Try Disabling This Mod And Try Again.
timeout 2 /nobreak >nul
cls
goto btcmine
)
if %pageauth%==1 (
echo Mods List
cd Mods
dir /B *.bat
if %errorlevel%==1 (cls&echo No Mods Found!)
cd ..
echo 1: Activate Mods (Expiremental)
choice /c 1 /n >nul
if %errorlevel%==1 (
cls
echo Please Enter The Mods Filename (Without .bat)
set /p modname=
if exist Mods\%modname%.bat  (
call Mods\%modname%.bat
cls
goto btcmine
)


if /I %modname%==22:10 (
cls
if %eastereggowned%==0 (
echo Easter Egg 1 Aquired!
set /a money=%money% + 2210
set eastereggowned=1
timeout 2 /nobreak >nul
cls
goto btcmine
)
if %eastereggowned%==1 (
echo This Mod Is Not Found Please Check Your Spelling And Try Again.
timeout 2 /nobreak >nul
cls
goto modsen
)
)
)
if not exist Mods\%modname%.bat (
echo This Mod Is Not Found Please Check Your Spelling And Try Again.
timeout 2 /nobreak >nul
cls
goto modsen
)
)
:btcminefr
echo MIENNE
echo Bitcoin: %bitcoin%
echo De l'argent: %money%
echo 1: Mienne %bitcoinclickvalue% Bitcoin
echo 2: Allez échanger
echo 3: Aller à la station de mise à niveau
echo 4: sauvegarder
echo 5: charge
echo 6: Paramètres
echo 7: magasin
choice /c 1234567 /n >nul
if %errorlevel%==1 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
cls
goto btcminefr
)
if %errorlevel%==2 (goto btcexchangefr)
if %errorlevel%==3 (goto btcupgradefr)
if %errorlevel%==4 (goto savefr)
if %errorlevel%==5 (goto loadfr)
if %errorlevel%==6 (goto settingsfr)
if %errorlevel%==7 (goto shop)
:btcminede
echo BERGWERK
echo Bitcoin: %bitcoin%
echo Geld: %money%
echo 1: Bergwerk %bitcoinclickvalue% Bitcoin
echo 2: Gehe zu Exchange
echo 3: Gehe zu Upgrade-Station
echo 4: Save
echo 5: Load
echo 6: Einstellungen
echo 7: Unternehmen
choice /c 1234567 /n >nul
if %errorlevel%==1 (
set /a bitcoin = %bitcoin% + %bitcoinclickvalue%
cls
goto btcminede
)
if %errorlevel%==2 (goto btcexchange)
if %errorlevel%==3 (goto btcupgrade)
if %errorlevel%==4 (goto save)
if %errorlevel%==5 (goto load)
if %errorlevel%==6 (goto settings)
if %errorlevel%==7 (goto shop)
:btcexchange
cls
echo 1 Bitcoin = %moneyexchangevalue%$
echo Do You Want To Exchange 1 Bitcoin?
echo 1: Yes
echo 2: No
echo 3: Exchange All
choice /c 123 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Error you Cannot Exchange 0 Bitcoin
timeout 2 /nobreak >nul
cls
goto btcmine
)
else
set /a bitcoin = %bitcoin% - 1
set /a money = %money% + %moneyexchangevalue%
cls
goto btcmine
)
if %errorlevel%==2 (
cls
echo Alright!
timeout 1 /nobreak >nul
cls
goto btcmine
)
if %errorlevel%==3 (
cls
set /a money = %money% + %bitcoin%
set /a bitcoin = 0
goto btcmine
)
:btcexchangefr
cls
echo 1 Bitcoin = %moneyexchangevalue%€
echo Voulez-vous échanger 1 Bitcoin?
echo 1: Oui
echo 2: Nine
choice /c 12 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Erreur, vous ne pouvez pas échanger 0 Bitcoin
timeout 2 /nobreak >nul
cls
goto btcminefr
)
else
set /a bitcoin = %bitcoin% - 1
set /a money = %money% + %moneyexchangevalue%
cls
goto btcminefr
)
if %errorlevel%==2 (
cls
echo D'accord!
timeout 1 /nobreak >nul
cls
goto btcminefr
)
:btcexchangede
cls
echo 1 Bitcoin = %moneyexchangevalue%€
echo Möchten Sie 1 Bitcoin umtauschen?
echo 1: Ja
echo 2: Nein
choice /c 12 /n >nul
if %errorlevel%==1 (
if "%bitcoin%"=="0" (
cls
echo Fehler Sie können 0 Bitcoin nicht umtauschen
timeout 2 /nobreak >nul
cls
goto btcminede
)
else
set /a bitcoin = %bitcoin% - 1
set /a money = %money% + %moneyexchangevalue%
cls
goto btcminede
)
if %errorlevel%==2 (
cls
echo okay!
timeout 1 /nobreak >nul
cls
goto btcminede
)
:btcupgrade
cls
echo 1: Upgrade Bitcoin Click Value (10)
echo 2: Exit Shop
choice /c 12 /n >nul
if %errorlevel%==1 (
cls
set /a bitcoinclickvalue = %bitcoinclickvalue% + 1
set /a money = %money% - 10
cls
goto btcupgrade
)
if %errorlevel%==2 (cls&&goto btcmine)
:btcupgradefr
cls
echo 1: Mettre à niveau la valeur de clic Bitcoin (10)
echo 2: Quitter la boutique
choice /c 12 /n >nul
if %errorlevel%==1 (
cls
set /a bitcoinclickvalue = %bitcoinclickvalue% + 1
set /a money = %money% - 10
cls
goto btcupgradefr
)
if %errorlevel%==2 (
cls
goto btcminefr
)
:save
cls
(
echo %bitcoin%
echo %bitcoinclickvalue%
echo %money%
echo %moneyexchangevalue%
echo %devmode%
echo %debounce%
echo %eastereggowned%
) > save.game
cls
goto btcmine
:savefr
cls
(
echo %bitcoin%
echo %bitcoinclickvalue%
echo %money%
echo %moneyexchangevalue%
echo %devmode%
) > enregistrer.game
cls
goto btcminefr
:load
if exist enregistrer.game (
cls
< enregistrer.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 )
cls
goto btcmine
end
)
cls
< save.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 set /p debounce=
 set /p eastereggowned=
 )
cls
goto btcmine
:loadfr
if exist save.game (
cls
< save.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 )
cls
goto btcminefr
end
)
cls
< enregistrer.game (
 set /p bitcoin=
 set /p bitcoinclickvalue=
 set /p money=
 set /p moneyexchangevalue=
 set /p devmode=
 )
cls
goto btcminefr
:settings
cls
echo 1: Developer Mode
echo 2: Mods
choice /c 12 /n >nul
if %errorlevel%==1 (
cls
if %devmode%==1 (cls&goto devroom)
else
goto devmodeprompt
)
if %errorlevel%==2 (
cls
set pageauth=1
goto modsen
)
:settingsfr
cls
echo Aucun n'est disponible actuellement
timeout 1 /nobreak >nul
cls
goto btcminefr
:shop
cls
echo 1: Buy Basic GPU (+50 Bitcoin Clicks Each) (200)
echo 2: Exit Shop
choice /c 12 /n >nul
if %errorlevel%==1 (
   if %money% LSS 200 (
      cls
      echo You Cannot Afford Item: "Basic GPU"!
      timeout 2 /nobreak >nul
      cls
      goto btcmine
   )
   else
set /a gpu=%gpu% + 1
set /a bitcoinclickvalue=%bitcoinclickvalue% + 50
set /a money=%money% - 200
cls
goto shop
)
if %errorlevel%==2 (cls&goto btcmine)
:devmodeprompt
cls
if %devmode%==1 (goto devroom&end)
echo Due To This Being Dev Only Please Enter Your Developer Key.
set /p devkey=
if %devkey%==21546826 (
set /a devmode=1
cls
goto devroom
)
echo.
echo Invalid Key
timeout 2 /nobreak >nul
cls
goto btcmine
:devroom
cls
echo 1: Insane Stats
choice /c 1 /n >nul
if %errorlevel%==1 (
set /a bitcoin=%bitcoin% + 100000
set /a bitcoinclickvalue=%bitcoinclickvalue% + 100000
set /a money=%money% + 100000
set /a moneyexchangevalue=%moneyexchangevalue% + 100000
cls
goto btcmine
)