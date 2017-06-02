class Gemma < Formula
  desc "Genome-wide Efficient Mixed Model Association"
  homepage "http://www.xzlab.org/software.html"
  # doi "10.1038/ng.2310"
  # tag "bioinformatics"

  url "https://github.com/xiangzhou/GEMMA/archive/v0.96.tar.gz"
  sha256 "4208e75c9ee1d1e88517ceb62bd5e74b732a931279138b8ebb22b46782b5be14"
  
  head "https://github.com/xiangzhou/GEMMA"

  depends_on "zlib" unless OS.mac?
  depends_on "openblas"
  depends_on "gsl"

  def install
    system "make", "FORCE_DYNAMIC=1"
    bin.install Dir["bin/*"]
    doc.install Dir["doc/*"], "README.txt"
    pkgshare.install "example"
  end

  test do
    assert_match "eigen", shell_output("#{bin}/gemma -h 2>&1")
  end
end
