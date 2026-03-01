class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.3.tgz"
  sha256 "fe34e079612f61ad08eaa92993c295a83d937bad50cb18dce5925fe53f89f3bd"
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
