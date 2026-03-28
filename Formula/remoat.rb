class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.13.tgz"
  sha256 "3c91c3f029ef9ff324f9482d2ce7c0a4e40d494ed3563732f9fc2c49597664c2"
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
