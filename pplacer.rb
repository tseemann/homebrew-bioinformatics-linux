class Pplacer < Formula
  desc "Places query sequences on a fixed reference phylogenetic tree"
  homepage "http://matsen.fhcrc.org/pplacer/"
  # doi "10.1186/1471-2105-11-538"
  # tag "bioinformatics"

  if OS.mac?
    url "http://matsen.fhcrc.org/pplacer/builds/pplacer-v1.1-Darwin.tar.gz"
    sha256 "89fdc4f2169361d59ff62b799f523909873473510fc0704c03703c62717c1695"
  else
    url "http://matsen.fhcrc.org/pplacer/builds/pplacer-v1.1-Linux.tar.gz"
    sha256 "56609c052469bf7d7d238fd8ed70d06a51877a8a53e8d45272a2e9ba0a6911ed"
  end

  def install
    bin.install "pplacer", "guppy", "rppr"
    (share/"pplacer").install "scripts"
  end

  test do
    system "#{bin}/pplacer", "--version"
  end
end
