New-Alias g goto
New-Alias lara php_artisan

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

function php_artisan {
    param(
        $cmd,
        $options
    )

    Switch($cmd) {
        "m" {
            powershell -Command "php artisan migrate"
        }
        "fresh" {
            powershell -Command "php artisan migrate:fresh --seed"
        }
        "install" {
            powershell -Command "composer install"
            powershell -Command "npm install"
        }
        "clear" {
            switch($options) {
                "all" {
                    powershell -Command "php artisan cache:clear"
                    powershell -Command "php artisan route:clear"
                    powershell -Command "php artisan config:clear"
                    powershell -Command "php artisan view:clear"
                }
                default {
                    powershell -Command "php artisan "$options":clear"
                }
            }
        }
        default {
            echo "Command not found"
        }
    }
}

$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_DISTRO = "者  $ENV:UserName "
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
