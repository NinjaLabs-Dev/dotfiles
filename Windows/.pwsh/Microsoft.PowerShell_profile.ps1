New-Alias g goto

function goto {
    param (
        $location
    )

    Switch ($location) {
        "dev" {
            Set-Location -Path "e:/development"
        }
        "tfm" {
            Set-Location -Path "e:/development/truckersfm"
        }
        "nl" {
            Set-Location -Path "'e:/ninjalabs development/'"
        }
        "sypo" {
            Set-Location -Path "e:/development/SYPO"
        }
        default {
            echo "Invalid location"
        }
    }
}

$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_DISTRO = "者  $ENV:UserName"
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
