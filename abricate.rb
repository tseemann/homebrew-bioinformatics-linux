class Abricate < Formula
  homepage "https://github.com/tseemann/abricate"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/tseemann/abricate/archive/v0.2.tar.gz"
  sha256 "65069fd0bffaae92b5144262ba9ca736a0ddb1f657ebe27bc3d1a5160ce16f66"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl

  depends_on "blast"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "#{version}", shell_output("abricate --version")
    assert_match "rifampicin", shell_output("abricate --list 2>&1")
  end
end
