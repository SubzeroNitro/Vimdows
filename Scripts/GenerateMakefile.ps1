$Action = $args[0]
$Configuration = $args[1]
$Platform = $args[2]

$ImageName = "vimdows-buildenv"
$ContainerName = "vimdows-build"

$RootDir = [IO.Path]::GetFullPath("..\")
$TargetDir = "/root/host/"
$DockerfilePath = "${RootDir}/Buildenv"

docker image prune --force
docker build $DockerfilePath -t $ImageName

docker run `
    -it `
    --rm `
	--name=$ContainerName `
	--mount type=bind,source=$RootDir,target=$TargetDir `
	$ImageName `
	sh -c `
    "premake5 gmake2 && make config=${Configuration}_${Platform} cc=x86_64-w64-mingw32-gcc cxx=x86_64-w64-mingw32-g++ $Action"