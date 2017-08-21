class Distmat < Formula
  desc "Compute a distance matrix from a core genome alignment file"
  homepage "https://github.com/c2-d2/distmat"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/c2-d2/distmat.git",
    :revision => "e50ca60221f78f9eef4d624353f600a19a984439"
  version "0.0.1"

  depends_on "zlib" unless OS.mac?

  def install
    ENV.cxx11
    system "make"
    system "make", "-C", "tests"
    bin.install "distmat" => "dist-mat"
    pkgshare.install "tests"
  end

  test do
    assert_match "matrix", shell_output("#{bin}/dist-mat -h 2>&1", 0)
    
  end
end
