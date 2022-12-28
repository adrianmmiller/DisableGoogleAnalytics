#!/system/bin/sh
MODDIR=${0%/*}	

function wait_avg_cpu_usage() {
#wait 60 seconds
sleep 60
# set threshold as first argument passed to function
threshold=$1
while true; do
    # get 5 minute avg and format it as a whole number
    current=$(cat /proc/loadavg | cut -f 2 -d " " | xargs  printf "%.0f")
    echo $current
    if [ $current -lt $threshold ]; then
        break;
    else
        sleep 5
    fi
done
}

# wait till boot completed
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 120
done

# wait until avg cpu usage is less than 30%
wait_avg_cpu_usage 30

log_file="/storage/emulated/0/fixgoogleanalytics.log"

echo "" > "$log_file"

googleanalytics='com.google.android.gms.analytics.AnalyticsJobService '\
'com.google.android.gms.analytics.CampaignTrackingService '\
'com.google.android.gms.measurement.AppMeasurementService '\
'com.google.android.gms.measurement.AppMeasurementJobService '\
'com.google.android.gms.analytics.AnalyticsReceiver '\
'com.google.android.gms.analytics.CampaignTrackingReceiver '\
'com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver '\
'com.google.android.gms.measurement.AppMeasurementReceiver '\
'com.google.android.gms.measurement.AppMeasurementContentProvider '\
'com.crashlytics.android.CrashlyticsInitProvider '\
'com.google.android.gms.ads.AdActivity '\
'com.google.firebase.iid.FirebaseInstanceIdService'

echo "==========================================================" | tee -a $log_file
echo "Setting targetted google anayltics on applications to: disabled" | tee -a $log_file
echo ""
echo "Please wait as this will take some time to complete depending" | tee -a $log_file 
echo "on number of applications installed" | tee -a $log_file
echo ""
echo "$(pm list packages -3 | wc -l) packages installed" | tee -a $log_file
echo ""

packagecount=0
fixcount=0
failcount=0

# process list of applications
for apk in $(pm list packages -3 | sed 's/package://g' | sort); 
	do	
		# for every application, disable the list of google analytics above
		for i in $googleanalytics
			do 
				# run actual command, and output successful state change or output not found if service is not found in apk
				output=$(pm disable "$apk/$i" 2>&1) && { echo "$output" >> "$log_file" ; fixcount=$((fixcount+1)); } || { echo "Component {"$apk/$i"} NOT FOUND" >> "$log_file"; failcount=$((failcount+1)); }
		done		
done

echo '==========================================================' | tee -a "$log_file"
echo "Analytics And Ad Receivers disabled: $fixcount" | tee -a "$log_file"
echo "Analytics And Ad Receivers NOT disabled/found: $failcount" | tee -a "$log_file"
echo '==========================================================' | tee -a "$log_file"

sleep 5

# remove this script - we only want it to run once automatically
/bin/rm -f "${0}"
