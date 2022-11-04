Import-Module au
Import-Module PowerShellForGitHub

$owner = 'xanderfrangos'
$repository = 'crushee'

function global:au_BeforeUpdate ($Package)  {
    Set-DescriptionFromReadme -Package $Package -ReadmePath '.\DESCRIPTION.md'
}

function global:au_AfterUpdate ($Package)  {
    
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(<packageSourceUrl>)[^<]*(</packageSourceUrl>)" = "`$1https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)`$2"
            "(<licenseUrl>)[^<]*(</licenseUrl>)" = "`$1https://github.com/$($owner)/$($repository)/blob/v$($Latest.SoftwareVersion)/LICENSE`$2"
            "(<projectSourceUrl>)[^<]*(</projectSourceUrl>)" = "`$1https://github.com/$($owner)/$($repository)/tree/v$($Latest.SoftwareVersion)`$2"
            "(<releaseNotes>)[^<]*(</releaseNotes>)" = "`$1https://github.com/$($owner)/$($repository)/releases/tag/v$($Latest.SoftwareVersion)`$2"
            "(<copyright>)[^<]*(</copyright>)" = "`$1Copyright © $((Get-Date).Year) Xander Frangos`$2"
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

function global:au_GetLatest {
    $latestRelease = (Get-GitHubRelease -OwnerName $owner -RepositoryName $repository -Latest)[0]
    $version = $latestRelease.tag_name.Substring(1)

    return @{ 
        SoftwareVersion = $version
        Version = $version #This may change if building a package fix version
    }
}

Update-Package -ChecksumFor None -NoReadme
