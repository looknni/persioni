> ## $\color{#FF00FF}{ EXPIRED }$ 
>> - gpg --generate-revocation keyid
>> - gpg --edit-key keyid , expire , trust , save
>> - git config --global commit.gpgSign true
>> - git config --global user.signingKey keyid
>> - gpg --armor --output filepublic --export keyid #
>> - gpg --armor --output fileprivate --export-secret-keys #
>> - gpg --local-user privatekeyid --recipient userkeyid --armor --sign --encrypt fileprivate #generate fileprivate.asc
>> - gpg --verify fileprivate.asc fileprivate
---
