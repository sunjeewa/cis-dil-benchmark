#
# Copyright 2017, Schuberg Philis B.V.
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
# author: Kristian Vlaardingerbroek

cis_level = attribute('cis_level')

title '1.1 Filesystem Configuration'

control 'cis-dil-benchmark-1.1.1.1' do
  title 'Ensure mounting of cramfs filesystems is disabled'
  desc  "The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems. A cramfs image can be used without having to first decompress the image.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the server. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.1'
  tag level: 1

  describe kernel_module('cramfs') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.2' do
  title 'Ensure mounting of freevxfs filesystems is disabled'
  desc  "The freevxfs filesystem type is a free version of the Veritas type filesystem. This is the primary filesystem type for HP-UX operating systems.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.2'
  tag level: 1

  describe kernel_module('freevxfs') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.3' do
  title 'Ensure mounting of jffs2 filesystems is disabled'
  desc  "The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.3'
  tag level: 1

  describe kernel_module('jffs2') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.4' do
  title 'Ensure mounting of hfs filesystems is disabled'
  desc  "The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.4'
  tag level: 1

  describe kernel_module('hfs') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.5' do
  title 'Ensure mounting of hfsplus filesystems is disabled'
  desc  "The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows you to mount Mac OS filesystems.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.5'
  tag level: 1

  describe kernel_module('hfsplus') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.6' do
  title 'Ensure mounting of squashfs filesystems is disabled'
  desc  "The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs). A squashfs image can be used without having to first decompress the image.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.6'
  tag level: 1

  describe kernel_module('squashfs') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.7' do
  title 'Ensure mounting of udf filesystems is disabled'
  desc  "The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications. This is an open vendor filesystem type for data storage on a broad range of media. This filesystem type is necessary to support writing DVDs and newer optical disc formats.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.7'
  tag level: 1

  describe kernel_module('udf') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'cis-dil-benchmark-1.1.1.8' do
  title 'Ensure mounting of FAT filesystems is disabled'
  desc  "The FAT filesystem format is primarily used on older windows systems and portable USB drives or flash modules. It comes in three types FAT12, FAT16, and FAT32 all of which are supported by the vfat kernel module.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.8'
  tag level: 1

  describe kernel_module('vfat') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end


