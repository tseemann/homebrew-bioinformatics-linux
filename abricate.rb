class Abricate < Formula
  desc "Find AMR and virulence genes in contigs"
  homepage "https://github.com/tseemann/abricate"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/abricate/archive/v0.6.tar.gz"
  sha256 "fa5d2c72b2b50ca0909168390ef39755a6086948c2b04dd90e55320687e586c4"

  head "https://github.com/tseemann/abricate.git"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "List::MoreUtils" => :perl
  depends_on "File::Slurp" => :perl
  depends_on "Text::CSV" => :perl
  depends_on "LWP::Simple" => :perl
  depends_on "JSON" => :perl

  depends_on "blast" => :build

  depends_on "blast"
  depends_on "emboss"
  depends_on "unzip"

  def install
    prefix.install Dir["*"]
  end

  def post_install
    system "#{bin}/abricate", "--setupdb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abricate --version")
    assert_match "resfinder", shell_output("#{bin}/abricate --list 2>&1")
    assert_match "OK", shell_output("#{bin}/abricate --check 2>&1")
  end
end
