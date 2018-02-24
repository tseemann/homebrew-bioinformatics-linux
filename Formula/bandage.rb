class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "Bandage can be installed on Mac with 'brew cask install bandage'."
  end
end

class Bandage < Formula
  desc "Bioinf App for Navigating De novo Assembly Graphs Easily"
  homepage "https://rrwick.github.io/Bandage/"
  # doi "10.1101/018333"
  # tag "bioinformatics"

  url "https://github.com/rrwick/Bandage/releases/download/v0.8.1/Bandage_Ubuntu_dynamic_v0_8_1.zip"
  sha256 "2e8332e59b95438040a1b0ad29b3730ac63d7c638c635aeddde4789bf7a3116c"

  depends_on LinuxRequirement

  def install
    bin.install "Bandage"
    pkgshare.install "sample_LastGraph"
    doc.install "dependencies"
  end

  test do
    # Bandage is a GUI with no command line testing capability
  end
end
