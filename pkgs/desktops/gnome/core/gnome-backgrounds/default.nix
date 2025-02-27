{ lib, stdenv, fetchurl, meson, ninja, pkg-config, gnome, gettext }:

stdenv.mkDerivation rec {
  pname = "gnome-backgrounds";
  version = "41.0";

  src = fetchurl {
    url = "mirror://gnome/sources/gnome-backgrounds/${lib.versions.major version}/${pname}-${version}.tar.xz";
    sha256 = "HaGsDSYb7fD80shbSAvGVQXiPPUfEUMSbA03cX5pMUU=";
  };

  passthru = {
    updateScript = gnome.updateScript { packageName = "gnome-backgrounds"; attrPath = "gnome.gnome-backgrounds"; };
  };

  nativeBuildInputs = [ meson ninja pkg-config gettext ];

  meta = with lib; {
    platforms = platforms.unix;
    maintainers = teams.gnome.members;
  };
}
