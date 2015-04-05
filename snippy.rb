class Snippy < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/snippy"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/Victorian-Bioinformatics-Consortium/snippy/archive/v2.4.tar.gz"
  sha256 "08335a3ce122088c545da0a0e03df40d8bc86acab5134ebdcda5ae0a8f3f84dc"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "SVG::Graph" => :perl

  depends_on "bwa"
  depends_on "freebayes"
  depends_on "parallel"
  depends_on "samtools"
  depends_on "vcflib"
  depends_on "vcftools"

  def install
    prefix.install Dir["*"]
    # FIXME: don't include snippy-make_tarball in bin/
  end

  test do
    system "#{bin}/snippy --version"
    system "#{bin}/snippy-core -h"
  end
end
