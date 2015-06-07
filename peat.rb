class Peat < Formula
  desc "De novo NGS read trimmer which automatically learns adaptor sequences"
  homepage "https://github.com/jhhung/PEAT/"
  # doi "10.1186/1471-2105-16-S1-S2"
  # tag "bioinformatics"

  version "1.0"

  if OS.mac?
    url "https://github.com/jhhung/PEAT/releases/download/v1.0-beta.1/PEAT_mac_v1.0-beta.1"
    sha256 "900ae5e72e7c4fb961fb59d45d82f51350a2d44efa5f932f3c872597438be9b2"
  elsif OS.linux?
    url "https://github.com/jhhung/PEAT/releases/download/v1.0/PEAT_v.1.0_linux_static"
    sha256 "c7c85c85393bc0780699cfc0773cfacd3e8c117347181bdcda4ada2f152bec37"
  else
    raise "Unsupported operating system"
  end

  def install
    if OS.mac?
      bin.install "PEAT_mac.v1.0-beta.1" => "PEAT"
    else
      bin.install "PEAT_v.1.0_linux_static" => "PEAT"
    end
  end

  test do
    assert_match "trimming", shell_output("PEAT 2>&1", 1)
    assert_match "single", shell_output("PEAT single 2>&1", 1)
    assert_match "paired", shell_output("PEAT paired 2>&1", 1)
  end
end
