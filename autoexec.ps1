if (test-path ("c:\temp\powershelllogs-" + $env:username + (get-date -uformat "%y%m%d") + "*.txt")) {$alreadyrun = $true}
$transcriptlog = "c:\temp\powershelllogs-" + $env:username + (get-date -uformat "%y%m%d-%H%M") + ".txt"
start-transcript $transcriptlog
 $host.ui.rawui.WindowTitle = $transcriptlog

if (!$alreadyrun) {
    #Anything in this script block will only run once per day
    get-packt
    choco outdated
    write-host "To update... cup all -y "
}