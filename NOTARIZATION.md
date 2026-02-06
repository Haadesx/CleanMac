# How to Get CleanMac Verified (Notarization Guide)

To remove the "Apple could not verify..." warning, you must **Notarize** your app. This requires an Apple Developer Account ($99/year).

## Prerequisites
1. **Apple Developer Program**: Enroll at [developer.apple.com](https://developer.apple.com/programs/).
2. **Xcode**: Signed in with your Developer Account.

---

## Step 1: Signing
1. Open `CleanMac.xcodeproj` in Xcode.
2. Select the **CleanMac** target > **Signing & Capabilities**.
3. **Team**: Select your paid Apple Developer Team.
4. **Signing Certificate**: Ensure it says "Developer ID Application".

## Step 2: Archiving
1. In Xcode, go to **Product** > **Archive**.
2. Wait for the build to finish.
3. In the Organizer window, click **Distribute App**.

## Step 3: Notarization
1. Select **Developer ID** > **Next**.
2. Select **Upload** (sends to Apple for scanning).
3. Choose **Automatically manage signing**.
4. Click **Upload**.

*This process takes 5-10 minutes. Apple scans the binary for malware.*

## Step 4: Export & Staple
Once Xcode says "Ready to distribute":
1. Click **Export** in the Organizer.
2. The resulting `.app` (or `.dmg`/`.pkg`) will have a "Ticket" stapled to it.
3. This version is now **Trusted**. Users can open it immediately without warnings.

## Alternative: Command Line Notarization
If you prefer identifying manually:

```bash
# 1. Zip the signed app
/usr/bin/ditto -c -k --keepParent "CleanMac.app" "CleanMac.zip"

# 2. Submit to Apple
xcrun notarytool submit "CleanMac.zip" --keychain-profile "AC_PASSWORD" --wait

# 3. Staple the ticket (if valid)
xcrun stapler staple "CleanMac.app"
```
