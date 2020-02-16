﻿<#
  .SYNOPSIS
  Writes the passed in HTML data to the specified file.

  .DESCRIPTION
  Takes the output of Get-PodcastHTML and writes it to a file, the name passed
  in by the user. 

  .INPUTS
  HtmlData - The blob of HTML text to output
  HtmlPathFile - The path and file name to write to
  
  .OUTPUTS
  None
  
  .EXAMPLE
  Write-PodcastHtml -HtmlData $htmlData -HtmlPathFile 'C:\Temp\NoAgenda.html'

  .EXAMPLE
  Write-PodcastHtml $htmlData 'C:\Temp\NoAgenda.html'

  .EXAMPLE
  Write-PodcastHtml $htmlData 

#>
function Write-PodcastHtml()
{ 
  [CmdletBinding()]
  param
  (
    [parameter (Mandatory = $true
               , ValueFromPipeline = $true
               , ValueFromPipelineByPropertyName = $true
               ) 
    ]
    [string[]]$HtmlData
    ,
    [parameter (Mandatory = $false) ]
    $HtmlPathFile = 'C:\PS\Pester-course\demo\completed-final-module\Podcast-Data\NoAgenda.html'
  )

  begin 
  { 
    Write-Verbose "Write-Html: Writing $OutputPathFile"
    $htmlFileData = ''
  }

  process 
  {
    foreach ($line in $HtmlData)
    {
      $htmlFileData += "$line`r`n"
    }
  }

  end 
  {
    $htmlFileData | Out-File $HtmlPathFile
  }
  

} # function Write-Html