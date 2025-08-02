class SwapiCli < Formula
  desc "Star Wars CLI tool - Explore the Star Wars universe from your command line"
  homepage "https://github.com/dnl-jst/swapi-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnl-jst/swapi-cli/releases/download/v1.1.11/swapi-cli-macos"
      sha256 "e020d584360a71c8818ffa6d90b0e0663db17fd35eece3e966e89a3dafa62401"
    else
      url "https://github.com/dnl-jst/swapi-cli/releases/download/v1.0.2/swapi-cli-macos"
      sha256 "9dc8e9a220c56f7be453e03e25474037bcb832a56792f4797388809d4908f363"
    end
  end

  def install
    bin.install "swapi-cli-macos" => "swapi"
    
    # Erstelle Symlink für alternative Namen
    bin.install_symlink "swapi" => "swapi-cli"
  end

  test do
    # Teste ob das Binary funktioniert
    assert_match "Star Wars CLI", shell_output("#{bin}/swapi --help")
    assert_match "swapi", shell_output("#{bin}/swapi --version")
  end
end
