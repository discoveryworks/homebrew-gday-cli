class Gday < Formula
  desc "Personal calendar and task management CLI that integrates Google Calendar with daily workflows"
  homepage "https://github.com/discoveryworks/gday-cli"
  url "https://github.com/discoveryworks/gday-cli/archive/v1.3.0.tar.gz"
  sha256 "85fe66cb79e0a9e7deb52405b46137412eb9d0670542bd6c35043d2851303f7e"
  license "MIT"
  version "1.3.0"

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
    assert_match "VERSION: 1.3.0", shell_output("#{bin}/gday --help")
  end
end