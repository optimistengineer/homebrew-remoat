class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.10.tgz"
  sha256 "1ec48f70c7b4ae31491e45e93ac9e9d53f7cc0459b2e09a70043cfd62d0436f0"
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
