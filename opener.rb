class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
      sha256 "6de910001cfffa3c39bcb7f11dc7fa78fc2aa119ffa377689fc24be156682737"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
      sha256 "d6cbe0df5ce89fb8c31bcaeb76183f2d2c425ea2848f341379529146a345dbac"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-arm64.zip"
      sha256 "37d2e1794afaa08f6bc3d60a9193e64f2dda3a4d4ad1c346ee6ac70e342daedd"
    else
      url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-linux-amd64.zip"
      sha256 "fbfaecd56deafb03a268f962e67a12f2e588a4b7ae212b44d0f800f311e1f398"
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
