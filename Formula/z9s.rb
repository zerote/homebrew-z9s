class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD & ArgoCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.55.6.tar.gz"
  sha256 "afa670fb591fa7dee1b1af899a2c419e93dc22b3479e44ced16b71b896c9df72"
  license "Apache-2.0"
  
  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", 
            "-ldflags", 
            "-X github.com/yourusername/z9s/cmd.version=v#{version} " \
            "-X github.com/yourusername/z9s/cmd.commit=#{ENV.fetch('GIT_COMMIT', 'unknown')} " \
            "-X github.com/yourusername/z9s/cmd.date=#{Time.now.iso8601}",
            "-o", bin/"z9s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/z9s version")
  end
end
