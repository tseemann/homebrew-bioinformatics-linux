class MagicBlast < Formula
  desc "Magic BLAST binaries"
  homepage "http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastNews#1"
  # tag "bioinformatics"

  version "1.1.0"
  if OS.mac?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/#{version}/ncbi-magicblast-#{version}-x64-macosx.tar.gz"
    sha256 "f962174327841a5f0528a84270b3efb96d7fcdaecba09f3349056836f31ee636"
  elsif OS.linux?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/#{version}/ncbi-magicblast-#{version}-x64-linux.tar.gz"
    sha256 "1e28dc19eaf03b22a94ea439c68945b48afde610c7efbe354c18139c8ad07527"
  else
    onoe "Unsupported operating system"
  end

  version "1.1.0"

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
