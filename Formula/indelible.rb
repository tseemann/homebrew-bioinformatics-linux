class Indelible < Formula
  desc "Flexible Simulator of Biological Sequence Evolution"
  homepage "https://abacus.gene.ucl.ac.uk/software/indelible/"
  # doi "10.1093/molbev/msp098"
  # tag "bioinformatics"

  url "https://abacus.gene.ucl.ac.uk/software/indelible/EFBKqHdv0v7qir6CyeHgqaz/INDELibleV1.03.tar.gz"
  sha256 "bbbd7bcfb02ce2fadc977b977bfe0b21892b4ca2f82a9542291bbc1e3ee5c57d"

  def install
    cd "src" do
      # MersenneTwister.h:326:19: error: 'getpid' was not declared in this scope
      inreplace "MersenneTwister.h", "<stdio.h>", "<unistd.h>"
      exe = "indelible"
      system ENV.cxx, "-o", exe, "indelible.cpp"
      bin.install exe
    end
    pkgshare.install Dir["help/*"]
  end

  test do
    assert_match "CONTROL FILE", shell_output("#{bin}/indelible < /dev/null 2>&1", 255)
  end
end
