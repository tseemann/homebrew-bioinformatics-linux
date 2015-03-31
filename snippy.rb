class Snippy < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/snippy"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/Victorian-Bioinformatics-Consortium/snippy/archive/v2.2.tar.gz"
  sha256 "5a48f60975f7400fbc6aa0340d6758a17d6f66b2038cfa1aab2319287060642b"

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
