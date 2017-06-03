class Figtree < Formula
  desc "Graphical viewer of phylogenetic trees"
  homepage "http://tree.bio.ed.ac.uk/software/figtree/"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/rambaut/figtree/releases/download/v1.4.3/FigTree_v1.4.3.tgz"
  sha256 "f497d4dd3a6d220f6b62495b6f47a12ade50d87dbd8d6089f168e94d202f937b"

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
