class Pbsim < Formula
  desc "Pacbio Read Simulator"
  homepage "https://github.com/pfaucon/PBSIM-PacBio-Simulator"
  # doi ""
  # tag "bioinformatics"

  url "https://github.com/pfaucon/PBSIM-PacBio-Simulator.git",
      :revision => "1f5dba46900e4d2b6cc34b1945ac69dafeb46383"
  version "1.0.3"

  head "https://github.com/pfaucon/PBSIM-PacBio-Simulator.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "autoreconf", "-i", "-f"
    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make"
    bin.install "src/pbsim"
    pkgshare.install "sample", "data"
  end

  test do
    assert_match "simulation", shell_output("#{bin}/pbsim 2>&1", 255)
  end
end
