class Remoat < Formula
  desc "Control your AI coding assistant from anywhere — right from Telegram"
  homepage "https://github.com/optimistengineer/Remoat"
  url "https://registry.npmjs.org/remoat/-/remoat-0.2.2.tgz"
  sha256 "b5ab120beb2948a3b302bdc9daf0dc222f8598c273a87fb9405e090966557cf5"
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
