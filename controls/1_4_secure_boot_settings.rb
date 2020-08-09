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

title '1.4 Secure Boot Settings'

control 'cis-dil-benchmark-1.4.1' do
  title 'Ensure permissions on bootloader config are configured'
  desc  "The grub configuration file contains information on boot settings and passwords for unlocking boot options. The grub configuration is usually grub.cfg stored in /boot/grub.\n\nRationale: Setting the permissions to read and write for root only prevents non-root users from seeing the boot parameters or changing them. Non-root users who read the boot parameters may be able to identify weaknesses in security upon boot and be able to exploit them."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.4.1'
  tag level: 1

  describe.one do
    grub_conf.locations.each do |f|
      describe file(f) do
        it { should exist }
        it { should_not be_readable.by 'group' }
        it { should_not be_writable.by 'group' }
        it { should_not be_executable.by 'group' }
        it { should_not be_readable.by 'other' }
        it { should_not be_writable.by 'other' }
        it { should_not be_executable.by 'other' }
        its(:gid) { should cmp 0 }
        its(:uid) { should cmp 0 }
      end
    end
  end
end




control 'cis-dil-benchmark-1.4.4' do
  title 'Ensure interactive boot is not enabled'
  desc  "Interactive boot allows console users to interactively select which services start on boot. Not all distributions support this capability.\nThe PROMPT_FOR_CONFIRM option provides console users the ability to interactively boot the system and select which services to start on boot .\n\nRationale: Turn off the PROMPT_FOR_CONFIRM option on the console to prevent console users from potentially overriding established security settings."
  impact 0.0

  tag cis: 'distribution-independent-linux:1.4.4'
  tag level: 1

  if file('/etc/sysconfig/boot').exist?
    describe file('/etc/sysconfig/boot') do
      its(:content) { should match(/^PROMPT_FOR_CONFIRM="no"$/) }
    end
  else
    describe 'cis-dil-benchmark-1.4.4' do
      skip 'Not implemented'
    end
  end
end
