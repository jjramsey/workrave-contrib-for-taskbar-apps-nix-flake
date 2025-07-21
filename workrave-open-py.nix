{
  lib,
  python3,
  python3Packages,
  wrapGAppsNoGuiHook,
}:

let
  name_root = "workrave-open";
  version = "0.1.0";
in
python3.pkgs.buildPythonApplication {
  pname = "${name_root}-py";
  inherit version;
  pyproject = false;

  src = ./.;

  dependencies = [ python3Packages.dasbus ];
  nativeBuildInputs = [ wrapGAppsNoGuiHook ];

  dontWrapGApps = true;
  makeWrapperArgs = [ "\${gappsWrapperArgs[@]}" ];

  dontUnpack = true;
  installPhase = ''
    install -Dm755 "${./${name_root}.py}" "$out/bin/${name_root}.py"
  '';

  meta = {
    homepage = "https://github.com/rcaelers/workrave/tree/main/contrib/waybar-yambar-poss-other-applets";
    description = "Opens Workrave status window if it isn't already open";
    license = lib.licenses.gpl3;
    maintainers = [ ];
  };
  
}
