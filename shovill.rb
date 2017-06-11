class Shovill < Formula
  desc "Faster smarter Spades-based aseembly"
  homepage "https://github.com/tseemann/shovill"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/shovill/archive/v0.4.tar.gz"
  sha256 "6fcedfdf2bc12cb6cf6d36426f941f55bf76fe612463b37faf9ce52c46fa3232"

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
