class Shovill < Formula
  desc "Faster smarter Spades-based de novo genome assembly"
  homepage "https://github.com/tseemann/shovill"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/shovill/archive/v0.6.0.tar.gz"
  sha256 "daaf22d96660c60d685b935f49c9e57d0893eed96beb1ba0ba883b7889b00c0c"

  head "https://github.com/tseemann/shovill.git"

  depends_on "Time::Piece" => :perl
  depends_on "File::Slurp" => :perl

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
    assert_match version.to_s, shell_output("#{bin}/shovill --version 2>&1", 0)
  end
end
