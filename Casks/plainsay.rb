cask "plainsay" do
  version "0.2.38"
  sha256 "eed9697513c097446bd28ca81d0a09bd8175d791f1c4d09ec45c4f1d3e25bec9"

  url "https://github.com/conrader/plainsay/releases/download/v#{version}/Plainsay-#{version}.dmg",
      verified: "github.com/conrader/plainsay/"
  name "Plainsay"
  desc "Free, open-source, on-device dictation"
  homepage "https://plainsay.app/"

  livecheck do
    url "https://api.plainsay.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Plainsay.app"

  zap trash: [
    "~/Library/Application Support/Plainsay",
    "~/Library/Caches/com.plainsay.dictation",
    "~/Library/Preferences/com.plainsay.dictation.plist",
    "~/Library/Saved Application State/com.plainsay.dictation.savedState",
  ]
end
