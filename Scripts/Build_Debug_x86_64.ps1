$ImageName = "vimdows-buildenv"
$ContainerName = "Vimdows-Build"

$RootDir = [IO.Path]::GetFullPath("..\")
$TargetDir = "/root/host"
$DockerfilePath = $RootDir + "Buildenv"

docker image prune --force
docker build $DockerfilePath -t $ImageName
docker run -it --rm --name=$ContainerName --mount type=bind,source=$RootDir,target=$TargetDir $ImageName

pause