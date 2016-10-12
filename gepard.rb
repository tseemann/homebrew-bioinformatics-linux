class Gepard < Formula
  desc "Genome Pair Rapid Dotter"
  homepage "http://cube.univie.ac.at/gepard"
  # doi "10.1093/bioinformatics/btm039"
  # tag "bioinformatics"

  url "https://github.com/univieCUBE/gepard/blob/master/dist/Gepard-1.40.jar?raw=true"
  sha256 "9f35adefbc4843eb87e545bb54a47ef007ea02d145f2c13df86756e63bef8418"

  depends_on :java
  depends_on "vsearch"

  def install
    jar = "Gepard-#{version}.jar"
    libexec.install jar
    bin.write_jar_script libexec/jar, "gepard"
  end

  test do
    # No test because this is a GUI
  end
end
