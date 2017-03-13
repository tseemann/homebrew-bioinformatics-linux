class Gemma < Formula
  desc "Genome-wide Efficient Mixed Model Association"
  homepage "http://www.xzlab.org/software.html"
  # doi "10.1038/ng.2310"
  # tag "bioinformatics"

  url "http://www.xzlab.org/software/gemma-0.94.tar.gz"
  sha256 "08c7569bb075ce62c89c4ec4e003b7d256cd435e547b89d68fc23aec184d5b35"

  depends_on "zlib" unless OS.mac?
  depends_on "openblas"
  depends_on "gsl"

  def install
    system "make"
    bin.install Dir["bin/*"]
    doc.install Dir["doc/*"], "README.txt"
    pkgshare.install "example"
  end

  test do
    assert_match "eigen", shell_output("#{bin}/gemma -h 2>&1")
    assert_match "eigen", shell_output("#{bin}/gemmaf -h 2>&1")
  end
end
