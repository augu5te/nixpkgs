{ stdenv, fetchurl, alsaLib, jack2Full, minixml, pkgconfig }:

stdenv.mkDerivation rec {
  name =  packageName + "-" + version ;
  packageName = "aj-snapshot" ;
  version = "0.9.8";

  src = fetchurl {
    url = "mirror://sourceforge/${packageName}/${name}.tar.bz2";
    sha256 = "0wilky1g2mb88v2z0520s7sw1dsn10iwanc8id5p6z1xsnhg7b6p";
  };

  doCheck = false;

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ alsaLib minixml jack2Full ];

  meta = with stdenv.lib; {
    description = "Tool for storing/restoring JACK and/or ALSA connections to/from cml files";
    longDescription = ''
    Aj-snapshot is a small program that can be used to make snapshots of the connections made between JACK and/or ALSA clients. 
    Because JACK can provide both audio and MIDI support to programs, aj-snapshot can store both types of connections for JACK. 
    ALSA, on the other hand, only provides routing facilities for MIDI clients. 
    You can also run aj-snapshot in daemon mode if you want to have your connections continually restored.
    '';

    homepage = http://aj-snapshot.sourceforge.net/;
    license = licenses.gpl2;
    maintainers = [ maintainers.mrVanDalo ];
    platforms = platforms.all;
  };
}
