{
  description = "Bluespec testsuite";
  inputs.nixpkgs.url = github:jcumming/nixpkgs/bluespec-unstable-2020.11.04;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "bsc-testsuite";
        src = self;

        buildInputs = [ bluespec dejagnu gnum4 verilog perl ];
        buildPhase = "make TEST_RELEASE=${bluespec} SYSTEMCTEST=0";

        installPhase = "mkdir -p $out/; touch $out/done";
      };
  };
}
