class Cutadapt < Formula
  desc "Removes adapter sequences, primers, and poly-A tails"
  homepage "https://github.com/marcelm/cutadapt"
  # tag "bioinformatics"
  # doi "10.14806/ej.17.1.200"

  url "https://github.com/marcelm/cutadapt/archive/v1.9.tar.gz"
  sha256 "e58795de2c1861c5f23d987f7d103eb31f097bdcaeedbbf188878aa44eb3e340"

  head "https://github.com/marcelm/cutadapt.git"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "Cython" do
    url "http://cython.org/release/Cython-0.23.tar.gz"
    sha256 "9fd01e8301c24fb3ba0411ad8eb16f5d9f9f8e66b1281fbe7aba2a9bd9d343dc"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    resource("Cython").stage do
      system "python", *Language::Python.setup_install_args(libexec/"vendor")
    end
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)
    libexec.install Dir[libexec/"bin/*"]
    libexec.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    (bin/"cutadapt").write_env_script(libexec/"bin/cutadapt", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "cutadapt", "--version"
  end
end
