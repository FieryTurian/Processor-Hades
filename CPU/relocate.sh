#! /bin/sh
for i in *.hds ; do
	sed '/^hades.models.Design \(.*\) \/hades\/models\/[^ ]*\/\([^ /]*\)\.hds/ !s/^hades.models.Design \(.*\) [^ ]*\/\([^ /]*\)\.hds/hades.models.Design \1 .\/\2.hds/' < "$i" > "$i.tmp"
	if diff -q "$i" "$i.tmp" > /dev/null ; then rm "$i.tmp" ; else mv "$i" "$i.bak" ; mv "$i.tmp" "$i" ; echo Adapted $i ; fi
done
