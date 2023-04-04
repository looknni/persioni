#!/bin/bash
zase=({a..z} {A..Z} {0..9} '/' '#')
for nm in ${zase[@]} ;do
echo -n "$nm "
echo $nm |md5sum|base32
echo $nm |md5sum|base64
echo $nm |md5sum|base32|base64
echo $nm |md5sum|base64|base32
done
