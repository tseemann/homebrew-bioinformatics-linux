class Peat < Formula
  desc "De novo NGS read trimmer which automatically learns adaptor sequences"
  homepage "https://github.com/jhhung/PEAT/"
  # doi "10.1186/1471-2105-16-S1-S2"
  # tag "bioinformatics"

  version "1.2.2"
 
  if OS.linux?
    url "https://github.com/jhhung/PEAT/releases/download/v1.2.2/PEAT_v.1.2.2_linux_static", :using => NoUnzipCurlDownloadStrategy
    sha256 "d805a2a8497c7800e074ce8b3ea470236a61b05aa790c966dbc2fb7674e89fcc"
  else
    url "https://github.com/jhhung/PEAT/releases/download/v1.2.2/PEAT_v.1.2.2_mac_static", :using => NoUnzipCurlDownloadStrategy
    sha256 "f5581c4717b99a7c455be08dd86f7420d666e731f66e7435d510b4e721792555"
  end

  def install
    if OS.linux?
      bin.install "PEAT_v.1.2.2_linux_static" => "PEAT"
    else
      bin.install "PEAT_v.1.2.2_mac_static" => "PEAT"
    end
  end

  test do
    assert_match "trimming", shell_output("PEAT 2>&1", 1)
    assert_match "single", shell_output("PEAT single 2>&1", 1)
    assert_match "paired", shell_output("PEAT paired 2>&1", 1)
  end
end
