Function get-packt {
    $Book = (Invoke-WebRequest -Uri https://www.packtpub.com/packt/offers/free-learning).ParsedHtml.getElementsByTagName('H2')[0].InnerHTML.Trim()
    Write-Host 'The Packt Publishing free learning eBook of the day is: ' -ForegroundColor Cyan -NoNewline
    Write-Host "'$Book'" -ForegroundColor Yellow
    Write-host  "start https://www.packtpub.com/packt/offers/free-learning" -foregroundColor Cyan
}

#Set up transcripts into temp location and set window title to provide the name of the transcript file.
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
