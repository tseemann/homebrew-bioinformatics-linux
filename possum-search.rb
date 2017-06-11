class PossumSearch < Formula
  desc "Efficient PSSM searching"
  homepage "http://bibiserv.techfak.uni-bielefeld.de/possumsearch2"
  # tag "bioinformatics"
  # doi "10.1093/bioinformatics/btp593"

  version "2.0"

  if OS.mac?
    url "http://bibiserv.cebitec.uni-bielefeld.de/resources/download/possumsearch/PoSSuM-2_0-darwin9.7.0.amd64.tar.gz"
    sha256 "9087d690bfc816e16c83ef956e5f8b9f1da2ee8d3414275a9922ef9641bb267a"
  else
    url "http://bibiserv.cebitec.uni-bielefeld.de/resources/download/possumsearch/PoSSuM-2_0-linux-gnu.x86_64.tar.gz"
    sha256 "1cc656a1288277c9515572f7c3a5b032cc0dea569045d7b1579afae6ebbf3440"
  end

  def install
    bin.install Dir["bin/possum*"]
    pkgshare.install Dir["share/*"]
  end

  test do
    assert_match "PSSM", shell_output("#{bin}/possumsearch -help 2>&1", 0)
    assert_match "uniform", shell_output("#{bin}/possumdist -help 2>&1", 0)
    assert_match "enhanced", shell_output("#{bin}/possumfreqs -help 2>&1", 0)
  end
end
