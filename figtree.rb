class Figtree < Formula
  desc "Graphical viewer of phylogenetic trees"
  homepage "http://tree.bio.ed.ac.uk/software/figtree/"
  # doi ""
  # tag "bioinformatics"

  url "http://tree.bio.ed.ac.uk/download.php?id=90&num=3"
  sha256 "5064509fbe8cf069c6b0f8fdacf8c3f651971b11956484ce98a18a114ce1a096"
  version "1.4.2"

  depends_on :java

  def install
    rm "bin/figtree"
    bin.write_jar_script lib/"figtree.jar", "figtree"
    prefix.install Dir["*"]
  end

  test do
    # No test because this is a GUI
  end
end
