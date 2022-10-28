#!/usr/bin/env bash

sudo gcloud config configurations create emulator
sudo gcloud config set auth/disable_credentials true
sudo gcloud config set project coronavirus-272213
sudo gcloud config set api_endpoint_overrides/spanner http://spanner:9020/

sudo gcloud spanner instances create spanner-emulator --config=emulator-config --description="Emulated" --nodes=1
sudo gcloud spanner databases create time_slots --instance=spanner-emulator --ddl-file=time-slots.ddl
