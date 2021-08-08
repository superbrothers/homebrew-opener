class Opener < Formula
  desc "Open URL from the remote"
  homepage "https://github.com/superbrothers/opener"
  version "0.0.3"
  if Hardware::CPU.arm?
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-arm64.zip"
    sha256 "686ec15b8b6c63d36098def699fa32de7d1c13423daba7d225a0216905ddb56d"
  else
    url "https://github.com/superbrothers/opener/releases/download/v#{version}/opener-darwin-amd64.zip"
    sha256 "b23f5cf9fea34d844aa407aafeba42c1ffc61aaafcf9d9ab6e699f453feeb09e"
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
