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

  url "https://github.com/johnlees/seer/releases/download/v1.1.2/seer_v1.1.2_static_all.tar.gz"
  version "1.1.2"
  sha256 "19a3b21d66bf0a712b33678680dd56126493962406ba085a776c7101a581ff54"

  def install
    bin.install Dir["*"]
  end

  test do
    assert_match "enrichment", shell_output("#{bin}/seer -h 2>&1", 1)
  end
end
