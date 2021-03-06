{ stdenv, fetchurl, cmake, libx86 }:

stdenv.mkDerivation rec {
  name = "read-edid-${version}";
  version = "3.0.2";

  src = fetchurl {
    url = "http://www.polypux.org/projects/read-edid/${name}.tar.gz";
    sha256 = "0vqqmwsgh2gchw7qmpqk6idgzcm5rqf2fab84y7gk42v1x2diin7";
  };

  buildInputs = [ cmake libx86 ];

  patchPhase = ''
    substituteInPlace CMakeLists.txt --replace 'COPYING' 'LICENSE'
  '';

  meta = with stdenv.lib; {
    description = "Tool for reading and parsing EDID data from monitors";
    homepage = http://www.polypux.org/projects/read-edid/;
    license = licenses.bsd2; # Quoted: "This is an unofficial license. Let's call it BSD-like."
    maintainers = [ maintainers.dezgeg ];
    platforms = platforms.linux;
  };
}
