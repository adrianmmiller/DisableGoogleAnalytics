# DisableGoogleAnalytics
Attempts To Disable Common Google Analytics And Ads Receivers In All Affected Packages

### What it does/How it works: ###

On 1st run after rebooting after install the module is assuming you want it to disable the listed 
analytics and ad receivers, so it will:

- Wait till boot is completed
- Then sleep for 2 minutes
- Then test that cpu usage is under 30% before running
- It will then disable the analytics and ad receivers as listed below, and log its progress to /sdcard/fixgoogleanalytics.log

   Common Analytics And Ad Recievers:

   *com.google.android.gms.analytics.AnalyticsJobService*
   *com.google.android.gms.analytics.CampaignTrackingService*
   *com.google.android.gms.measurement.AppMeasurementService*
   *com.google.android.gms.measurement.AppMeasurementJobService*
   *com.google.android.gms.analytics.AnalyticsReceiver*
   *com.google.android.gms.analytics.CampaignTrackingReceiver*
   *com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver*
   *com.google.android.gms.measurement.AppMeasurementReceiver*
   *com.google.android.gms.measurement.AppMeasurementContentProvider*
   *com.crashlytics.android.CrashlyticsInitProvider*
   *com.google.android.gms.ads.AdActivity*
   *com.google.firebase.iid.FirebaseInstanceIdService*


- Once complete the service.sh script will delete itself
- Once that happens any further interaction is purely via the included **fga** script as a binary
in /system/(x)bin
 
   **fga** takes 2 arguments, **disable** or **enable**, though i doubt too many will be looking to enable 
   analytics and ad receivers, unless the disabling has unwanted effects on their system, which
   is high time to include the usual disclaimer that you run this at your own risk and not even
   fga enable is garaunteed to undo the changes


### Installation/Usage: ###

- Install via Magisk Manager
- After first run optmization has completed, any further interaction is purely via the included **fga** script as a binary
in /system/(x)bin:

**fga** takes 2 arguments, **disable** or **enable**, though i doubt too many will be looking to enable 
analytics and ad receivers, unless the disabling has unwanted effects on their system, which
is high time to include the usual disclaimer that you run this at your own risk and not even
fga enable is garaunteed to undo the changes

**Uninstall Note:** Uninstalling the module **will not reverse the changes**, if your intention is to uninstall the module and re-enable the
analytics and ad receivers, please run **fga enable** first



### Licensing: ###

**Please note:** the included LICENSE **only** covers the module components provided by the excellent work of Zack5tpg's 
Magisk Module Extended, which is available for here for module creators

https://github.com/Zackptg5/MMT-Extended/

All other work is credited above and **no one may fork or re-present this module as their own for the purposes of trying to monetize this module or its content without all parties permission. The module comes specifically without an overall license for this intent.**


### Changelog: ###

Please see: https://github.com/stylemessiah/DisableGoogleAnalytics/blob/main/CHANGELOG.md


### Project Stats: ###

![GitHub release (latest by date)](https://img.shields.io/github/v/release/stylemessiah/DisableGoogleAnalytics?label=Release&style=plastic)
![GitHub Release Date](https://img.shields.io/github/release-date/stylemessiah/DisableGoogleAnalytics?label=Release%20Date&style=plastic)
![GitHub Releases](https://img.shields.io/github/downloads/stylemessiah/DisableGoogleAnalytics/latest/total?label=Downloads%20%28Latest%20Release%29&style=plastic)
![GitHub All Releases](https://img.shields.io/github/downloads/stylemessiah/DisableGoogleAnalytics/total?label=Total%20Downloads%20%28All%20Releases%29&style=plastic)


