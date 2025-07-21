Contributed scripts/pkgs to use Workrave in taskbar apps, such as
Waybar, SFWBary, Yambar, Swaybar, and so on.

This is basically a flake to Nixify installation of the Python scripts
seen here:
https://github.com/rcaelers/workrave/tree/main/contrib/waybar-yambar-poss-other-applets

However, rather than use `workrave_break_info.py` as both a script and
a module, the [`workrave_break_info` module from
PyPi](https://pypi.org/project/workrave-break-info/) is used, and
`workrave-break-info` is used wherever `workrave_break_info.py` would
be used as a script.

Since Workrave is under
[GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html), the scripts
and modules here are also under GPL-3.0. The Nix code, though, is
simply under the [MIT license](https://opensource.org/license/mit).
