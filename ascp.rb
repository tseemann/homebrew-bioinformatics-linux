class Ascp < Formula
  desc "Aspera Connect command-line download client"
  homepage "http://asperasoft.com/software/transfer-clients/"

  url "http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz"
  version "3.6.2.117442"
  sha256 "4f69f2cd410ee770dbd81002af7be79715a6de77cbb84fc1bf12ad7a2751a457"

  def install
    blob = "aspera-connect-#{version}-linux-64.sh"
    inreplace blob, "~/.aspera/connect", prefix
    system "sh", blob
    # ensure these dodgy GUIs don't pollute brew paths
    mv prefix/"lib", prefix/"lib.old"
    mv prefix/"bin", prefix/"bin.old"
    # keep the important command line tool
    bin.install prefix/"bin.old/ascp"
  end

  test do
    assert_match "PROXY", shell_output("ascp -h 2>&1", 0)
  end
end
