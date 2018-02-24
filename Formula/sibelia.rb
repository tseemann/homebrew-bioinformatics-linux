class Sibelia < Formula
  desc "Synteny Block ExpLoration tool"
  homepage "http://bioinf.spbau.ru/sibelia"
  # tag "bioinformatics"

  if OS.mac?
    url "https://downloads.sourceforge.net/project/sibelia-bio/3.0.6/Sibelia-3.0.6-Darwin.tar.gz"
    sha256 "a37ccc1aa69dc82290c1a4207835a449002f6392d6334e4cb9db1cf38a9a2381"
  elsif OS.linux?
    url "https://downloads.sourceforge.net/project/sibelia-bio/3.0.6/Sibelia-3.0.6-Linux.tar.gz"
    sha256 "eb051b626d6d592762b54b30cadb4bfd9182801feeaafb4ded94eef6667297d9"
  else
    onoe "Unsupported operating system"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "loose", shell_output("#{bin}/Sibelia -h 2>&1", 0)
    assert_match "assembly", shell_output("#{bin}/C-Sibelia.py -h 2>&1", 0)
  end
end
