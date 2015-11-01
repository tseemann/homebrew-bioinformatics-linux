class Snippy < Formula
  desc "Rapid bacterial SNP calling and core genome alignments"
  homepage "https://github.com/tseemann/snippy"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/tseemann/snippy/archive/v2.8.tar.gz"
  sha256 "54e0a5238f0f2555e5b9d29df193af0a9fbfbe27de0059661f95e41263a12fec"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl

  depends_on "bwa"
  depends_on "htslib" # for 'bgzip'
  depends_on "freebayes"
  depends_on "parallel"
  depends_on "samtools"
  depends_on "vcflib"
  depends_on "vcftools"
  depends_on "snpeff"

  def install
    rm "bin/snippy-make_tarball"
    prefix.install Dir["*"]
  end

  test do
    ["","-core","-vcf_report","-vcf_to_tab","-vcf_filter"].each do |suffix|
      assert_match "Usage:", shell_output("snippy#{suffix} 2>&1", 1)
    end
  end
end
