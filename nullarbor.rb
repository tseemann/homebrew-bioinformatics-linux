class Nullarbor < Formula
  desc "Public health microbiology reports from sequenced isolates"
  homepage "https://github.com/tseemann/nullarbor"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/nullarbor/archive/v1.28.tar.gz"
  sha256 "7525e6d3b6f4a9658bd80c024f7c949a8ddbc21d16fc65d7dc5f35df8e74c902"

  head "https://github.com/tseemann/nullarbor.git"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "Moo" => :perl
  depends_on "Data::Dumper" => :perl
  depends_on "File::Copy" => :perl
  depends_on "YAML::Tiny" => :perl
  depends_on "SVG" => :perl
  depends_on "JSON" => :perl

  depends_on "emboss"
  depends_on "prokka"
  depends_on "fasttree" => "with-double"
  depends_on "megahit"
  depends_on "spades"
  depends_on "kraken"
  depends_on "trimmomatic"
  depends_on "mlst"
  depends_on "abricate"
  depends_on "newick-utils"
  depends_on "imagemagick" => "with-librsvg"
  depends_on "tseemann/bioinformatics-linux/snp-dists"
  depends_on "tseemann/bioinformatics-linux/snippy"
  depends_on "tseemann/bioinformatics-linux/roary"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "dependencies", shell_output("#{bin}/nullarbor.pl --help 2>&1")
    assert_match version.to_s, shell_output("#{bin}/nullarbor.pl --version 2>&1")
  end
end
