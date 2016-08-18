class Gff3toembl < Formula
  desc "Convert GFF3 files to a format suitable for submission to EMBL"
  homepage "https://github.com/sanger-pathogens/gff3toembl"
  # tag "bioinformatics"

  url "https://github.com/sanger-pathogens/gff3toembl/archive/v1.0.9.tar.gz"
  sha256 "94170f7f79a519d90bf19f399ce38872d81aec1befb8b8f39cc58789ddf4bdff"
  head "https://github.com/sanger-pathogens/gff3toembl.git"

  depends_on :python
  depends_on "genometools"

  def install
    version = Language::Python.major_minor_version "python"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{version}/site-packages"

    system "python", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    assert_match "Converts prokaryote GFF3 annotations to EMBL for ENA submission", shell_output("gff3_to_embl -h 2>&1", 0)
  end
end
