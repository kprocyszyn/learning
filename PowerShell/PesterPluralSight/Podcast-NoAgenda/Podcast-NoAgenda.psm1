﻿Push-Location
Import-Module SqlPS -DisableNameChecking
Pop-Location

. $PSScriptRoot\function-Get-PodcastData.ps1
. $PSScriptRoot\function-Get-PodcastMedia.ps1
. $PSScriptRoot\function-Get-PodcastImage.ps1
. $PSScriptRoot\function-ConvertTo-PodcastHtml.ps1
. $PSScriptRoot\function-ConvertTo-PodcastXml.ps1
. $PSScriptRoot\function-Write-PodcastHtml.ps1
. $PSScriptRoot\function-Write-PodcastXML.ps1
. $PSScriptRoot\function-Get-NoAgenda.ps1

Export-ModuleMember Get-NoAgenda
Export-ModuleMember Get-PodcastData

<# During development of the module you may wish to leave these uncommented. For 
   production, only the Get-NoAgenda and Get-PodcastData members should be visible

Export-ModuleMember Get-PodcastImage
Export-ModuleMember Get-PodcastMedia
Export-ModuleMember ConvertTo-PodcastHtml
Export-ModuleMember ConvertTo-PodcastXml
Export-ModuleMember Write-PodcastHtml
Export-ModuleMember Write-PodcastXML

#>
