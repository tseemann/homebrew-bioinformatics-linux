class Ascp < Formula
  desc "Aspera command-line download client"
  homepage "https://asperasoft.com/"

  if OS.mac?
    url "https://download.asperasoft.com/download/sw/cli/3.7.2/aspera-cli-3.7.2.354.010c3b8-mac-10.7-64-release.sh"
    sha256 "336bd3db40f9f4c273c4208dbf91df9eb5c607f474881ed19b44d3a26cff226e"
  else
    url "https://download.asperasoft.com/download/sw/cli/3.7.2/aspera-cli-3.7.2.354.010c3b8-linux-64-release.sh"
    sha256 "a8dda6d2159af442eaf1393d4bbc9991628d6fdd1582b4cce04441f770a9a517"
  end

  version "3.7.2.354.010c3b8"

  def install
    # Deduce download name from URL
    installer = stable.url.sub %r{^.*/}, ""
    # Patch in preferred install location
    idir = OS.mac? ? "$HOME/Applications" : "~/.aspera"
    ohai "idir=#{idir}"
    inreplace installer, "INSTALL_DIR=#{idir}", "INSTALL_DIR=#{prefix}"
    system "sh", installer
    # Move everything up a folder
    cdir = OS.mac? ? "Aspera CLI" : "cli"
    ohai "cdir=#{cdir}"
    mv Dir["#{prefix}/#{cdir}/*"], prefix
    rmdir prefix/"cli"
    # Fix audit: Non-executables were installed to "/home/linuxbrew/.linuxbrew/opt/ascp/bin"
    rm "#{bin}/.aspera_cli_conf"
  end

  test do
    assert_match "PROXY", shell_output("#{bin}/ascp -h 2>&1", 0)
  end
end

