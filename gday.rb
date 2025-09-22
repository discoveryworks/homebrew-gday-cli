class Gday < Formula
  desc "Personal calendar and task management CLI that integrates Google Calendar with daily workflows"
  homepage "https://github.com/discoveryworks/gday-cli"
  url "https://github.com/discoveryworks/gday-cli/archive/v1.8.0.tar.gz"
  sha256 "5d17acb8f8c6c7023f8945b7b1392298f63fba83c6bcd23dc115d78d389e4560"
  license "MIT"
  version "1.8.0"

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
    assert_match "VERSION: 1.8.0", shell_output("#{bin}/gday --help")
  end
end