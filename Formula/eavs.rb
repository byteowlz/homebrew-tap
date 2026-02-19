# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.9/eavs-v0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "ceac50e352a7e9d4c45e9fe3c9accede19a6b81b20e47d98b22b7568591fbbea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.9/eavs-v0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "1dfa4c56e1344538e81ac6e3b5cda0030ebe95401cb53d4ba5d5e6739c0f1635"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.9/eavs-v0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c80bc1a48280743a4332ce1faad9f74009c9cec934aa30da17770dd07525015e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.9/eavs-v0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c402753619c8b70af6145346aeedb5cdc583dff4f1e64defcc7f71caac42a86"
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
