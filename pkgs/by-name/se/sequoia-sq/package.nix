{ stdenv
, fetchFromGitLab
, lib
, darwin
, nettle
, nix-update-script
, rustPlatform
, pkg-config
, capnproto
, installShellFiles
, openssl
, sqlite
}:

rustPlatform.buildRustPackage rec {
  pname = "sequoia-sq";
  version = "0.38.0";

  src = fetchFromGitLab {
    owner = "sequoia-pgp";
    repo = "sequoia-sq";
    rev = "v${version}";
    hash = "sha256-Zzk7cQs5zD+houNjK8s3tP9kZ2/eAUV/OE3/GrNAXk8=";
  };

  cargoHash = "sha256-Ou+YKfEOmMTZVg9unqoOibMQYsdNAYTq4ZoOANLRk2Y=";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
    capnproto
    installShellFiles
  ];

  buildInputs = [
    openssl
    sqlite
    nettle
  ] ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [ Security SystemConfiguration ]);

  checkFlags = [
    # https://gitlab.com/sequoia-pgp/sequoia-sq/-/issues/297
    "--skip=sq_autocrypt_import"
  ];

  # Needed for tests to be able to create a ~/.local/share/sequoia directory
  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  env.ASSET_OUT_DIR = "/tmp/";

  doCheck = true;

  postInstall = ''
    installManPage /tmp/man-pages/*.*
    installShellCompletion \
      --cmd sq \
      --bash /tmp/shell-completions/sq.bash \
      --fish /tmp/shell-completions/sq.fish \
      --zsh /tmp/shell-completions/_sq
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Cool new OpenPGP implementation";
    homepage = "https://sequoia-pgp.org/";
    changelog = "https://gitlab.com/sequoia-pgp/sequoia-sq/-/blob/v${version}/NEWS";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ minijackson doronbehar ];
    mainProgram = "sq";
  };
}
