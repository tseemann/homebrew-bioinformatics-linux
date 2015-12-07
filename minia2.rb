class Minia2 < Formula
  desc "Space-efficient and exact de Bruijn graph assembler"
  homepage "http://minia.genouest.org/"
  # doi "10.1186/1748-7188-8-22"
  # tag "bioinformatics"

  url "http://gatb-tools.gforge.inria.fr/versions/bin/minia-2.0.3-Linux.tar.gz"
  sha256 "4bb9e4c8e8084450db5d50b65b477f6b9d7d40ddf29f4c705ac14705a49a1ed1"

  conflicts_with "minia"

  def install
    bin.install "bin/minia"
    doc.install "doc/manual.pdf"
  end

  test do
    assert_match "topological", shell_output("#{bin}/minia 2>&1", 0)
  end
end
