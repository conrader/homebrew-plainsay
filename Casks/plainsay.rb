cask "plainsay" do
  version "0.2.4"
  # api.plainsay.app/releases/Plainsay-latest.dmg is a stable URL that always
  # points at the current notarized build; a version-pinned sha256 doesn't fit.
  sha256 :no_check

  url "https://api.plainsay.app/releases/Plainsay-latest.dmg"
  name "Plainsay"
  desc "Free, open-source, on-device dictation"
  homepage "https://plainsay.app/"

  depends_on macos: :sequoia

  app "Plainsay.app"

  zap trash: [
    "~/Library/Application Support/Plainsay",
    "~/Library/Caches/com.plainsay.dictation",
    "~/Library/Preferences/com.plainsay.dictation.plist",
    "~/Library/Saved Application State/com.plainsay.dictation.savedState",
  ]
end
