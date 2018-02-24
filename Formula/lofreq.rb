class Lofreq < Formula
  desc "Synteny Block ExpLoration tool"
  homepage "http://csb5.github.io/lofreq/"
  # tag "bioinformatics"

  version "2.1.2"
  
  if OS.mac?
    url "https://sourceforge.net/projects/lofreq/files/lofreq_star-2.1.2_macosx.tgz"
    sha256 "a37ccc1aa69dc82290c1a4207835a449002f6392d6334e4cb9db1cf38a9a2381"
  elsif OS.linux?
    url "https://sourceforge.net/projects/lofreq/files/lofreq_star-2.1.2_linux-x86-64.tgz"
    sha256 "e226e72a1c67148367cde26322053cbd9381ec446129828c10bd0f9269e26623"
  else
    onoe "Unsupported operating system"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lofreq version 2>&1")
  end
end
