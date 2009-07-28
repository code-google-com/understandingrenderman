createNode nurbsSurface -n "revolvedSurfaceShape1" 
                        -p "revolvedSurface1";
addAttr -ci true -sn "sss"
 -ln "slimSurf"
 -bt "UNKN"
 -dt "stringArray";
setAttr -k off ".v";
setAttr ".fbd" no;
setAttr ".sss" -type "stringArray" 1 "0ZQ0MmpFLGE00000";
