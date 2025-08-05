#!/bin/bash
#
# Copyright 2021-2025 Software Radio Systems Limited
#
# This file is part of srsRAN
#
# srsRAN is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# srsRAN is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# A copy of the GNU Affero General Public License can be found in
# the LICENSE file in the top-level directory of this distribution
# and at http://www.gnu.org/licenses/.
#

#
# This script attempts to automate some typical troubleshooting
# when using machines with lower processing power.
#
# It does the following:
# 1. Set the scaling governor to performance
# 2. Disable DRM KMS polling
# 3. Tune network buffers (Ethernet based USRPs only).
#

set -o errexit
set -o nounset
set -o pipefail

#
# Set the scaling governor to performance.
# See: https://docs.kernel.org/admin-guide/pm/cpufreq.html#generic-scaling-governors
#

###
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null
echo "Scaling governor set to performance"

echo N | sudo tee /sys/module/drm_kms_helper/parameters/poll >/dev/null
echo "Disabled DRM KMS polling"

sudo sysctl -w net.core.wmem_max=33554432
sudo sysctl -w net.core.rmem_max=33554432
sudo sysctl -w net.core.wmem_default=33554432
sudo sysctl -w net.core.rmem_default=33554432
echo "Tweaked network buffer sizes"
###

#Check for sudo rights
sudo -v || exit