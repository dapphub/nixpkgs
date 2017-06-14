{ mkDerivation, aeson, ansi-wl-pprint, base, base16-bytestring
, base64-bytestring, binary, brick, bytestring, containers
, cryptonite, data-dword, deepseq, directory, filepath, ghci-pretty
, here, HUnit, lens, lens-aeson, memory, mtl, optparse-generic
, process, QuickCheck, quickcheck-text, readline, rosezipper
, stdenv, tasty, tasty-hunit, tasty-quickcheck, temporary, text
, text-format, unordered-containers, vector, vty
, fetchFromGitHub
}:
mkDerivation rec {
  pname = "hsevm";
  version = "0.3.1";
  src = fetchFromGitHub {
    owner = "dapphub";
    repo = "hsevm";
    rev = "v${version}";
    sha256 = "1na60lzgfx16y9icqixf4vvph2wppj97qlqll7pph207cww2y4rq";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-wl-pprint base base16-bytestring base64-bytestring
    binary brick bytestring containers cryptonite data-dword deepseq
    directory filepath ghci-pretty lens lens-aeson memory mtl
    optparse-generic process QuickCheck quickcheck-text readline
    rosezipper temporary text text-format unordered-containers vector
    vty
  ];
  executableHaskellDepends = [
    aeson ansi-wl-pprint base base16-bytestring base64-bytestring
    binary brick bytestring containers cryptonite data-dword deepseq
    directory filepath ghci-pretty lens lens-aeson memory mtl
    optparse-generic process QuickCheck quickcheck-text readline
    temporary text text-format unordered-containers vector vty
  ];
  testHaskellDepends = [
    base binary bytestring ghci-pretty here HUnit lens mtl QuickCheck
    tasty tasty-hunit tasty-quickcheck text vector
  ];
  homepage = "https://github.com/mbrock/hsevm";
  description = "Ethereum virtual machine evaluator";
  license = stdenv.lib.licenses.agpl3;
}
