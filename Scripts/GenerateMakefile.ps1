$Action = $args[0]
$Configuration = $args[3]
$Platform = $args[4]

$ImageName = "vimdows-buildenv"
$ContainerName = "vimdows-build"

$RootDir = [IO.Path]::GetFullPath("..\")
$TargetDir = "/root/host/"
$DockerfilePath = "${RootDir}/Buildenv"

$BuildDir = "${RootDir}/Build/${Architecture}/${System}/${Configuration}/${Platform}" 

docker image prune --force
docker build $DockerfilePath -t $ImageName
docker run --rm \
	--name=$ContainerName \
	--mount type=bind,source=$RootDir,target=$TargetDir \
	$ImageName \
	-command premake5 gmake2

pause