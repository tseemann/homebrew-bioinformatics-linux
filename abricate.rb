class Abricate < Formula
  homepage "https://github.com/Victorian-Bioinformatics-Consortium/abricate"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/Victorian-Bioinformatics-Consortium/abricate/archive/v0.1.tar.gz"
  sha256 "31ca8375d4743b0ebf74f750f92cde88757052a4d6157ebbce6f250b2bbee124"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl

  depends_on "blast"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/abricate --version"
  end
end
