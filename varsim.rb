class Varsim < Formula
  desc "high-fidelity simulation validation framework for NGS"
  homepage "https://github.com/bioinform/varsim"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/bioinform/varsim/releases/download/v0.5.3/varsim-0.5.3.tar.gz"
  sha256 "f5481cd890fd1ecf525c5a102170f12639af99f14de88dc112adebfbe2dd9f5a"

  depends_on :java

  def install
    jar = "VarSim.jar"
    libexec.install jar
    bin.write_jar_script libexec/jar, "varsim"
    bin.install Dir["var*.py"]
  end

  test do
    assert_match "diploid", shell_output("#{bin}/varsim 2>&1", 1)
  end
end
