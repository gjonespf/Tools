
#----------------------------------------------------------------------------------------------------Dialog Box 1 - Folder To be Searched
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

[array]$DropDownArray = "DirectoryName","Name","Length","LastWriteTime" #----------------------------The Group By Array

#----------------------------------------------------------------------------------------------------Thiscreates the dialog box and assigns all variables when the ok button is pressed

function Return-DropDown {

	$Choice = $DropDown.SelectedItem.ToString()
	$Form.Close()
	Write-Host $Choice

}

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "Illegal File Type Rename"
$objForm.Size = New-Object System.Drawing.Size(290,500) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})    

$DropDownLabel = new-object System.Windows.Forms.Label
$DropDownLabel.Location = new-object System.Drawing.Size(10,140)
$DropDownLabel.size = new-object System.Drawing.Size(280,30)
$DropDownLabel.Text = "Select how you want the report to be grouped"
$objform.Controls.Add($DropDownLabel)    
    
$DropDown = new-object System.Windows.Forms.ComboBox
$DropDown.Location = new-object System.Drawing.Size(10,170)
$DropDown.Size = new-object System.Drawing.Size(260,20)

ForEach ($Item in $DropDownArray) {
	$DropDown.Items.Add($Item)
}

$objform.Controls.Add($DropDown)    

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,10) 
$objLabel.Size = New-Object System.Drawing.Size(280,40) 
$objLabel.Text = "Please enter the name of the directory you want to scan for illegal SharePoint filenames"
$objForm.Controls.Add($objLabel) 

$objLabel1 = New-Object System.Windows.Forms.Label
$objLabel1.Location = New-Object System.Drawing.Size(10,80) 
$objLabel1.Size = New-Object System.Drawing.Size(280,40) 
$objLabel1.Text = "Please ensure you use the following format c:\Name\Name or \\name\name"
$objForm.Controls.Add($objLabel1) 

$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(10,50) 
$objTextBox.Size = New-Object System.Drawing.Size(260,20) 
$objForm.Controls.Add($objTextBox) 

$IFT1bL = New-Object System.Windows.Forms.Label
$IFT1bL.Location = New-Object System.Drawing.Size(20,220) 
$IFT1bL.Size = New-Object System.Drawing.Size(130,20) 
$IFT1bL.Text = "Type Replacement for #"
$objForm.Controls.Add($IFT1bL) 

$IFT1b = New-Object System.Windows.Forms.TextBox 
$IFT1b.Location = New-Object System.Drawing.Size(170,220) 
$IFT1b.Size = New-Object System.Drawing.Size(100,20) 
$objForm.Controls.Add($IFT1b)

$IFT2bL = New-Object System.Windows.Forms.Label
$IFT2bL.Location = New-Object System.Drawing.Size(20,245) 
$IFT2bL.Size = New-Object System.Drawing.Size(130,20) 
$IFT2bL.Text = "Type Replacement for %"
$objForm.Controls.Add($IFT2bL) 

$IFT2b = New-Object System.Windows.Forms.TextBox 
$IFT2b.Location = New-Object System.Drawing.Size(170,245) 
$IFT2b.Size = New-Object System.Drawing.Size(100,20) 
$objForm.Controls.Add($IFT2b)

$IFT3bL = New-Object System.Windows.Forms.Label
$IFT3bL.Location = New-Object System.Drawing.Size(20,270) 
$IFT3bL.Size = New-Object System.Drawing.Size(130,20) 
$IFT3bL.Text = "Type Replacement for {"
$objForm.Controls.Add($IFT3bL) 

$IFT3b = New-Object System.Windows.Forms.TextBox 
$IFT3b.Location = New-Object System.Drawing.Size(170,270) 
$IFT3b.Size = New-Object System.Drawing.Size(100,20) 
$objForm.Controls.Add($IFT3b)

