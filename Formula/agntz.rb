# typed: false
# frozen_string_literal: true

class Agntz < Formula
  desc "unified toolbox for agents"
  homepage "https://github.com/byteowlz/agntz"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.2/agntz-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "36141c10a95681ceb9a16f88df9d98a2e31153cdd67847700c651c5f800614b4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.2/agntz-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "5c89bc66992543b6c1937bfd69785bceb3bc9b576c48b48dd51451efb3b24da2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.2/agntz-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ee5b9148f1a3976f1b011767cc5c0931d53332570aa79881ab5badb0e375994"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/agntz/releases/download/v0.3.2/agntz-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd18383e9a3d9d7e5f325a4c075c4ed168240a8d2682f4f33af7ecf3c5a495df"
    end
  end

  def install
    # byt-packaged tarballs stage executables under bin/; older flat
    # tarballs keep them at the archive root. Support both.
    if Dir.exist?("bin")
      bin.install Dir["bin/*"]
    else
      Dir.glob("*").each do |file|
        next if File.directory?(file)
        next unless File.executable?(file)
        bin.install file
      end
    end
  end

  test do
    system "#{bin}/agntz", "--version"
  end
end
