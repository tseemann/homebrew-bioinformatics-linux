class Snippy < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/snippy"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/Victorian-Bioinformatics-Consortium/snippy/archive/v2.3.tar.gz"
  sha256 "e2c3417fe1fb04d7cdff901b56533961fc446b208a511203bccf060144f08a7f"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  
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
  end
end
