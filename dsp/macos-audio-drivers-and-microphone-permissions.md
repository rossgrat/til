# MacOS Audio Drivers and Microphone Permissions

MacOS audio drivers that live inside Core Audio cannot gain microphone consent by themselves due to TCC (Transparency, Consent, and Control) restrictions. Microphone consent requires an application bundle identifier. HAL plugins run inside their own sandboxed host processes, and don't have bundle IDs that a user can grant.

This is why `frontpair` is both a Core Audio driver and an application helper. The helper is responsible for gaining microphone consent.

TCC is composed of `tccd`, a daemon that needs to be asked for resources, and a SQLite database that holds grants at `com.apple.TCC/TCC.db`. Services are internal string keys (`kTCCServiceMicrophone`, etc.)

One path checked was MDM (Mobile Device Management) and a PPPC payload (Privacy Preferences Policy Control). This is allows remote device management services to write payloads directly into the TCC database, but unfortunately there are carve outs for microphone and camera.
