class Shovill < Formula
  desc "Faster smarter Spades-based aseembly"
  homepage "https://github.com/tseemann/shovill"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/shovill/archive/v0.5.tar.gz"
  sha256 "aa01128e98d014725f465a9a2a7c692bb042d0c609dc58a2e05b40f98c1165da"

  head "https://github.com/tseemann/shovill.git"

  depends_on "Time::Piece" => :perl

  depends_on "bwa"
  depends_on "kmc"
  depends_on "samtools"
  depends_on "flash"
  depends_on "lighter"
  depends_on "pilon"
  depends_on "seqtk"
  depends_on "trimmomatic"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "Faster", shell_output("#{bin}/shovill -h 2>&1", 1)
  end
end
