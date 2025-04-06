# https://docs.brew.sh/Cask-Cookbook
cask "pulse" do
    version "0.1.15"
    arch arm: "aarch64", intel: "x64"
    sha256 arm: "250bae612f68380c8db57090d67a9ff18a523eae5e8c80b6272e45e0df06b58d",
        intel: "510599f45e1040428a3fa4c8fe24c3f036666988c29291f2a2349afa9bce7991"

    url "https://github.com/YiweiShen/pulse-app/releases/download/v#{version}/Pulse_#{arch}.app.tar.gz"
    name "pulse"
    desc "A minimalist macOS menubar app for email notifications."
    homepage "https://github.com/YiweiShen/pulse-app"

    livecheck do
        url "https://github.com/YiweiShen/pulse-app"
        strategy :github_latest
    end

    auto_updates true
    depends_on macos: ">= :high_sierra"

    app "Pulse.app"

    postflight do
        system_command "/bin/chmod", args: ["+x", "/Applications/Pulse.app"], sudo: true
        system_command "/usr/bin/xattr", args: ["-cr", "/Applications/Pulse.app"], sudo: true
        system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "/Applications/Pulse.app"], sudo: true
    end

    zap trash: [
        "~/Library/Application Support/com.yiweishen.pulse.app",
        "~/Library/Caches/com.yiweishen.pulse.app",
        "~/Library/Preferences/com.yiweishen.pulse.app.plist",
        "~/Library/WebKit/com.yiweishen.pulse.app",
    ]
end
