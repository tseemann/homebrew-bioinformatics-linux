class Shovill < Formula
  desc "Faster Spades-based de novo genome assembly"
  homepage "https://github.com/tseemann/shovill"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/tseemann/shovill/archive/v0.7.0.tar.gz"
  sha256 "38e43e088f5ec898678d9056f658b97612cd888cf80eae47fcdddf308aaaac89"

  head "https://github.com/tseemann/shovill.git"

  depends_on "Time::Piece" => :perl
  depends_on "File::Slurp" => :perl

  depends_on "bwa"
  depends_on "flash"
  depends_on "kmc"
  depends_on "lighter"
  depends_on "pigz"
  depends_on "pilon"
  depends_on "samtools"
  depends_on "seqtk"
  depends_on "trimmomatic"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "Faster", shell_output("#{bin}/shovill --help 2>&1")
    assert_match version.to_s, shell_output("#{bin}/shovill --version 2>&1")
  end
end
