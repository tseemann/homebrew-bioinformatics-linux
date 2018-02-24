class Pftools < Formula
  desc "Detect PROSITE motifs in protein sequences"
  homepage "http://brylinski.cct.lsu.edu/content/pftools"
  # doi "10.1093/bib/3.3.265"
  # tag "bioinformatics"

  url "ftp://lausanne.isb-sib.ch/pub/software/unix/pftools/pft2.3/pft2.3.5.d.tar.gz"
  sha256 "abbe77bf7cdf2d5e813d672e81cb21ed23f68c66fcf4d30960626d8f6362fa84"
  version "2.3.5d"

  depends_on :fortran

  def install
    ENV.deparallelize
    system "make", "all"
    bin.install %w[2ft 6ft gtop htop pfmake pfscale pfscan pfsearch pfw psa2msa ptof ptoh]
    man1.install Dir["man/*.1"]
    man5.install Dir["man/*.5"]
    share.install Dir["*.cmp"] + Dir["*.seq"] + Dir["*HUMAN"]
    doc.install 'README'
  end

  test do
    assert_match "profile", shell_output("#{bin}/pfscan 2>&1", 1)
    assert_match "asymmetric", shell_output("#{bin}/gtop 2>&1", 1)
  end
end
