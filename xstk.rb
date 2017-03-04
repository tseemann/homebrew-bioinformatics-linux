class Xstk < Formula
  desc "XplorSeq ToolKit for nucleic acids sequence analysis"
  homepage "http://www.phyloware.com/Phyloware/XSTK.html"
  # doi "10.1186/1471-2105-10-362"
  # tag "bioinformatics"

  url "http://www.phyloware.com/Phyloware/XSTK_files/xstk_30May2012.tar.gz"
  sha256 "8ef9f2a8e0514f3f02aebbae91dc5b54754c0119a3ad44423f3c1f4c1a151291"
  version "20120530"

  def install
    system "make"
    bin.install Dir["bin/*"]
    pkgshare.install "tests"
  end

  test do
    assert_match "primer", shell_output("xsel 2>&1", 1)
  end
end
