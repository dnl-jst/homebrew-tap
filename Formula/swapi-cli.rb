class SwapiCli < Formula
  desc "Star Wars CLI tool - Explore the Star Wars universe from your command line"
  homepage "https://github.com/dnl-jst/swapi-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnl-jst/swapi-cli/releases/download/v1.1.19/swapi-cli-macos"
      sha256 "001aec8f3c133dc001d652556c511c2668edc0b636a2a832197eecda45ab0bc4"
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
