class Seer < Formula
  desc "Sequence element (kmer) enrichment analysis"
  homepage "https://github.com/johnlees/seer"
  # doi "10.1101/038463"
  # tag "bioinformatics"

  url "https://github.com/johnlees/seer/releases/download/v1.1.4/seer_v1.1.4.tar.gz"
  sha256 "768b413590bd662352d9f2e448f0392366f2a7b6dd5ebd087855ac8bc004efab"

  head "https://github.com/johnlees/seer.git"

  needs :cxx11

  depends_on "hdf5"
  depends_on "boost"
  depends_on "armadillo"
  depends_on "dlib"
  depends_on "openblas"
  depends_on "gzstream"

  def install
    system "make", "-C", "src", "PREFIX=#{prefix}", "BINDIR=#{bin}"
    bin.install "src/seer", "src/kmds", "src/map_back", "src/combineKmers", "src/filter_seer"
    pkgshare.install "scripts", "test"
    doc.install "LICENSE", "README.md"
  end

  test do
    assert_match "enrichment", shell_output("#{bin}/seer -h 2>&1", 1)
  end
end
