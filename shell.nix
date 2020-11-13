{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell rec {
    buildInputs = with pkgs; [ bluespec dejagnu gnum4 verilog ];
    shellHook = ''
      cat << EOF
      
      to run bluespec testsuite:
      
        make TEST_RELEASE=${pkgs.bluespec} SYSTEMCTEST=0
      
      TEST_RELEASE   <- bluespec install to test
      SYSTEMCTEST=0  <- disable SystemC tests -- not packaged yet in nixpkgs
      
      EOF
    '';
}
