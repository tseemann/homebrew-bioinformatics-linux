class Snpfinder < Formula
  desc "Metagenomic gene/amplicon haplotype caller"
  homepage "https://github.com/cdeanj/snpfinder"
  # tag "bioinformatics"

  url "https://github.com/cdeanj/snpfinder/archive/v1.0.0.tar.gz"
  sha256 "01bc59fa19f56ebfb0f9d39dc169701f2490731e40a45d8f82ac363669edaacf"

  head "https://github.com/cdeanj/snpfinder.git"

  needs :cxx11

  def install
    system "make"
    bin.install "snpfinder"
  end

  test do
    assert_match "amr", shell_output("#{bin}/snpfinder 2>&1", 255)
  end
end
