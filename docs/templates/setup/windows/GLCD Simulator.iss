;This file will be executed next to the application bundle image
;I.e. current directory will contain folder GLCD Emulator with application files
[Setup]
AppId=${project.groupId}
AppName=${project.name}
AppVersion=${project.version}
AppVerName=${project.name}
AppPublisher=Rafael Luis Ibasco
AppComments=${project.description}
AppCopyright=${project.name} Copyright (C) 2018 Rafael Luis Ibasco
AppPublisherURL=https://github.com/ribasco/glcd-emulator/issues
AppSupportURL=https://github.com/ribasco/glcd-emulator/wiki
AppUpdatesURL=https://github.com/ribasco/glcd-emulator/releases
DefaultDirName={localappdata}\${project.name}
DisableStartupPrompt=Yes
DisableDirPage=No
DisableProgramGroupPage=Yes
DisableReadyPage=Yes
DisableFinishedPage=Yes
DisableWelcomePage=Yes
DefaultGroupName=${project.name}
;Optional License
LicenseFile=license.txt
;WinXP or above
MinVersion=0,5.1 
OutputBaseFilename=glcd-emulator-setup-${current-arch}
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
SetupIconFile=${project.name}\${project.name}.ico
UninstallDisplayIcon={app}\${project.name}.ico
UninstallDisplayName=${project.name}
WizardImageStretch=No
WizardSmallImageFile=${project.name}-setup-icon.bmp
ArchitecturesInstallIn64BitMode=x64


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "${project.name}\${project.name}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "${project.name}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\${project.name}"; Filename: "{app}\${project.name}.exe"; IconFilename: "{app}\${project.name}.ico"; Check: returnTrue()
Name: "{commondesktop}\${project.name}"; Filename: "{app}\${project.name}.exe";  IconFilename: "{app}\${project.name}.ico"; Check: returnTrue()

[Run]
Filename: "{app}\${project.name}.exe"; Parameters: "-Xappcds:generatecache"; Check: returnFalse()
Filename: "{app}\${project.name}.exe"; Description: "{cm:LaunchProgram,${project.name}}"; Flags: nowait postinstall runascurrentuser skipifsilent; Check: returnTrue()
Filename: "{app}\${project.name}.exe"; Parameters: "-install -svcName ""${project.name}"" -svcDesc ""${project.name}"" -mainExe ""${project.name}.exe""  "; Check: returnFalse()

[UninstallRun]
Filename: "{app}\${project.name}.exe "; Parameters: "-uninstall -svcName ${project.name} -stopOnUninstall"; Check: returnFalse()

[Code]
function returnTrue(): Boolean;
begin
  Result := True;
end;

function returnFalse(): Boolean;
begin
  Result := False;
end;

function InitializeSetup(): Boolean;
begin
// Possible future improvements:
//   if version less or same => just launch app
//   if upgrade => check if same app is running and wait for it to exit
//   Add pack200/unpack200 support? 
  Result := True;
end;  
