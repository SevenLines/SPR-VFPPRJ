Local q, k
Local lcfilt, lckontfilt 

lckontfilt  = "SELECT kk.id_1 "+;
	"FROM kontkurs kk "+;
		"LEFT JOIN vacfil vfil ON kk.fil = vfil.id_4 "+;
		"LEFT JOIN vacfac vfac ON kk.fac = vfac.id_5 "+;
		"LEFT JOIN vacaobozn vao ON kk.aobozn = vao.id_6 "+;
		"LEFT JOIN vacaobozn vao1 ON kk.groupkey = vao1.id_6 "+;
		"LEFT JOIN shup ON kk.shup = shup.id_14 "+;
		"LEFT JOIN spclntion stion ON kk.spclntion = stion.id_25 "+;
		"LEFT JOIN vacfobuch vfob ON shup.afobuch = vfob.id_3"

use pgrabgr in 0
use pgrabgrsps in 0
lcfilt = genkontfilt('pgrabgr', 'pgrabgrsps')
select pgrabgr
use
select pgrabgrsps
use

if !empty(lcfilt)
 lckontfilt = lckontfilt + " WHERE " + lcfilt
endif

q = "SELECT rg.kont, rg.kontid, rg.vr, rg.dbeg, rg.days, kk.kurs, kk.stud, vao.aobozn "+;
 "FROM rabgraph rg "+;
  "JOIN kontkurs kk ON kk.id_1 = rg.kont "+;
  "JOIN vacaobozn vao ON vao.id_6 = kk.aobozn "+;
 "WHERE rg.fobuch = 1 and rg.kont in (" + lckontfilt + ")"
k = sqlexec(lcn, q, 'rabgraph')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif

q = "SELECT rg.kont, rg.kontid, "+;
 "kk.kurs, kk.shup, shup.shifr, vfil.fil, isnull(kgr.obozn, kk.obozn) obozn, isnull(kgr.students, kk.stud) stud, "+;
 "(case when kgr.id_7 is NULL then kk.groups else 0 end) groups, "+;
 "(case when kgr.id_7 is NULL then kk.pgroups else 0 end) pgroups, "+;
 "max(dbo.GraphObozn(1, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n1, "+;
 "max(dbo.GraphObozn(2, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n2, "+;
 "max(dbo.GraphObozn(3, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n3, "+;
 "max(dbo.GraphObozn(4, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n4, "+;
 "max(dbo.GraphObozn(5, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n5, "+;
 "max(dbo.GraphObozn(6, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n6, "+;
 "max(dbo.GraphObozn(7, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n7, "+;
 "max(dbo.GraphObozn(8, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n8, "+;
 "max(dbo.GraphObozn(9, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n9, "+;
 "max(dbo.GraphObozn(10, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n10, "+;
 ""+;
 "max(dbo.GraphObozn(11, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n11, "+;
 "max(dbo.GraphObozn(12, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n12, "+;
 "max(dbo.GraphObozn(13, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n13, "+;
 "max(dbo.GraphObozn(14, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n14, "+;
 "max(dbo.GraphObozn(15, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n15, "+;
 "max(dbo.GraphObozn(16, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n16, "+;
 "max(dbo.GraphObozn(17, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n17, "+;
 "max(dbo.GraphObozn(18, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n18, "+;
 "max(dbo.GraphObozn(19, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n19, "+;
 "max(dbo.GraphObozn(20, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n20, "+;
 ""+;
 "max(dbo.GraphObozn(21, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n21, "+;
 "max(dbo.GraphObozn(22, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n22, "+;
 "max(dbo.GraphObozn(23, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n23, "+;
 "max(dbo.GraphObozn(24, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n24, "+;
 "max(dbo.GraphObozn(25, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n25, "+;
 "max(dbo.GraphObozn(26, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n26, "+;
 "max(dbo.GraphObozn(27, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n27, "+;
 "max(dbo.GraphObozn(28, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n28, "+;
 "max(dbo.GraphObozn(29, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n29, "+;
 "max(dbo.GraphObozn(30, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n30, "+;
 ""+;
 "max(dbo.GraphObozn(31, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n31, "+;
 "max(dbo.GraphObozn(32, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n32, "+;
 "max(dbo.GraphObozn(33, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n33, "+;
 "max(dbo.GraphObozn(34, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n34, "+;
 "max(dbo.GraphObozn(35, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n35, "+;
 "max(dbo.GraphObozn(36, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n36, "+;
 "max(dbo.GraphObozn(37, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n37, "+;
 "max(dbo.GraphObozn(38, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n38, "+;
 "max(dbo.GraphObozn(39, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n39, "+;
 "max(dbo.GraphObozn(40, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n40, "+;
 ""+;
 "max(dbo.GraphObozn(41, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n41, "+;
 "max(dbo.GraphObozn(42, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n42, "+;
 "max(dbo.GraphObozn(43, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n43, "+;
 "max(dbo.GraphObozn(44, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n44, "+;
 "max(dbo.GraphObozn(45, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n45, "+;
 "max(dbo.GraphObozn(46, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n46, "+;
 "max(dbo.GraphObozn(47, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n47, "+;
 "max(dbo.GraphObozn(48, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n48, "+;
 "max(dbo.GraphObozn(49, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n49, "+;
 "max(dbo.GraphObozn(50, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n50, "+;
 ""+;
 "max(dbo.GraphObozn(51, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n51, "+;
 "max(dbo.GraphObozn(52, rg.dbeg, rg.days, v.obozn, v.pobozn, vprev.pobozn, vnext.pobozn)) n52 "+;
"FROM rabgraph rg "+;
 "LEFT JOIN vacgrvrd v ON rg.vr = v.id_grvr "+;
 "LEFT JOIN rabgraph rgprev ON rg.kont = rgprev.kont "+;
				"and rg.kontid = rgprev.kontid "+;
				"and rg.dbeg = rgprev.dbeg + rgprev.days "+;
 "LEFT JOIN vacgrvrd vprev ON rgprev.vr = vprev.id_grvr "+;
 "LEFT JOIN rabgraph rgnext ON rg.kont = rgnext.kont "+;
				"and rg.kontid = rgnext.kontid "+;
				"and rg.dbeg+rg.days = rgnext.dbeg "+;
 "LEFT JOIN vacgrvrd vnext ON rgnext.vr = vnext.id_grvr "+;
""+;
 "LEFT JOIN kontkurs kk ON rg.kont = kk.id_1 "+;
 "LEFT JOIN shup ON shup.id_14 = kk.shup "+;
 "LEFT JOIN vacfil vfil ON vfil.id_4 = kk.fil "+;
 "LEFT JOIN kontgrp kgr ON rg.kontid = kgr.id_7 "+;
"WHERE shup.fobuch = 1  "+;
	"and kk.id_1 in(" + lckontfilt + ") "+;
"GROUP BY rg.kont, rg.kontid, "+;
 	"kk.kurs, kk.shup, shup.shifr, kk.fil, vfil.fil, isnull(kgr.obozn, kk.obozn), isnull(kgr.students, kk.stud), "+;
	"(case when kgr.id_7 is NULL then kk.groups else 0 end), "+;
	"(case when kgr.id_7 is NULL then kk.pgroups else 0 end) "+;
"ORDER BY kk.fil, kk.kurs, kk.obozn "


k = sqlexec(lcn, q, 'rabgrdbr')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 select rabgraph
 use
 return .F.
endif