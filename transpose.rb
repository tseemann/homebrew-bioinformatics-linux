class Transpose < Formula
  homepage "http://transpose.sourceforge.net/"
  # doi ""
  # tag ""

  url "https://downloads.sourceforge.net/project/transpose/transpose/transpose-2.0/2.0/transpose-2.0.zip"
  sha256 "cc287954901364e6a4e4e2fd41eef74550a1b5cb2649d09dd2f3f2ac99fc009e"

  def install
    system ENV.cc, "-O3", "-o", "transpose", "src/transpose.c"
    bin.install "transpose"
    doc.install "README"
  end

  test do
    assert_match "Reshape", shell_output("transpose -h 2>&1", 0)
  end
end
