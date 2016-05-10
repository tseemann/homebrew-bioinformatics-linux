class Minia2 < Formula
  desc "Space-efficient and exact de Bruijn graph assembler"
  homepage "http://minia.genouest.org/"
  # doi "10.1186/1748-7188-8-22"
  # tag "bioinformatics"

  url "https://github.com/GATB/minia/releases/download/v2.0.7/minia-v2.0.7-bin-Linux.tar.gz"
  sha256 "c51292aeaea4ff7c9c06a321776ba44ba4e613d5872555cc7985fb863ede4b72"

  # for h5dump
  depends_on "hdf5" => :optional

  # minia 1.x series
  conflicts_with "minia"

  def install
    bin.install "bin/minia"
  end

  test do
    assert_match "topological", shell_output("#{bin}/minia 2>&1", 0)
  end
end
