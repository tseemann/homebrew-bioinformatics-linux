class Wombac < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/wombac"
  # doi ""
  # tag "bioinformatics"
  
  url "https://github.com/Victorian-Bioinformatics-Consortium/wombac/archive/v2.1.tar.gz"
  sha256 "348c0f8df6634787de46cc72c46439e42609e7aa0553da343c7c0f913d537389"

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
