class Roary < Formula
  desc "High speed stand alone pan-genome pipeline"
  homepage "https://sanger-pathogens.github.io/Roary/"
  # doi "doi:10.1093/bioinformatics/btv421"
  # tag "bioinformatics"

  url "https://github.com/sanger-pathogens/Roary/archive/v3.5.1.tar.gz"
  sha256 "3224dba59ea11b6154e3dbff8529f5a9592c229ece480801d4b7925a8c13146e"

  depends_on "Bio::Perl" => :perl
  depends_on "Bio::Roary" => :perl

  depends_on "blast"
  depends_on "bedtools"
  depends_on "cd-hit"
  depends_on "mcl"
  depends_on "parallel"
  depends_on "prank"
  depends_on "fasttree" => "with-double"

  depends_on "r" => :optional
  depends_on "kraken" => :optional

  def install
    # the Bio::Roary CPAN installs the main tool
    doc.install %w[AUTHORS GPL-LICENSE README.md]
  end

  test do
    assert_match "core", shell_output("roary -h 2>&1", 255)
  end
end
