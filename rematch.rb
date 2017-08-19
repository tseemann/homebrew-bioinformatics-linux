class Rematch < Formula
  desc "Amplicon read mapping and consensus"
  homepage "https://github.com/B-UMMI/ReMatCh"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/B-UMMI/ReMatCh/archive/v3.2.tar.gz"
  sha256 "60cd3dbdeed519aab397fa19583f84d9e614240dc7525231fcb9ceaf3509ce42"
  head "https://github.com/B-UMMI/ReMatCh.git"

  depends_on "ascp"
  depends_on "bowtie2"
  depends_on "samtools"
  depends_on "bcftools"
#  depends_on "wget"
  depends_on "blast"

  def install
    rm_r "src"
    prefix.install Dir["*"]
    # --doNotUseProvidedSoftware
    (bin/"rematch").write_env_script(prefix/"rematch.py", :PYTHONPATH => prefix/"modules")
  end

  test do
    assert_match "minCovPresence", shell_output("#{bin}/rematch -h 2>&1", 0)
  end
end