$IFT4bL = New-Object System.Windows.Forms.Label
$IFT4bL.Location = New-Object System.Drawing.Size(20,295) 
$IFT4bL.Size = New-Object System.Drawing.Size(130,20) 
$IFT4bL.Text = "Type Replacement for }"
$objForm.Controls.Add($IFT4bL) 

$IFT4b = New-Object System.Windows.Forms.TextBox 
$IFT4b.Location = New-Object System.Drawing.Size(170,295) 
$IFT4b.Size = New-Object System.Drawing.Size(100,20) 
$objForm.Controls.Add($IFT4b)

$IFT5bL = New-Object System.Windows.Forms.Label
$IFT5bL.Location = New-Object System.Drawing.Size(20,320) 
$IFT5bL.Size = New-Object System.Drawing.Size(130,20) 
$IFT5bL.Text = "Type Replacement for ~"
$objForm.Controls.Add($IFT5bL) 

$IFT5b = New-Object System.Windows.Forms.TextBox 
$IFT5b.Location = New-Object System.Drawing.Size(170,320) 
$IFT5b.Size = New-Object System.Drawing.Size(100,20) 
$objForm.Controls.Add($IFT5b)

$IFT8bL = New-Object System.Windows.Forms.Label
$IFT8bL.Location = New-Object System.Drawing.Size(20,345) 
$IFT8bL.Size = New-Object System.Drawing.Size(130,20) 
$IFT8bL.Text = "Type Replacement for &&"
$objForm.Controls.Add($IFT8bL)

$IFT8b = New-Object System.Windows.Forms.TextBox 
$IFT8b.Location = New-Object System.Drawing.Size(170,345) 
$IFT8b.Size = New-Object System.Drawing.Size(100,20) 
$objForm.Controls.Add($IFT8b)

$ReminderLabel = New-Object System.Windows.Forms.Label
$ReminderLabel.Location = New-Object System.Drawing.Size(20,370) 
$ReminderLabel.Size = New-Object System.Drawing.Size(280,40) 
$ReminderLabel.Text = "If you leave all fields blank the characters will be removed - if the filename already exists within the directory the file will not be altered"
$objForm.Controls.Add($ReminderLabel)

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,420)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.Add_Click({$DirectoryToSearch=$objTextBox.Text;$GroupBy=$DropDown.Text;$IFT1c=$IFT1b.Text;$IFT2c=$IFT2b.Text;$IFT3c=$IFT3b.Text;$IFT4c=$IFT4b.Text;$IFT5c=$IFT5b.Text;$IFT6c=$IFT6b.Text;$IFT7c=$IFT7b.Text;$IFT8c=$IFT8b.Text;$objForm.Close()})
$objForm.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,420)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)

$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})

[void] $objForm.ShowDialog()

$DirectoryToSearch
$GroupBy

#----------------------------------------------------------------------------------------------------Define the illegal filenames

$IFT1 = '*#*'
$IFT1a ='#'
$IFT2 = '*%*'
$IFT2a = '%'
$IFT3 = '*{*'
$IFT3a = '{'
$IFT4 = '*}*'
$IFT4a = '}'
$IFT5 = '*~*'
$IFT5a = '~'
$IFT8 = '*&*'
$IFT8a = '&'

$IFT = $IFT1,$IFT2,$IF3,$IFT4,$IFT5,$IFT6,$IFT7,$IFT8

