class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "This formula only supports the Linux binary version."
  end
end

class Rapmap < Formula
  desc "Rapid sensitive and accurate read mapping via quasi-mapping"
  homepage "https://github.com/COMBINE-lab/RapMap"
  # doi "10.1093/bioinformatics/btw277"
  # tag "bioinformatics"

  url "https://github.com/COMBINE-lab/RapMap/releases/download/v0.3.0/RapMap-v0.3.0_linux_x86-64.tar.gz"
  version "0.3.0"
  sha256 "56470e5a4abaeeed6b6c0b35c9276a05e074ddb0ce2b0bae98a6f5266c88fbb1"

  depends_on LinuxRequirement

  def install
    bin.install "bin/rapmap"
  end

  test do
    assert_match "quasi", shell_output("#{bin}/rapmap -h 2>&1", 0)
  end
end
