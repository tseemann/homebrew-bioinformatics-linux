class Varsim < Formula
  desc "High-fidelity simulation validation framework for NGS"
  homepage "https://github.com/bioinform/varsim"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/bioinform/varsim/releases/download/v0.8.1/varsim-0.8.1.tar.gz"
  sha256 "0f5356af93d44d49b1bdd61e0c5fcafe63e45640875703ad42e1e96237619c10"
  
  head "https://github.com/bioinform/varsim.git"

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
