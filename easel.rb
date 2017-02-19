class Easel < Formula
  desc "Multiple sequence alignment toolset"
  homepage "http://eddylab.org/infernal/"
  # tag "bioinformatics"

  version "0.43"
  if OS.mac?
    url "http://eddylab.org/infernal/infernal-1.1.2-macosx-intel.tar.gz"
    sha256 "87adbf63c61f66127f14823f1a17451fa960567d0dfdc1d72735a16d41a6a171"
  elsif OS.linux?
    url "http://eddylab.org/infernal/infernal-1.1.2-linux-intel-gcc.tar.gz"
    sha256 "ad062059dfff6450d4a9417846e2695087f5b7c13d64a6deef4a5bcb51b75f3e"
  else
    onoe "Unsupported operating system"
  end

  def install
    bin.install Dir["binaries/esl-*"]
  end

  test do
    assert_match "msafile ", shell_output("#{bin}/esl-afetch -h 2>&1", 0)
  end
end
