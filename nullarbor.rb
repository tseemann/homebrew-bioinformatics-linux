class Nullarbor < Formula
  homepage "https://github.com/tseemann/nullarbor"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/tseemann/nullarbor/archive/v0.4.tar.gz"
  sha256 "bbc3703e0daf58a71f2046a48c61359b76e5d1f92a3cddd8c6fee8cba57309b7"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "Moo" => :perl
  depends_on "Data::Dumper" => :perl
  depends_on "Spreadsheet::Read" => :perl

  depends_on "snippy"
  depends_on "pandoc" unless OS.linux? # GHC won't build
  depends_on "trimal"
  depends_on "fasttree"
  depends_on "megahit"
  depends_on "kraken"
  depends_on "mlst"
  depends_on "abricate"
  depends_on "newick-utils"
  depends_on "imagemagick" => "with-librsvg"
  depends_on "fasttree"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/nullarbor.pl --version"
  end
end
