class Shovill < Formula
  desc "Faster Spades-based de novo genome assembly"
  homepage "https://github.com/tseemann/shovill"
  url "https://github.com/tseemann/shovill/archive/v0.7.1.tar.gz"
  sha256 "1c50b3558392ab9a13b7c32fc323cd33293bc990843d0ab11e712cad17b3568c"

  head "https://github.com/tseemann/shovill.git"

  # doi ""
  # tag "bioinformatics"

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
