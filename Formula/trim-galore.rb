class TrimGalore < Formula
  desc ""
  homepage "http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/"
  # doi ""
  # tag "bioinformatics"

  url "https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/trim_galore_v0.4.4.zip"
  sha256 "ccd7eecc73327da29230f3e7c7311a4e21b2cfe7282be18fa059ba900fc33116"

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
