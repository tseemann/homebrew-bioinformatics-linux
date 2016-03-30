class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "This formula only supports the Linux version."
  end
end

class Bandage < Formula
  desc "Bioinf App for Navigating De novo Assembly Graphs Easily"
  homepage "https://rrwick.github.io/Bandage/"
  # doi "10.1101/018333"
  # tag "bioinformatics"

  url "https://github.com/rrwick/Bandage/releases/download/v0.7.1/Bandage_Ubuntu_14.04_dynamic_v0.7.1.zip"
  sha256 "53519781665480b751d9173756be5e3a916941f23a5dc706851b69c791418189"

  depends_on LinuxRequirement
#  depends_on "pcre"
#  depends_on "qt5"

  def install
    bin.install "Bandage"
    pkgshare.install "sample_LastGraph"
    doc.install "dependencies"
  end

  test do
    # Bandage is a GUI with no command line capability
  end
end
