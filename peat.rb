class Peat < Formula
  homepage "https://github.com/jhhung/PEAT/"
  # tag "bioinformatics"
  # doi ""

  version "1.0b"

  if OS.mac?
    url "https://github.com/jhhung/PEAT/releases/download/v1.0-beta.1/PEAT_mac_v1.0-beta.1"
    sha256 "900ae5e72e7c4fb961fb59d45d82f51350a2d44efa5f932f3c872597438be9b2"
  elsif OS.linux?
    url "https://github.com/jhhung/PEAT/releases/download/v1.0-beta.1/PEAT_linux_v1.0-beta.1"
    sha256 "1a780a32d3245efef62d3ee34dc7a7dd84ad09ec3c631da1968bc3cc2d2869e2"
  else
    fail "Unsupported operating system"
  end

  def install
    if OS.mac?
      bin.install "PEAT_mac.v1.0-beta.1" => "PEAT"
    else
      bin.install "PEAT_linux_v1.0-beta.1" => "PEAT"
    end
  end

  test do
    assert_match "trimming", shell_output("PEAT 2>&1", 1)
    assert_match "single", shell_output("PEAT single 2>&1", 1)
    assert_match "paired", shell_output("PEAT paired 2>&1", 1)
  end
end
