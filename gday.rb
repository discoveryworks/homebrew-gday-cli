class Gday < Formula
  desc "Personal calendar and task management CLI that integrates Google Calendar with daily workflows"
  homepage "https://github.com/discoveryworks/gday-cli"
  url "https://github.com/discoveryworks/gday-cli/archive/v1.4.1.tar.gz"
  sha256 "e76ba5ca20f2254b745d46fc68181f90d99a8467e5b12ccc4eb41274050631f0"
  license "MIT"
  version "1.4.1"

  depends_on "python3"
  
  # gcalcli is installed via pip, not Homebrew
  def install
    bin.install "bin/gday"
    lib.install Dir["lib/*"]
    doc.install "README.md"
    (etc/"gday").install "config.yml.example"
  end

  def post_install
    puts <<~EOS
      gday has been installed!
      
      Next steps:
      1. Install gcalcli: pip3 install gcalcli
      2. Set up Google Calendar auth: gday auth
      3. Create config file: cp #{etc}/gday/config.yml.example ~/.config/gday/config.yml
      4. Edit ~/.config/gday/config.yml with your calendar names
      5. Run: gday
      
      See the README for detailed setup instructions.
    EOS
  end

  test do
    # Test that the binary exists and shows help
    assert_match "gday - Personal calendar and task management tool", shell_output("#{bin}/gday --help")
    assert_match "VERSION: 1.4.1", shell_output("#{bin}/gday --help")
  end
end