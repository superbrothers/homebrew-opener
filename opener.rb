class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
      sha256 "e508f34f1723d3d660b96be9e0b722b1ecfbc554232ad465e5b5c4b9e76abfd3"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
      sha256 "54be4df6600c49f1f1bd1c0bfafadf52c93cd9a7d06da7a8680b34d08f31b73f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-arm64.zip"
      sha256 "f7630b186c5809e20b459f34338aeaf90be36f4c5ad63ef46f283a9508a20722"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-amd64.zip"
      sha256 "473687cb91fcc1aa9301263f616afdc41f5e51e379510357cd8369556d98cee4"
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
