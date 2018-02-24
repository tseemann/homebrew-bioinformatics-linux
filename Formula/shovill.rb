class Shovill < Formula
  desc "Faster Spades-based de novo genome assembly"
  homepage "https://github.com/tseemann/shovill"
  url "https://github.com/tseemann/shovill/archive/v0.8.0.tar.gz"
  sha256 "b27cfd00adf541fa75645b9874b9243c9928c194c0c126fd0829cf00771bffa4"

  head "https://github.com/tseemann/shovill.git"

  # doi ""
  # tag "bioinformatics"

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
    assert_match "Using", shell_output("#{bin}/shovill --check 2>&1")
  end
end
