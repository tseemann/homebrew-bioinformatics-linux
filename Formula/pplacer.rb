class Pplacer < Formula
  desc "Places query sequences on a fixed reference phylogenetic tree"
  homepage "http://matsen.fhcrc.org/pplacer/"
  # doi "10.1186/1471-2105-11-538"
  # tag "bioinformatics"

  url "https://github.com/matsen/pplacer/releases/download/v1.1.alpha18/pplacer-linux-v1.1.alpha18-2-gcb55169.zip"
  version "1.1.18a-2"
  sha256 "4480a74a210b0b79c7da55c2a6851bb66eac411474b8d3f5109f7c5ea1cf41b8"

  def install
    bin.install "pplacer", "guppy", "rppr"
    (share/"pplacer").install "scripts"
  end

  test do
    system "#{bin}/pplacer", "--version"
  end
end
