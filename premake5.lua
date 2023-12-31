include "mingw.lua"

majorVersion = 1
minorVersion = 0
patchVersion = 0

outputDir = "build/%{cfg.buildcfg}/%{cfg.platform}"

workspace "Vimdows"
	architecture "x86_64"

	configurations
	{
		"Debug",
		"Release"
	}
	
	platforms
	{
		"Windows"
	}
	
	filter "platforms:Windows"
		system "windows"
	
project "Vimdows"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
	staticruntime "On"
	systemversion "latest"
	characterset "Unicode"
	
	toolset "mingw"

	targetdir "%{outputDir}/%{prj.name}"
	objdir "%{outputDir}/obj/%{prj.name}"
	
	pchheader "%{prj.name}PCH.hpp"
	
	files
	{
		"Source/**.cpp",
		"Source/**.hpp"
	}
	
	includedirs
	{
		"Source"
	}
	
	defines
	{
		"APPLICATION_NAME=\"%{prj.name}\"",
		"APPLICATION_VERSION=\"%{majorVersion}.%{minorVersion}.%{patchVersion}\"",
		"APPLICATION_MAJOR_VERSION=%{majorVersion}",
		"APPLICATION_MINOR_VERSION=%{minorVersion}",
		"APPLICATION_PATCH_VERSION=%{patchVersion}"
	}
	
	filter "configurations:Debug"
		defines "VIMDOWS_DEBUG"
		
		runtime "Debug"
		symbols "On"
		optimize "Off"
		
	filter "configurations:Release"
		defines "VIMDOWS_RELEASE"
		
		runtime "Release"
		symbols "Off"
		optimize "Speed"
