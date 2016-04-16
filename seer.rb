class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "This formula only supports the Linux binary version."
  end
end

class Seer < Formula
  desc "Sequence element (kmer) enrichment analysis"
  homepage "https://github.com/johnlees/seer"
  # doi "10.1101/038463"
  # tag "bioinformatics"

  depends_on LinuxRequirement

  url "https://github.com/johnlees/seer/releases/download/v1.1.1/seer_v1.1.1_static.tar.gz"
  version "1.1.1"
  sha256 "ba952968b77ee88ff57198eb1d6987dcc2eaf4e48b90f23b2c2f12d11c7b9f4e"

  def install
    bin.install Dir["src/*"]
    pkgshare.install "scripts", "test"
  end

  test do
    assert_match "enrichment", shell_output("#{bin}/seer -h 2>&1", 1)
  end
end
