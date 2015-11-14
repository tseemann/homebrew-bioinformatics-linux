class Quaff < Formula
  desc "Pair HMM for aligning FASTQ to FASTA reference"
  homepage "https://github.com/ihh/quaff"
  # tag "bioinformatics"

  url "https://github.com/ihh/quaff.git",
    :revision => "37a570259e84f8f3f54ac01d49b8f70b60749a61"
  version "0.1"

  depends_on "boost"
  depends_on "gsl"

  needs :cxx11

  def install
    ENV.cxx11
    system "make",
      "PREFIX=#{prefix}",
      "CPP=#{ENV.cxx}",
      "GSLPREFIX=#{Formula["gsl"].opt_prefix}",
      "BOOSTPREFIX=#{Formula["boost"].opt_prefix}"
    rm_r %w[src kseq perl t]
    prefix.install Dir["*"]
  end

  test do
    assert_match "Viterbi", shell_output("#{bin}/quaff help 2>&1", 0)
  end
end
