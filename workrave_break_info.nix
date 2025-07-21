{
  lib,
  python3,
  fetchPypi,
  python3Packages,
  glib,
  wrapGAppsNoGuiHook,
  replaceVars,
  patched ? false,
}:

let
  pname = "workrave_break_info";
  version = "0.1.1";
in
python3.pkgs.buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-43b5YwTFp4GvG6usq3x7blTXK2mn/O1GtZJ+mNakezU=";
  };

  build-system = [ python3Packages.setuptools ];
  dependencies = [ python3Packages.dasbus ];

  patches = (if patched then [
    (replaceVars ./add-glib-type-lib-path-to-environ.path {
      glib_typelib_path = "${glib.out}/lib/girepository-1.0";
    })
  ] else []);

  nativeBuildInputs = (if patched then [] else  [ wrapGAppsNoGuiHook ]);

  dontWrapGApps = true;
  makeWrapperArgs = (if patched then [] else [ "\${gappsWrapperArgs[@]}" ]);

  pythonImportsCheck = [
    "workrave_break_info"
  ];

  meta = {
    homepage = "https://pypi.org/project/workrave-break-info/";
    description = "Allows info from Workrave timers to appear in tools like Waybar, etc.";
    license = lib.licenses.gpl3;
    maintainers = [ ];
  };
}
