$ImageName = "vimdows-buildenv"
$DockerfilePath = "../buildenv"

$images = docker images
$buildImage = true

for ($i = 1; $i -le $images.Count; $i++)
{
    $imageName = ($images[$i] -split " ")[0]

    if ($imageName -eq $ImageName)
    {
        $buildImage = false
        break
    }
}

if ($buildImage)
{
    docker build $DockerfilePath -t $ImageName
}

docker run -it --rm --name=Vimdows --mount type=bind, source=${PWD}, target=/Source vimdows_buildenv