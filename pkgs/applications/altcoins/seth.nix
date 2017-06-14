{ stdenv, makeWrapper, lib, fetchFromGitHub
, perl, bc, coreutils, curl, ethabi, git, gnused, jshon, solc, which }:

stdenv.mkDerivation rec {
  name = "seth-${version}";
  version = "0.5.5";

  src = fetchFromGitHub {
    owner = "dapphub";
    repo = "seth";
    rev = "v${version}";
    sha256 = "14xhcnavymsqrk2h233ilqp39g39w4pcjpx6bvcphr2j28h9h2zr";
  };

  nativeBuildInputs = [makeWrapper];
  buildPhase = "true";
  makeFlags = ["prefix=$(out)"];
  postInstall = let path = lib.makeBinPath [
    perl bc coreutils curl ethabi git gnused jshon solc which
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
