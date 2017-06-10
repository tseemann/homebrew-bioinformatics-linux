class Rematch < Formula
  desc "Amplicon read mapping and consensus"
  homepage "https://github.com/B-UMMI/ReMatCh"
  # tag "bioinformatics"

  url "https://github.com/B-UMMI/ReMatCh/archive/v2.0.tar.gz"
  sha256 "64e5c8f359c971e419888bf79c4e99116989d6b48d76a87f67c5a240519eaea8"
  head "https://github.com/B-UMMI/ReMatCh.git"

  depends_on "ascp"
  depends_on "bowtie2"
  depends_on "samtools"
  depends_on "bcftools"
  depends_on "wget"
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
