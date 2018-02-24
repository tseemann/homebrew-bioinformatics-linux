class MagicBlast < Formula
  desc "Magic BLAST read mapper"
  homepage "https://ncbi.github.io/magicblast/"
  # tag "bioinformatics"

  version "1.3.0"
  if OS.mac?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/#{version}/ncbi-magicblast-#{version}-x64-macosx.tar.gz"
    # FIXME - this is wrong:
    sha256 "f962174327841a5f0528a84270b3efb96d7fcdaecba09f3349056836f31ee636"
  elsif OS.linux?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/#{version}/ncbi-magicblast-#{version}-x64-linux.tar.gz"
    sha256 "9247ebcd14e4f0ca1e710d3b5fd228ff2c9d61a11acac8862136758763e3f3d6"
  else
    onoe "Unsupported operating system"
  end

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
    assert_match "BLAST", shell_output("#{bin}/magicblast 2>&1", 1)
  end
end
