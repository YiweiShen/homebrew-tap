# https://docs.brew.sh/Cask-Cookbook
cask "voice-ink" do
    version "0.0.2"
    sha256 "0bb543ae7a8ea908ffa738b3639d76d5e28b4095d6386ddcb8f9bcdb4dbbe7ab"

    url "https://github.com/YiweiShen/voice-ink/releases/download/v#{version}/voice-ink.dmg"
    name "voice-ink"
    desc "Lite version of VoiceInk, opinionated."
    homepage "https://github.com/YiweiShen/voice-ink"

    livecheck do
        url "https://github.com/YiweiShen/voice-ink"
        strategy :github_latest
    end

    # auto_updates true
    depends_on macos: ">= :high_sierra"

    app "VoiceInk.app"

    postflight do
        system_command "/bin/chmod", args: ["+x", "/Applications/VoiceInk.app"], sudo: true
        system_command "/usr/bin/xattr", args: ["-cr", "/Applications/VoiceInk.app"], sudo: true
        system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "/Applications/VoiceInk.app"], sudo: true
    end

    zap trash: [
        "~/Library/Application Support/com.yiweishen.VoiceInk",
        "~/Library/Application Support/VoiceInk",
        "~/Library/Caches/com.yiweishen.VoiceInk",
        "~/Library/HTTPStorages/com.yiweishen.VoiceInk",
        "~/Library/Preferences/com.yiweishen.VoiceInk.plist",
        "~/Library/Saved Application State/com.yiweishen.VoiceInk.savedState",
    ]
end
