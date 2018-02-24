class Roary < Formula
  desc "High speed stand alone pan-genome pipeline"
  homepage "https://sanger-pathogens.github.io/Roary/"
  # doi "doi:10.1093/bioinformatics/btv421"
  # tag "bioinformatics"

  url "https://github.com/sanger-pathogens/Roary/archive/v3.6.6.tar.gz"
  sha256 "63859c34de32f85de4242e4c0eda05e986dea9c02d29fcb9be53251d4f8b76ce"

  depends_on "Bio::Perl" => :perl
  depends_on "Bio::Roary" => :perl

  depends_on "blast"
  depends_on "bedtools"
  depends_on "cd-hit"
  depends_on "mcl"
  depends_on "parallel"
  depends_on "prank"
  depends_on "mafft"
  depends_on "fasttree"

  depends_on "r" => :optional
  depends_on "kraken" => :optional

  def install
    # the Bio::Roary CPAN installs the main tool
    doc.install %w[AUTHORS GPL-LICENSE README.md]
  end

  test do
    assert_match "core", shell_output("#{bin}/roary -h 2>&1", 0)
  end
end
