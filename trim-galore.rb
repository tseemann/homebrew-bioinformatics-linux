class TrimGalore < Formula
  desc ""
  homepage "http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/"
  # doi ""
  # tag "bioinformatics"

  url "http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/trim_galore_v0.4.1.zip"
  sha256 "7e7609c68c54032e985eedf36d3b810f39e5bd3d1003a3686f2a34f532ae5d3d"

  depends_on "IPC::Open3" => :perl
  depends_on "cutadapt"
  depends_on "fastqc" => :recommended

  def install
    inreplace "trim_galore", "/usr/bin/perl", "/usr/bin/env perl"
    bin.install "trim_galore"
    doc.install Dir["*.pdf"]
  end

  test do
    system "trim_galore", "--version"
  end
end
