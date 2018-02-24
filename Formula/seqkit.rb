class Seqkit < Formula
  desc "Ultrafast FASTA/Q file manipulation"
  homepage "http://bioinf.shenwei.me/seqkit/"

  if OS.mac?
    url "https://github.com/shenwei356/seqkit/releases/download/v0.7.0/seqkit_darwin_amd64.tar.gz"
    sha256 "53e15ed3fe2534d55fc66ee93633cef6a794b12befad22aa57744a612b5d4200"
  else
    url "https://github.com/shenwei356/seqkit/releases/download/v0.7.0/seqkit_linux_amd64.tar.gz"
    sha256 "e69464f1cb0658c0a7e50bc53d5f8bf1597dd7f3d73cf969c0bcde81fddb6d66"
  end
  version "0.7.0"

  # tag "bioinformatics"
  # doi "doi:10.1371/journal.pone.0163962."

  def install
    bin.install "seqkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seqkit 2>&1")
  end
end
