{config, pkgs, userSettings, systemSettings, inputs, ...}:
{
    programs.firefox = {
        enable = true;

        profiles.${userSettings.username} = {
            extensions = with inputs.firefox-addons.packages.${systemSettings.system}; [
                ublock-origin
                youtube-shorts-block
                youtube-nonstop
                sponsorblock
                zotero-connector
                darkreader
            ];

            search = {
                default = "DuckDuckGo";
                
                engines = {
                    "Nix Packages" = {
                        urls = [{
                        template = "https://search.nixos.org/packages";
                        params = [
                            { name = "type"; value = "packages"; }
                            { name = "query"; value = "{searchTerms}"; }
                        ];
                        }];

                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@np" ];
                    };

                    "NixOS Wiki" = {
                        urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];
                        iconUpdateURL = "https://wiki.nixos.org/favicon.png";
                        updateInterval = 24 * 60 * 60 * 1000; # every day

                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@nw" ];
                    };

                    "Bing".metaData.hidden = true;
                    "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
                };
            };
        };
    };
}
