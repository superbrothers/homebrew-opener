class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
      sha256 "809349ba904bb50cabbcef7562eabd50d2e1e60250f26a99fc1caa3582b66b92"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
      sha256 "378eeaf89a9c147c77697e1c5182342887f5894b4082f614821bcb265a949099"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-arm64.zip"
      sha256 "1ab3a69a99a1d3fe75c2a44d0a32ab09f3b9d35d5b777ae60f9d9b0130fd47a9"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-amd64.zip"
      sha256 "4ab4be7c8e02af1f617f56bc4d8a9e68c9ee3104e1796c1182793ee965911ece"
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
