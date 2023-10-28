$ImageName = "vimdows-buildenv"
$ContainerName = "Vimdows-Build"

$RootDir = [IO.Path]::GetFullPath("..\")
$TargetDir = "/dev/buildenv"
$DockerfilePath = $RootDir + "Buildenv"

$Images = docker images $ImageName

if ($Images.Count -le 1)
{
    docker build $DockerfilePath -t $ImageName
}

docker run -it --rm --name=$ContainerName --mount type=bind,source=$RootDir,target=$TargetDir $ImageName

pause