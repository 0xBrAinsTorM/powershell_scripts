$Path = “enter the path you want to search”
$Text = “enter the text you want to search for in those files”
$PathArray = @()
$Results = “C:\temp\filenames.txt”

# This code snippet gets all the files in $Path that end in “.dat”.
Get-ChildItem $Path -Filter “*.dat” -Recurse |
Where-Object { $_.Attributes -ne “Directory”} |
ForEach-Object {
If (Get-Content $_.FullName | Select-String -Pattern $Text) {
$PathArray += $_.FullName
$PathArray += $_.FullName
}
}
$PathArray | % {$_} | Out-File $Results
