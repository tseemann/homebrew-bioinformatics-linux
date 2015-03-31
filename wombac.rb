class Wombac < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/wombac"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/Victorian-Bioinformatics-Consortium/wombac/archive/2.0.tar.gz"
  sha256 "10b60018ecf6678ebcbaec6df7ce874de6e6601a45bf6766958bb0dbde168067"

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
    # FIXME: don't include wombac-make_tarball in bin/
  end

  test do
    system "#{bin}/wombac --version"
  end
end
