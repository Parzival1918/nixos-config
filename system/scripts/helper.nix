{config, pkgs, userSettings, ...}:
let
    binName = "helper";
    code = ''
                import argparse
                import subprocess


                def rebuild(args):
                    subprocess.run(["sudo nixos-rebuild switch --flake ${userSettings.dotfilesPath}#system"],
                                   shell=True)


                def update(args):
                    subprocess.run(["sudo nix flake update ${userSettings.dotfilesPath}"],
                                   shell=True)


                def garbage_collect(args):
                    subprocess.run(["sudo nix-collect-garbage"],
                                   shell=True)


                parser = argparse.ArgumentParser(
                    prog="${binName}",
                    description="",
                    epilog="tool by Pedro Juan Royo",
                )

                subparsers = parser.add_subparsers(dest="subcommand", title="subcommands")

                parser_rebuild = subparsers.add_parser("rebuild", help="rebuild system and home config")
                parser_rebuild.set_defaults(func=rebuild)

                parser_update = subparsers.add_parser("update", help="update system flake")
                parser_update.set_defaults(func=update)

                parser_gc = subparsers.add_parser("gc", help="collect garbage")
                parser_gc.set_defaults(func=garbage_collect)

                args = parser.parse_args()
                if args.subcommand:
                    args.func(args)
                else:
                    parser.print_help()
            '';
    writePython3Bin = pkgs.writers.writePython3Bin;
in
{
    environment.systemPackages = [
        (
            writePython3Bin "helper" {flakeIgnore = [ "E501" ];} code
        )
    ];
}
