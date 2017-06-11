class LightAssembler < Formula
  desc "Lightweight resources NGS assembly algorithm"
  homepage "https://github.com/SaraEl-Metwally/LightAssembler"
  # doi ""
  # tag "bioinformatics"

  head "https://github.com/SaraEl-Metwally/LightAssembler.git"

  depends_on "zlib" unless OS.mac?

  def install
    system "make", "k=127"
    bin.install "LightAssembler"
    doc.install "README.md"
  end

  test do
    assert_match "LightAssembler", shell_output("#{bin}/LightAssembler 2>&1", 1)
  end
end
