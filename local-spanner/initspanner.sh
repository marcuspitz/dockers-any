#!/usr/bin/env bash

gcloud config configurations create emulator
gcloud config set auth/disable_credentials true
gcloud config set project coronavirus-272213
gcloud config set api_endpoint_overrides/spanner http://spanner:9020/

gcloud spanner instances create spanner-emulator --config=emulator-config --description="Emulated" --nodes=1
gcloud spanner databases create time_slots --instance=spanner-emulator --ddl-file=time-slots.ddl
