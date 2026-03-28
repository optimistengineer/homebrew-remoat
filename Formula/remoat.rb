class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.12.tgz"
  sha256 "e62d37b53cd4665f1e03c0a87f6e5999af6d1e837f16d59a55b7022b449c900e"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def post_install
    # Rebuild native addons (better-sqlite3) against the user's Node version
    system "npm", "rebuild", "better-sqlite3", "--prefix", libexec
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/remoat --version")
  end
end
