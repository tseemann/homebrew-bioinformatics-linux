class Peat < Formula
  desc "De novo NGS read trimmer which automatically learns adaptor sequences"
  homepage "https://github.com/jhhung/PEAT/"
  # doi "10.1186/1471-2105-16-S1-S2"
  # tag "bioinformatics"

  version "1.2.3"

  if OS.linux?
    url "https://github.com/jhhung/PEAT/releases/download/v1.2.3/PEAT_linux", :using => NoUnzipCurlDownloadStrategy
    sha256 "f190be0de93d68d5a16d270a8d7ac9236716820f77c236ef2481bbc07e04f2f0"
  else
    url "https://github.com/jhhung/PEAT/releases/download/v1.2.3/PEAT_mac", :using => NoUnzipCurlDownloadStrategy
    sha256 "f5581c4717b99a7c455be08dd86f7420d666e731f66e7435d510b4e721792555"
  end

  def install
    if OS.linux?
      bin.install "PEAT_linux" => "PEAT"
    else
      bin.install "PEAT_mac" => "PEAT"
    end
  end

  test do
    assert_match "trimming", shell_output("#{bin}/PEAT 2>&1", 1)
    assert_match "single", shell_output("#{bin}/PEAT single 2>&1", 1)
    assert_match "paired", shell_output("#{bin}/PEAT paired 2>&1", 1)
  end
end
