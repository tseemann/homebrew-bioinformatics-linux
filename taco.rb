class Taco < Formula
  desc "Multi-sample transcriptome assembly protocol"
  homepage "https://tacorna.github.io/"
  # tag "bioinformatics"

  version "0.5.0"
  if OS.mac?
    url "https://github.com/tacorna/taco/releases/download/v0.5.0/taco-v0.5.0.OSX_x86_64.tar.gz"
    sha256 "2c1dea68d3b13ddc8cf9139fe5e9ffc483f07058fae24e8db880d4891e65c8b2"
  elsif OS.linux?
    url "https://github.com/tacorna/taco/releases/download/v0.5.0/taco-v0.5.0.Linux_x86_64.tar.gz"
    sha256 "9d350134fa6e202500717e51c8f26a054f06171249d617c617f24a410815d659"
  else
    onoe "Unsupported operating system"
  end

  def install
    bin.install "taco"
  end

  test do
    assert_match "taco", shell_output("#{bin}/taco -h 2>&1", 0)
  end
end
