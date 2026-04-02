class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.14.tgz"
  sha256 "bd82c896affd7515ec41e834fe755913133787d5449d107e3c531fa7f8488f49"
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
