{ stdenv, fetchFromGitHub, gnugrep, ncurses, pkgconfig, readline }:

stdenv.mkDerivation rec {
  name = "pspg-${version}";
  version = "1.6.2";

  src = fetchFromGitHub {
    owner = "okbob";
    repo = "pspg";
    rev = "${version}";
    sha256 = "0gg94isnmng1qigghc2lrk4mvim20clbfhacwlxnd237ypv4mn2s";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ gnugrep ncurses readline ];

  preBuild = ''
    makeFlags="PREFIX=$out PKG_CONFIG=${pkgconfig}/bin/pkg-config"
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/okbob/pspg;
    description = "Postgres Pager";
    license = licenses.bsd2;
    platforms = platforms.linux;
    maintainers = [ maintainers.jlesquembre ];
  };
}