#----------------------------------------------------------------------------------------------------Create Output Folder and Date Stamped File name + the Rename parameter
[IO.Directory]::CreateDirectory("c:\SundownSolutions\")
[IO.Directory]::CreateDirectory("c:\SundownSolutions\RenamedFiles")

$Date = Get-Date
$Filename="FileRename{0:d2}{1:d2}{2:d2}-{3:d2}{4:d2}.txt" -f $date.day,$date.month,$date.year,$date.hour,$date.minute
$Filename0 = "c:\SundownSolutions\RenamedFiles\"+$IFT1a + $Filename
$Filename1 = "c:\SundownSolutions\RenamedFiles\"+$IFT2a + $Filename
$Filename2 = "c:\SundownSolutions\RenamedFiles\"+$IFT3a + $Filename
$Filename3 = "c:\SundownSolutions\RenamedFiles\"+$IFT4a + $Filename
$Filename4 = "c:\SundownSolutions\RenamedFiles\"+$IFT5a + $Filename
$Filename7 = "c:\SundownSolutions\RenamedFiles\"+$IFT8a + $Filename

#----------------------------------------------------------------------------------------------------Conduct The Search, Change the File Names and then output the results to the log files

$File1 = Get-ChildItem $DirectoryToSearch -include $IFT1  -recurse | Sort-Object -property $GroupBy | format-table -property Name, DirectoryName, LastWriteTime, Length -groupby $GroupBy | Out-File $Filename0 -width 180 
$File1 = Get-ChildItem $DirectoryToSearch -include $IFT1  -recurse | Rename-Item -NewName {$_.Name -replace $IFT1a,$IFT1c}

$File2 = Get-ChildItem $DirectoryToSearch -include $IFT2  -recurse | Sort-Object -property $GroupBy | format-table -property Name, DirectoryName, LastWriteTime, Length -groupby $GroupBy | Out-File $Filename1 -width 180
$File2 = Get-ChildItem $DirectoryToSearch -include $IFT2  -recurse | Rename-Item -NewName {$_.Name -replace $IFT2a,$IFT2c}

$File3 = Get-ChildItem $DirectoryToSearch -include $IFT3  -recurse | Sort-Object -property $GroupBy | format-table -property Name, DirectoryName, LastWriteTime, Length -groupby $GroupBy | Out-File $Filename2 -width 180
$File3 = Get-ChildItem $DirectoryToSearch -include $IFT3  -recurse | Rename-Item -NewName {$_.Name -replace $IFT3a,$IFT3c}

$File4 = Get-ChildItem $DirectoryToSearch -include $IFT4  -recurse | Sort-Object -property $GroupBy | format-table -property Name, DirectoryName, LastWriteTime, Length -groupby $GroupBy | Out-File $Filename3 -width 180
$File4 = Get-ChildItem $DirectoryToSearch -include $IFT4  -recurse | Rename-Item -NewName {$_.Name -replace $IFT4a,$IFT4c}

$File5 = Get-ChildItem $DirectoryToSearch -include $IFT5  -recurse | Sort-Object -property $GroupBy | format-table -property Name, DirectoryName, LastWriteTime, Length -groupby $GroupBy | Out-File $Filename4 -width 180
$File5 = Get-ChildItem $DirectoryToSearch -include $IFT5  -recurse | Rename-Item -NewName {$_.Name -replace $IFT5a,$IFT5c} 

$File8 = Get-ChildItem $DirectoryToSearch -include $IFT8  -recurse | Sort-Object -property $GroupBy | format-table -property Name, DirectoryName, LastWriteTime, Length -groupby $GroupBy | Out-File $Filename7 -width 180
$File8 = Get-ChildItem $DirectoryToSearch -include $IFT8  -recurse | Rename-Item -NewName {$_.Name -replace $IFT8a,$IFT8c}

#----------------------------------------------------------------------------------------------------Script Complete confirmation

Write-Host "The Data Cleanse Script has completed - please check the log files to confirm file changes - Press ENTER to continue"

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

#----------------------------------------------------------------------------------------------------Open log folder in explorer

Start Explorer.exe 'c:\SundownSolutions\RenamedFiles'

#----------------------------------------------------------------------------------------------------Dispose of all variables - Cleaning up :)

function Dispose-All {
 Get-Variable |
      Where-Object {
           $_.Value -is [System.IDisposable]
       } |
       Foreach-Object {
           $_.Value.Dispose()
           Remove-Variable $_.Name
       }
}

