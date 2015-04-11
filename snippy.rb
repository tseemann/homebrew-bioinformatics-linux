class Snippy < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/snippy"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/Victorian-Bioinformatics-Consortium/snippy/archive/v2.5.tar.gz"
  sha256 "1fa734a9bc1cd6edfbe8cb58e91f81bee769898165ec29912922d5c5e4cdb01e"

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
    rm "bin/snippy-make_tarball"
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/snippy --version"
    system "#{bin}/snippy-core --help"
    system "#{bin}/snippy-vcf_report --help"
    system "#{bin}/snippy-vcf_to_tab --help"
  end
end
