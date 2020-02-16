﻿# Get the path the script is executing from
$here = Split-Path -Parent $MyInvocation.MyCommand.Path

# If the module is already in memory, remove it
Get-Module Podcast-NoAgenda | Remove-Module -Force

# Import the module from the local path, not from the users Documents folder
Import-Module $here\Podcast-NoAgenda.psm1 -Force

Describe 'Get-PodcastData Tests' {

  $rssData = Get-PodcastData

  $rowNum = 0
  foreach ($podcast in $rssData)
  {
    $rowNum++
    Context "Podcast $rowNum has the correct properties" {
      # Load an array with the properties we need to look for
      $properties = ('Title', 'ShowUrl', 'EmbeddedHTML', 'Hosts', 
                     'PublicationDate', 'ImageUrl', 'AudioUrl', 'AudioLength')
      
      foreach ($property in $properties)
      { 
        It "Podcast $rowNum should have a property of $property" {
          [bool]($podcast.PSObject.Properties.Name -match $property) |
            Should Be $true
        }
      }
    
    } # Context 'Individual Podcast Properties' 
  } # foreach ($podcast in $rssData)

  Context 'Podcast Collection Values' {
    It 'should have 15 rows' {
      $rssData.Count | Should Be 15
    }

  } # Context 'Podcast Collection Values'

  $rowNum = 0
  foreach ($podcast in $rssData)
  {
    $rowNum++
    Context "Podcast Values for row $rowNum" {
    
      It 'ImageUrl should end with .jpg' {
        $podcast.ImageUrl.EndsWith('.jpg') | Should Be $true
      }
    
      It 'AudioUrl should end with .mp3' {
        $podcast.AudioUrl.EndsWith('.mp3') | Should Be $true
      }
    
      It 'ShowUrl should contain noagendanotes' {
        $podcast.ShowUrl.Contains('noagendanotes') | Should Be $true
      }
    
      It 'Hosts should contain Adam Curry' {
        $podcast.Hosts.Contains('Adam Curry') | Should Be $true
      }
    
      It 'Hosts should contain John C. Dvorak' {
        $podcast.Hosts.Contains('John C. Dvorak') | Should Be $true 
      }
    } # Context 'Podcast Values'
  } # foreach ($podcast in $rssData)


} #Describe 'Get-PodcastData' 

