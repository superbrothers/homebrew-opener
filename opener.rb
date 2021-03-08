class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.0.1"
  if Hardware::CPU.arm?
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
    sha256 "b1ff316d80340b351ca962747182d2effb3eb1e6922315f5d916413bca55d13e"
  else
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
    sha256 "7a449c2a8f5e7ed0870d019af2cf6e005a7b9e85147f68fe92365eab8d16712a"
  end
  license "MIT"

  def install
    bin.install "opener"
  end

  plist_options manual: "opener"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/opener</string>
        </array>
      </dict>
      </plist>
    EOS
  end
end
# vim: set fenc=utf-8 :
