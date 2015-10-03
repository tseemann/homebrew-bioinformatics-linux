class Ngmaster < Formula
  desc "In silico NG-MAST genotyping of contigs"
  homepage "https://github.com/MDU-PHL/ngmaster"
  # tag "bioinformatics"

  url "https://github.com/MDU-PHL/ngmaster/archive/v0.1.tar.gz"
  sha256 "f76a1a0c7fcd7c9b9cd75d78b978bb35382b095fee111b42d7e6b21181b8872a"

  head "https://github.com/MDU-PHL/ngmaster.git"

  depends_on "ispcr"

  depends_on LanguageModuleRequirement.new :python, "biopython", "Bio"

  def install
    prefix.install Dir["*"]
    bin.install_symlink "../ngmaster.py"
  end

  test do
    assert_match "10699\t6277\t4", shell_output("ngmaster.py #{prefix}/example.fna")
  end
end
