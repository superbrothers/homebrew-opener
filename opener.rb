class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.1.0"
  if Hardware::CPU.arm?
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
    sha256 "809349ba904bb50cabbcef7562eabd50d2e1e60250f26a99fc1caa3582b66b92"
  else
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
    sha256 "378eeaf89a9c147c77697e1c5182342887f5894b4082f614821bcb265a949099"
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
