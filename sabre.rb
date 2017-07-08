class Sabre < Formula
  desc "Barcode demux & trimming tool for FastQ files"
  homepage "https://github.com/najoshi/sabre"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/najoshi/sabre.git",
    :revision => "039a55e500ba07b7e6432ea6ec2ddcfb3471d949"
  version "1.0.0"

  depends_on "zlib" unless OS.mac?

  def install
    system "make"
    bin.install "sabre"
  end

  test do
    assert_match "multiplex", shell_output("#{bin}/sabre --help 2>&1", 0)
  end
end
