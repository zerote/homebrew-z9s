class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD & ArgoCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.55.8.tar.gz"
  sha256 "8ebd69f775cd4becfdd78d7572f943399c914325d3152cb8e3611a470d79e41a"
  license "Apache-2.0"
  
  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", 
            "-ldflags", 
            "-X github.com/zerote/z9s/cmd.version=v#{version} " \
            "-X github.com/zerote/z9s/cmd.commit=#{ENV.fetch('GIT_COMMIT', 'unknown')} " \
            "-X github.com/zerote/z9s/cmd.date=#{Time.now.iso8601}",
            "-o", bin/"z9s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/z9s version")
  end
end
