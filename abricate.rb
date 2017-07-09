class Abricate < Formula
  desc "Find AMR and virulence genes in contigs"
  homepage "https://github.com/tseemann/abricate"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/abricate/archive/v0.5.tar.gz"
  sha256 "2a98736c3a4a060acb4fa4678cb605ca36bd73148fcc5749ad15c74a4a0073ef"

  head "https://github.com/tseemann/abricate.git"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "List::MoreUtils" => :perl
  depends_on "File::Slurp" => :perl
  depends_on "Text::CSV" => :perl
  depends_on "LWP::Simple" => :perl
  depends_on "JSON" => :perl

  depends_on "blast"
  depends_on "emboss"
  depends_on "unzip"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abricate --version")
    assert_match "resfinder", shell_output("#{bin}/abricate --list 2>&1")
  end
end
