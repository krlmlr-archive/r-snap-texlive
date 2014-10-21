#!/usr/bin/env python

import os, sys

# Run this in the root directory containing afm files and a texmf branch
# Before running, all encoding files a_* should be renamed to xch_*
# and the corresponding changes applied to xcharter.map
encfiles=set()
enclst=[]
newlines=[]
afmcmds=[]
vflst=[]
with open("texmf/fonts/map/dvips/xcharter/XCharter.map",'r') as f:
	for line in f:
		if "-tosf-" in line:
			tmp = line.split()
			enc=tmp[4][2:]
			if (enc[-4:]==".enc") and (enc[:4]=="xch_"):
				enc=enc[:3]+"1"+enc[3:]
				enclst.append(enc)
				tmp[0]="XCharter1"+tmp[0][8:]
				tmp[2]=tmp[2][:8]+"1"+tmp[2][8:] # encoding name
				tmp[4]="<["+enc # encoding file, prefixed by <[
				newlines.append(' '.join(tmp))
				h=tmp[5][1:-4] # psfile, without .pfb or <
				a=tmp[0][:-6] # name of vf
				vflst.append(a)
				s="/usr/texbin/afm2tfm "+h+" -T texmf/fonts/enc/dvips/xcharter/"+enc+" -v "+a+" "+tmp[0]
				afmcmds.append(s)
			
#print newlines
encfiles=set(enclst)
#print sorted(encfiles)
#sys.exit()
for f in sorted(encfiles):
	f0=f[:3]+f[4:] # remove "1"
	os.system("/bin/cp -fp texmf/fonts/enc/dvips/xcharter/"+f0+" texmf/fonts/enc/dvips/xcharter/"+f)
	with open("texmf/fonts/enc/dvips/xcharter/"+f,'r') as g:
		tmp = g.read()
		tmp=tmp.replace("AutoEnc","AutoEnc1")
		tmp=tmp.replace("one.oldstyle","one.Alt.oldstyle")
	with open("texmf/fonts/enc/dvips/xcharter/"+f,'w') as g:
		g.write(tmp)

#Finally, write the afmcmds and update mapfile
for j in range(len(vflst)):
	a=vflst[j]
	s=afmcmds[j]
	print s
	if os.system(s)==0:
		if os.system("/usr/texbin/vptovf "+a)==0:
			os.system("/bin/mv -f "+a+".tfm texmf/fonts/tfm/public/xcharter")
			os.system("/bin/mv -f "+a+"--base.tfm texmf/fonts/tfm/public/xcharter")
			os.system("/bin/mv -f "+a+".vf texmf/fonts/vf/public/xcharter")
		
with open("texmf/fonts/map/dvips/xcharter/XCharter.map",'a+') as f:
	for s in newlines:
		f.write(s+'\n')