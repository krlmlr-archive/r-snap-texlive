README for tameflts.sty, 2004/04/21, 
Uwe Lueck http://contact-ednotes.sty.de.vu . 

The files address the problem that LaTeX floats and \marginpar 
may cause misplacement of footnotes or footnote splits. (The 
LaTeX code makes me also expect problems with \enlargethispage). 

tameflts.sty  provides 
              * a simple, experimental fix, maybe just as a 
                contribution to discussion and as a summary of 
                what other authors have contributed; 
              * many explanations -- so go on reading there. 

deml3541.tex  demonstrates the fix and adds a few explanations. 

newbug.tex    demonstrates a weakness of tameflts, or that such a 
              simple approach does not perfectly suffice, rather 
              LaTeX needs an essentially new mechanism for 
              handling floats indeed. 

fltfltdk.tex  varies deml3541.tex to test interaction with Mats 
              Dahlgren's package floatflt. 
 
(The package was called `noreins.sty' earlier, in folder 
`noreinserts'. Added infos on compatibility 2005/04/21.)
