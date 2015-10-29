class Snippy < Formula
  desc "Rapid bacterial SNP calling and core genome alignments"
  homepage "https://github.com/tseemann/snippy"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/tseemann/snippy/archive/v2.7.tar.gz"
  sha256 "9e19b77ddb125cc6e96971d3e7951da09d73d24fffa5a5775f3cf991f413cfcc"

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
    ["","-core","-vcf_report","-vcf_to_tab"].each do |suffix|
      assert_match "Usage:", shell_output("snippy#{suffix} 2>&1", 1)
    end
  end
end
