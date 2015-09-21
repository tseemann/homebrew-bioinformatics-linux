class Ispcr < Formula
  desc "In silico PCR - from primers to products"
  homepage "http://hgwdev.cse.ucsc.edu/~kent/src/"
  # doi ""
  # tag "bioinformatics"

  url "https://users.soe.ucsc.edu/~kent/src/isPcr33.zip"
  sha256 "7019ec30440d8b91935ce23700bc2330e140b514e59344f8cda4c6b7146e14fc"
 
#  depends_on "kent-tools"

  def install
    arch = "unix"
    ENV["MACHTYPE"] = arch
    ENV["HOME"] = "#{buildpath}"
    inreplace "inc/common.mk", "-Werror", ""
    mkdir_p "#{buildpath}/lib/#{arch}"
    mkdir_p "#{buildpath}/bin/#{arch}"
    system "make"
    bin.install Dir["bin/#{arch}/*Pcr"];
    doc.install "isPcr/README", "isPcr/version.doc", "isPcr/install.txt"
  end

  test do
    assert_match "In-Situ PCR", shell_output("isPcr 2>&1", 255)
  end
end
