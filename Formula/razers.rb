class Razers < Formula
  homepage "http://www.seqan.de/projects/razers/"
  # head "https://github.com/seqan/seqan/tree/master/apps/razers3"
  # tag "bioinformatics"
  # doi "10.1093/bioinformatics/bts505"

  version "3.4.0"

  if OS.mac?
    url "http://packages.seqan.de/razers3/razers3-3.4.0-Mac-x86_64.tar.bz2"
    sha256 "487a9a4b9fc006ee32f7c50fa64d78fc848a8bb36ab70ab794b8c207fde310d4"
  elsif OS.linux?
    url "http://packages.seqan.de/razers3/razers3-3.4.0-Linux-x86_64.tar.bz2"
    sha256 "e7c10341a92ec77e82556969a410e97f6d5349d605157f33b0f6599afe25a871"
  else
    ohoe "Unsupported operating system"
  end

  def install
    bin.install "bin/razers3"
    doc.install "LICENSE", "README"
    (share/"razers").install "example"
  end

  test do
    assert_match "versatile", shell_output("#{bin}/razers3 -help 2>&1", 0)
    assert_match "read2", shell_output("#{bin}/razers3 -o - #{share}/razers/example/genome.fa #{share}/razers/example/reads.fa")
  end
end
