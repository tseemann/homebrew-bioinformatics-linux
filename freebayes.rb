class Freebayes < Formula
  desc "Bayesian variant discovery and genotyping"
  homepage "https://github.com/ekg/freebayes"
  # tag "bioinformatics"
  # doi "arXiv:1207.3907v2"

  url "https://github.com/ekg/freebayes.git",
    :tag => "v1.0.2",
    :revision => "0cb269728b2db6307053cafe6f913a8b6fa1331e"

  head "https://github.com/ekg/freebayes.git"

  depends_on "cmake" => :build

  # thes are needed for parallel freebayes
  depends_on "parallel" => :recommended
  depends_on "vcflib" => :recommended

  def install
    # Build fix: https://github.com/chapmanb/homebrew-cbl/issues/14
    inreplace "vcflib/smithwaterman/Makefile", "LDFLAGS=-Wl,-s", "LDFLAGS=-Wl,-v" if OS.mac?
    # Use brewed python
    inreplace "scripts/fasta_generate_regions.py", "#!/usr/bin/python", "#!/usr/bin/env python"

    system "make"

    bin.install "bin/freebayes"
    bin.install "bin/bamleftalign"
    bin.install "scripts/freebayes-parallel"
    bin.install "scripts/coverage_to_regions.py"
    bin.install "scripts/generate_freebayes_region_scripts.sh"
    bin.install "scripts/fasta_generate_regions.py"
  end

  test do
    system "#{bin}/freebayes", "--version"
    system "#{bin}/freebayes-parallel"
  end
end
