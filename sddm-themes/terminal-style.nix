{ stdenv, fetchFromGitHub }:
{
  terminal-style-login = stdenv.mkDerivation rec {
    pname = "terminal-style-login-theme";
    version = "0.2";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/terminal-style
    '';
    src = fetchFromGitHub {
      owner = "GistOfSpirit";
      repo = "TerminalStyleLogin";
      rev = "v${version}";
      sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb"; # Find hash for repository
    };
  };
}
