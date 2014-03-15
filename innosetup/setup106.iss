; -- T3A Patch 1.06 for BFME 1 Installer --
; by ICT

[Setup]
AppName=T3A Patch for BFME 1
AppVersion=1.06
AppId=T3APATCH106
DefaultDirName={reg:HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme.exe,Path}
DisableDirPage=no
DirExistsWarning=no
Compression=lzma2
SolidCompression=yes
WizardImageFile=dialog2.bmp
LicenseFile=license.rtf
OutputBaseFilename=T3AOnlineBFME1_Patch1.06

[Files]
Source: "_patch106.big"; DestDir: "{app}"; BeforeInstall: CheckForFile
Source: "_patch106textures.big"; DestDir: "{app}"
Source: "_WSMaps.big"; DestDir: "{app}" ; Flags: onlyifdestfileexists uninsneveruninstall
Source: "changelog106.txt"; DestDir: "{app}"; Flags: isreadme

[Code]
procedure CheckForFile();
begin
      if(FileExists(ExpandConstant('{app}/game.dat')) = False) then
        begin
          MsgBox('You need to specify the BFME 1 main installation directory!', mbInformation, MB_OK);
          WizardForm.Close;
        end
      else 
        begin
          if( (FileExists(ExpandConstant('{app}/_patch103.big'))) AND (FileExists(ExpandConstant('{app}/_patch105.big'))) = False) then
            begin
              MsgBox('You need to install Patch 1.03 and Patch 1.05 first!', mbInformation, MB_OK);
              WizardForm.Close;
            end;
        end;
end;