class Snippy < Formula
  desc "Rapid bacterial SNP calling and core genome alignments"
  homepage "https://github.com/tseemann/snippy"
  # doi ""
  # tag "bioinformatics"
  
  url "https://github.com/tseemann/snippy/archive/v2.9.tar.gz"
  sha256 "8b07c83b8dc9e6ae6983a933b12d2b87b1f276678c63544c2472cd61721589a9"

  head "https://github.com/tseemann/snippy.git"

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
