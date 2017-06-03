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

  url "https://github.com/johnlees/seer/releases/download/v1.1.3/seer_v1.1.3_static.tar.gz"
  version "1.1.3"
  sha256 "a69e5384e4c9ceea0fae321cc348e5dfa41271bbc8e440a35c6f8d4ee6a7c2ef"

  def install
    bin.install Dir["*"]
  end

  test do
    assert_match "enrichment", shell_output("#{bin}/seer -h 2>&1", 1)
  end
end
