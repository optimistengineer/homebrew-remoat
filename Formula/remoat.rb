class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.5.tgz"
  sha256 "6f9bebd2f7100a736ffb90deeaf60aafd1e1530acf9e4c07741a5590c1df7ea5"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/remoat --version")
  end
end
