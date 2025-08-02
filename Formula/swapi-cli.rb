class SwapiCli < Formula
  desc "Star Wars CLI tool - Explore the Star Wars universe from your command line"
  homepage "https://github.com/dnl-jst/swapi-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnl-jst/swapi-cli/releases/download/v1.1.14/swapi-cli-macos"
      sha256 "b3e22b0703cd9c0d3b63d449c15abe8199cc673a8f4a89760683fd663181da05"
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
