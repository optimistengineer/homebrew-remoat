class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.11.tgz"
  sha256 "923133fdadec6cfcc6e6e4b53bbc030ce11cd93b15c4bbc1be545b6829b8114e"
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
