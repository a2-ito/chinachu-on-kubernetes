#!/bin/bash

list_gr=(27 26 25 22 23 21 24 20 18)
list_bs=(
192 193
#101 103 141 151 161 171 181 191 192 193 200 201 202 211 222 231 232 233 234 236 238 241 242 243 244 245 251 256 258
#291 292 294 295 296 297 298
#531 910
)
list_cs=(
CS2,296
CS2,298
CS2,299
CS4,100
CS4,223
CS4,227
CS4,250
CS4,342
CS4,363
CS6,294
CS6,323
CS6,329
CS6,340
CS6,341
CS6,354
CS8,55
CS8,218
CS8,219
CS8,326
CS8,339
CS8,349
CS10,800
CS10,801
CS10,802
CS10,805
CS12,254
CS12,325
CS12,330
CS14,292
CS14,293
CS14,310
CS16,290
CS16,305
CS16,311
CS16,333
CS16,343
CS16,353
CS18,240
CS18,262
CS18,314
CS20,307
CS20,308
CS20,309
CS22,161
CS22,297
CS22,312
CS22,322
CS22,331
CS22,351
CS24,229
CS24,257
CS24,300
CS24,321
CS24,362
)

for _item in ${list_gr[@]};
do
  echo ${_item}
  recpt1 --b25 --strip ${_item} 10 /tmp/test_${_item}.ts
  mv /tmp/test_${_item}.ts /sharedisk/tmp/
done

for _item in ${list_bs[@]}; do
  echo ${_item}
  recpt1 --b25 --strip ${_item} 10 /tmp/test_${_item}.ts
  mv /tmp/test_${_item}.ts /sharedisk/tmp/
done

#for _item in ${list_cs[@]}; do
#  echo ${_item}
#  _channel=`echo ${_item} | cut -d',' -f1`;  _sid=`echo ${_item} | cut -d',' -f2`
#  recpt1 --b25 --strip ${_channel} --sid ${_sid} 10 /tmp/test_${_channel}_${_sid}.ts
#  mv /tmp/test_${_channel}_${_sid}.ts /mnt/sharerdvol/tmp/
#done
