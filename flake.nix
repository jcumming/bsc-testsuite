{
  description = "Bluespec testsuite";
  inputs.nixpkgs.url = github:jcumming/nixpkgs/bluespec-unstable-2020.11.04;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "bsc-testsuite";
        src = self;

        # XXX: time is a shell builtin; figure out how to get a stdenv that has it?
        buildInputs = [ bluespec dejagnu gnum4 verilog perl time ];

        buildPhase = ''
          make TEST_RELEASE=${bluespec} SYSTEMCTEST=0
        '';
      };
  };
}
