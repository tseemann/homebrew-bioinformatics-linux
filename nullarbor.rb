class Nullarbor < Formula
  desc "Public health microbiology reports from sequenced isolates"
  homepage "https://github.com/tseemann/nullarbor"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/nullarbor/archive/v0.9.tar.gz"
  sha256 "063957e34801d70708d3fd32902a96c718e074eda2b2dc62c85e7d42321750fc"

  head "https://github.com/tseemann/nullarbor.git"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "Moo" => :perl
  depends_on "Data::Dumper" => :perl
  depends_on "Spreadsheet::Read" => :perl
  depends_on "File::Copy" => :perl
  depends_on "YAML::Tiny" => :perl

  depends_on "tseemann/bioinformatics-linux/snippy"
  depends_on "tseemann/bioinformatics-linux/roary"
  depends_on "prokka"
  depends_on "fasttree" => "with-double"
  depends_on "megahit"
  depends_on "spades"
  depends_on "kraken"
  depends_on "skewer"
  depends_on "mlst"
  depends_on "abricate"
  depends_on "newick-utils"
  depends_on "parsnp"
  depends_on "imagemagick" => "with-librsvg"
  depends_on "pandoc" unless OS.linux? # GHC won't build
  depends_on "mash" => :optional

  def install
    prefix.install Dir["*"]
  end

  def caveats
    if OS.linux?
      <<-EOS.undent
        You need to install the Linux system package for pandoc:
        - Debian/Ubuntu: sudo apt-get install pandoc
        - Fedora/RHEL: sudo yum install pandoc
      EOS
    end
  end

  test do
    system "#{bin}/nullarbor.pl", "--version"
  end
end
