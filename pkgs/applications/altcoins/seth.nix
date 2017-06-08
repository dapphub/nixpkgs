{ stdenv, makeWrapper, lib, fetchFromGitHub
, bc, coreutils, curl, ethabi, git, gnused, jshon, solc, which }:

stdenv.mkDerivation rec {
  name = "seth-${version}";
  version = "0.5.2";

  src = fetchFromGitHub {
    owner = "dapphub";
    repo = "seth";
    rev = "v${version}";
    sha256 = "0js2vjcbdlgi6j7y5sjcmrggcrdv5x8cvkzv6hxn6l3mab5w3bhi";
  };

  nativeBuildInputs = [makeWrapper];
  buildPhase = "true";
  makeFlags = ["prefix=$(out)"];
  postInstall = let path = lib.makeBinPath [
    bc coreutils curl ethabi git gnused jshon solc which
  ]; in ''
    wrapProgram "$out/bin/seth" --prefix PATH : "${path}"
  '';

  meta = {
    description = "Command-line client for talking to Ethereum nodes";
    homepage = https://github.com/dapphub/seth/;
    maintainers = [stdenv.lib.maintainers.dbrock];
    license = lib.licenses.gpl3;
    inherit version;
  };
}
