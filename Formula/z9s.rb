class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD & ArgoCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.55.7.tar.gz"
  sha256 "bc03b8a8509917645225a9bfa36ea5707448db2418b9e1d2d6cbf2e3c7b14e1b"
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
