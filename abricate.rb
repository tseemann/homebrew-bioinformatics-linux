class Abricate < Formula
  desc "Find AMR and virulence genes in contigs"
  homepage "https://github.com/tseemann/abricate"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/abricate/archive/v0.4.tar.gz"
  sha256 "e511bdeb0b611bbedd4dbd3caef2051f5d4ff8224aeaeba02c7b91863625071c"

  head "https://github.com/tseemann/abricate.git"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "List::MoreUtils" => :perl
  depends_on "File::Slurp" => :perl
  depends_on "Text::CSV" => :perl
  depends_on "LWP::Simple" => :perl
  depends_on "JSON" => :perl

  depends_on "blast"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abricate --version")
    assert_match "resfinder", shell_output("#{bin}/abricate --list 2>&1")
  end
end
