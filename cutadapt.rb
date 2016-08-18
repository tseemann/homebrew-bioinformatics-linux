class Cutadapt < Formula
  desc "Removes adapter sequences, primers, and poly-A tails"
  homepage "https://github.com/marcelm/cutadapt"
  # tag "bioinformatics"
  # doi "10.14806/ej.17.1.200"

  url "https://github.com/marcelm/cutadapt/archive/v1.10.tar.gz"
  sha256 "0019eebf971c32c356fc4cffd22dca4040010f097950e9ce578c29e1c92e5b59"

  head "https://github.com/marcelm/cutadapt.git"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "Cython" do
    url "https://pypi.python.org/packages/c6/fe/97319581905de40f1be7015a0ea1bd336a756f6249914b148a17eefa75dc/Cython-0.24.1.tar.gz"
    sha256 "84808fda00508757928e1feadcf41c9f78e9a9b7167b6649ab0933b76f75e7b9"
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
