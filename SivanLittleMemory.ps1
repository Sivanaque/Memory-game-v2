Add-Type -AssemblyName System.Collections
$getConArrayList = [System.Collections.ArrayList]@()

$getCon = Read-Host $(Write-Host "Enter the full path (racine) of your .txt file [EX: C:\Users\USERNAME\...]" -NoNewLine -ForegroundColor Yellow) + $(Write-Host "" -ForegroundColor yellow -NoNewLine;)
$testCon = Test-Path -Path $getCon
$getPath = Get-Content -Path $getCon
$getPathLength = $getPath.Length

if (!$testCon) {
    Write-Host("Load Failed: Invalid Path or Null value") -ForegroundColor Red
    pause
    exit
} elseif ($testCon) {
    Write-Host("File Load Successfully") -ForegroundColor Green

    foreach ($getArray in $getPath) {
        $getConArrayList += $getArray
    }

    $getConArrayList = New-Object System.Collections.ArrayList(,$getConArrayList)

    
    $getAsk = Read-Host $(Write-Host "Enter your global question to answers on [EX : Days of Week (in order)]" -NoNewLine -ForegroundColor Yellow) + $(Write-Host "" -ForegroundColor yellow -NoNewLine;)
    
    $cAnswers = 0;
    $eAnswers = 0;
     
        for ($i = 0; $i -lt $getPath.Length; $i++) {
    
            $res = Read-Host $getAsk
        
            if ($res -eq $getConArrayList[0]) {
                Write-Host "Correcte !" -ForegroundColor Green
                $cAnswers++
                Write-Host "Erreurs : $eAnswers" -ForegroundColor Red
                $getConArrayList.RemoveAt(0)
            } else {
                
                Write-Host "Incorrecte !" -ForegroundColor Red
                $eAnswers++
                Write-Host "Erreurs : $eAnswers" -ForegroundColor Red
            }
        }
    
    
    write-host "`n"
    Write-Host "Résultat :" -BackgroundColor Blue
    write-host "`n"
    if ($cAnswers -ge [math]::Round($getPathLength / 2)) {
        Write-Host "Vous avez un total de $cAnswers sur $getPathLength bonne(s) réponse(s) !" -BackgroundColor DarkGreen -ForegroundColor White
    } elseif ($cAnswers -lt [math]::Round($getPathLength / 2) ) {
        Write-Host "Vous avez un total de $cAnswers sur $getPathLength bonne(s) réponse(s) !" -BackgroundColor Red -ForegroundColor White
    }
    
    Read-Host "Appuyer sur entrée pour sortir" 
    
}
