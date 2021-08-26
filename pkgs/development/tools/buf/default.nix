{ lib
, buildGoModule
, fetchFromGitHub
, protobuf
, git
, testVersion
, buf
}:

buildGoModule rec {
  pname = "buf";
  version = "0.52.0";

  src = fetchFromGitHub {
    owner = "bufbuild";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-WFL+ztFR8kV6cRY1Ax2TheH+xpA58CLnW69jDpMhe3M=";
  };
  vendorSha256 = "sha256-vbphThpEYDDm1iipcY0QXhKKuLSD87sAxiIUi7SfrAc=";

  patches = [
    # Skip a test that requires networking to be available to work.
    ./skip_test_requiring_network.patch
    # Skip TestWorkspaceGit which requires .git and commits.
    ./skip_test_requiring_dotgit.patch
  ];

  nativeBuildInputs = [ protobuf ];
  # Required for TestGitCloner
  checkInputs = [ git ];

  ldflags = [ "-s" "-w" ];

  preCheck = ''
    # The tests need access to some of the built utilities
    export PATH="$PATH:$GOPATH/bin"
    # To skip TestCloneBranchAndRefToBucket
    export CI=true
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/bin"
    # Only install required binaries, don't install testing binaries
    for FILE in \
      "buf" \
      "protoc-gen-buf-breaking" \
      "protoc-gen-buf-lint" \
      "protoc-gen-buf-check-breaking" \
      "protoc-gen-buf-check-lint"; do
      cp "$GOPATH/bin/$FILE" "$out/bin/"
    done

    runHook postInstall
  '';

  passthru.tests.version = testVersion { package = buf; };

  meta = with lib; {
    homepage = "https://buf.build";
    changelog = "https://github.com/bufbuild/buf/releases/tag/v${version}";
    description = "Create consistent Protobuf APIs that preserve compatibility and comply with design best-practices";
    license = licenses.asl20;
    maintainers = with maintainers; [ raboof jk ];
  };
}
