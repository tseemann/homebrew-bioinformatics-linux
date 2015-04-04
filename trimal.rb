class Trimal < Formula
  homepage "http://trimal.cgenomics.org/"
  # doi "10.1093/bioinformatics/btp348"
  # tag "bioinformatics"
  head "https://github.com/scapella/trimal"

  url "http://trimal.cgenomics.org/_media/trimal.v1.2rev59.tar.gz"
  sha256 "a29a3807e5a6c7a3d7e2185d8dd268415190a527668aaa04a4b42fc1f7db96fe"
  version "1.2"

  def install
    system "make", "-C", "source"
    bin.install "source/readal", "source/trimal"
    doc.install %w[AUTHORS  CHANGELOG  LICENSE  README  dataset]
  end

  test do
    assert_match "Salvador", shell_output("trimal 2>&1", 0)
    assert_match "Salvador", shell_output("readal 2>&1", 0)
  end
end
