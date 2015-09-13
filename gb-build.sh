#!/bin/bash
#
# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install Docker
curl -sSL https://get.docker.com/ | sh

# Clone Guestbook
git clone https://github.com/GoogleCloudPlatformTraining/cpo200-guestbook

# Retrieve the project ID
PROJECT_ID=$(curl -s 'http://metadata/computeMetadata/v1/project/project-id' -H 'Metadata-Flavor: Google')

# Retrieve the Container Registry Prefix
GCR_PREFIX=$(curl -s 'http://metadata/computeMetadata/v1/instance/attributes/prefix' -H 'Metadata-Flavor: Google')

# Build the container with the expected tag
docker build -t $GCR_PREFIX/$PROJECT_ID/guestbook  cpo200-guestbook

# Shutdown the instance
shutdown -h now
