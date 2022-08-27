class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
      sha256 "13d4306be061e1fa0c9a0e717fca63ba7550d80d48e806ee5524cdf5980f0360"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
      sha256 "fc885329ddd77b4733368767d950947488cdb7bc5b9c0c5fb50bd362748f03a0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-arm64.zip"
      sha256 "2df6dd38f867dead4c62fa0ad7ad551a8601651ebc10001c57e87d3dfe82a4d8"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-amd64.zip"
      sha256 "6569f9ff0d805f638e7e2f44d7bb432c1942fd6a0c9c7d484591d24c9af36f8b"
    end
  end
  license "MIT"

  def install
    bin.install "opener"
  end

  service do
    run opt_bin/"opener"
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/opener.log"
    error_log_path var/"log/opener.log"
  end
end
# vim: set fenc=utf-8 :
