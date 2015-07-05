class Peat < Formula
  desc "De novo NGS read trimmer which automatically learns adaptor sequences"
  homepage "https://github.com/jhhung/PEAT/"
  # doi "10.1186/1471-2105-16-S1-S2"
  # tag "bioinformatics"

  version "1.2"

  if OS.linux?
    url "https://github.com/jhhung/PEAT/releases/download/v1.2/PEAT_v.1.2_linux_static"
    sha256 "2045b95610759f7732d0709d4024b11da60c9ca049e12f6b24bdd74304a8df84"
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install "PEAT_v.1.2_linux_static" => "PEAT"
  end

  test do
    assert_match "trimming", shell_output("PEAT 2>&1", 1)
    assert_match "single", shell_output("PEAT single 2>&1", 1)
    assert_match "paired", shell_output("PEAT paired 2>&1", 1)
  end
end
