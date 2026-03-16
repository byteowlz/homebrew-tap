# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.0/eavs-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "57eb42bf1c245e575ed3adbd055674dd85ec97139b590b779a2da972dae66323"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.0/eavs-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "89ec132fb3e36a3afc9182552b79ce3cf09ae58a019374a77eb15eb5e7ad9b94"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.0/eavs-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd9edace915703ce487a8a51140364386084a96df7dbb256defea2b838b0ad6e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.0/eavs-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1bc6b7c98dd37642112c2589091adb4d50df992e466b187baadc30b96af68cb"
    end
  end

  def install
    # Install all binaries found in the archive
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/eavs", "--version"
  end
end
