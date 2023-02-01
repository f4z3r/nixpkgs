{ lib
, stdenvNoCC
, fetchurl
, unzip
}:

stdenvNoCC.mkDerivation rec {
  pname = "roboto-serif";
  version = "1.007";

  src = fetchurl {
    url = "https://github.com/googlefonts/roboto-serif/releases/download/v${version}/RobotoSerifFonts-v${version}.zip";
    hash = "sha256-A14GztkTvaLBvcm1i3A0Vi9vaz77nFYYoSNggqbffFo=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [
    unzip
  ];

  installPhase = ''
    runHook preInstall

    install -Dm644 variable/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = with lib; {
    description = "The Roboto family of fonts";
    longDescription = ''
      Google’s signature family of fonts, the default font on Android and
      Chrome OS, and the recommended font for Google’s visual language,
      Material Design.
    '';
    homepage = "https://github.com/googlefonts/roboto-serif";
    license = licenses.ofl;
    maintainers = with maintainers; [ wegank ];
    platforms = platforms.all;
  };
}
