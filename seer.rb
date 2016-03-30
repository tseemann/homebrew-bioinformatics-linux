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

  url "https://github.com/johnlees/seer/releases/download/v1.0.2/seer_v1.0.2_static.tar.gz"
  sha256 "7f8649babf948d5da8a6bb88ccad5715c64c3465661d2f12c4e08c168414fb45"

  def install
    bin.install Dir["*"]
  end

  test do
    assert_match "enrichment", shell_output("#{bin}/seer -h 2>&1", 1)
  end
end
