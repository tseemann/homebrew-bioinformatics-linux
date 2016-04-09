class Abricate < Formula
  desc "Find antiobiotic resistance genes in contigs"
  homepage "https://github.com/tseemann/abricate"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/abricate/archive/v0.3.tar.gz"
  sha256 "b140212787d7f6a45806cd1c25c1b75214bc3291f2b568adfc80a61bb4e6d7d2"

  head "https://github.com/tseemann/abricate.git"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl

  depends_on "blast"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("abricate --version")
    assert_match "rifampicin", shell_output("abricate --list 2>&1")
  end
end
