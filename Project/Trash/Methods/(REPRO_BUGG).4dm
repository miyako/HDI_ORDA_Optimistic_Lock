//%attributes = {"invisible":true}

$pupil1:=ds:C1482.Pupil.get(3439)


$pupilToUpdate:=ds:C1482.Pupil.get(3439)
$pupilToUpdate.firstName:="MARY"
$pupilToUpdate.lastName:="SMITH"
$pupilToUpdate.email:=$pupilToUpdate.lastName+"@NEWEMAIL.COM"

$status:=$pupilToUpdate.save()  // This update causes the stamp to change

$pupil1.lastName:=$pupil1.lastName+"test"
$status:=$pupil1.save(dk auto merge:K85:24)

//$pupil1.reload()
//$pupil1.save()


$pupil1:=ds:C1482.Pupil.get(3439)
$pupil1.lastName:=$pupil1.lastName+"test"
$status:=$pupil1.save(dk auto merge:K85:24)