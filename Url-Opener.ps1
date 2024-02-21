$urls = Get-Content "sites.txt"

$batchSize = 10
$count = 0

foreach ($url in $urls) {
	
	# Replace whitespace with %20
	$encodedUrl = $url -replace ' ', '%20'

    Start-Process "chrome.exe" $encodedUrl  # Replace 'chrome.exe' with your preferred browser if different
    $count++
    if ($count -ge $batchSize) {
        Write-Host "Press any key to continue..."
        $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
        $count = 0
    }
}
