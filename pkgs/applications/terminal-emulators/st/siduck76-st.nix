{ lib, stdenv, fetchFromGitHub, pkg-config, libX11, ncurses, libXext, libXft, fontconfig, harfbuzz }:

stdenv.mkDerivation rec {
  pname = "st";
  version = "0.8.4";

  src = fetchFromGitHub {
    owner = "narutoxy";
    repo = pname;
    rev = "v${version}";
    sha256 = "10771ni4axgbxkfaa5bh6zgya42sxss9fvd7xlp1k1jm568r0zz6";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libX11 ncurses libXext libXft fontconfig harfbuzz ];

  installPhase = ''
    TERMINFO=$out/share/terminfo make install PREFIX=$out
  '';

  meta = with lib; {
    homepage = "https://github.com/narutoxy/st";
    description = "A custom build of st that can live reload, load from XResources and much more";
    license = licenses.mit;
    maintainers = [ maintainers.narutoxy ];
    platforms = platforms.linux;
  };
}
