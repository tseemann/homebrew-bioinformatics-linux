class Ariba < Formula
  include Language::Python::Virtualenv

  desc "Antibiotic Resistance Identification By Assembly"
  homepage "https://github.com/sanger-pathogens/ariba"
  # tag "bioinformatics"

  url "https://files.pythonhosted.org/packages/37/a7/52899d995ee1a0e707e7a315f1aa9d03bae8a8634f211507d834d9e3abcb/ariba-2.2.5.tar.gz"
  sha256 "675282320b9c74e680c622029beeea0222952e5aa69553eeb83c0dcca60ea2ef"
  head "https://github.com/sanger-pathogens/ariba.git"

  depends_on :python3

  depends_on "cd-hit"
  depends_on "bowtie2"
  depends_on "mash"
  depends_on "mummer"
  depends_on "zlib" unless OS.mac?

  resource "DendroPy" do
    url "https://files.pythonhosted.org/packages/65/3a/19556a58c560de488dffbf3c7fe7c9ed34c1a6223f0dfe971224a42aaf39/DendroPy-4.1.0.tar.gz"
    sha256 "c3d4b2780b84fb6ad64a8350855b2d762cabe45ecffbc04318f07214ee3bdfc9"
  end

  resource "pyfastaq" do
    url "https://files.pythonhosted.org/packages/99/59/9967177929c61cec55205a39e91df3dd7634397d8cb3b40ce66a296ab76b/pyfastaq-3.12.1.tar.gz"
    sha256 "996dee7c5583b9c06c0a96a9e539d5f4218c084a3b2ee757fb245b4222b2a829"
  end

  resource "pymummer" do
    url "https://files.pythonhosted.org/packages/d4/c8/4c5fc016896ee512c7aba4bfedbc962f8bb01e8ec3f87dea0a386b9a4fa5/pymummer-0.8.1.tar.gz"
    sha256 "8e6d9759bedb216453eb7e94a2ea3b79a39b96fde716a35b4aadcf523ca1f313"
  end

  resource "pysam" do
    url "https://files.pythonhosted.org/packages/de/03/02934438b204565bc5231f38a11da840a3c3e4b2beac8c8770d675770668/pysam-0.9.1.4.tar.gz"
    sha256 "56ee7f8d07fa9d78b5c00dfbf335c95edbfed1518a2c14f8f108e58599922dc4"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/ariba test #{testpath}")
    assert_match "Finished run on test data OK", output
  end
end
