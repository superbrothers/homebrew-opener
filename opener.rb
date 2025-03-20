class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.1.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
      sha256 "401153f878895d93cd20a1a066721899ed2fb573d6d6271d41dd2edc2c53ae31"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
      sha256 "7c1c2b54033f785c9990b26fe7ab184ad025984f1c61e771a5f634b45665959c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-arm64.zip"
      sha256 "5db49e22a5a824458fe063fbe90ae516c1bfc830880b156f8ccf93aea8932bf8"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-amd64.zip"
      sha256 "8f1dcc0384fa8138e898d5e998e4311b92ded441048b3fafd297924d482ed6ab"
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
