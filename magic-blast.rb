class MagicBlast < Formula
  desc "Magic BLAST binaries"
  homepage "http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastNews#1"
  # tag "bioinformatics"

  if OS.mac?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/1.0.0/ncbi-magicblast-1.0.0-x64-macosx.tar.gz"
    sha256 "76af31bf11881dd25e42e5b2deddccc54b3fb574d9c5321c4b944f1cc9e15891"
  elsif OS.linux?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/1.0.0/ncbi-magicblast-1.0.0-x64-linux.tar.gz"
    sha256 "098d7760cf78be581807b16773864c0ab27c03ff7f869bb7a8d88795a38c418c"
  else
    onoe "Unsupported operating system"
  end

  version "1.0.0"

  def install
    File.rename("bin/makeblastdb", "bin/magicblast-makeblastdb")
    bin.install Dir["bin/*"]
    doc.install "ChangeLog", "LICENSE", "README"
  end

  def caveats
    <<-EOS.undent
    The 'makeblastdb' command has been installed as 'magicblast-makeblastdb'
    to avoid conflicts with the BLAST+ executables from the 'blast' formula.
    EOS
  end

  test do
    assert_match "BLAST", shell_output("magicblast 2>&1", 1)
  end
end
