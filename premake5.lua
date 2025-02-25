--Change these values
workspacename = "BasicTemplate"
projectname = "BasicTemplate"

--TODO: Add functionality to auto-rename the current folder to the workspacename?

--For use with the first execution of GenerateProjects.bat
os.rename("BasicTemplate", projectname)

workspace (workspacename)
	architecture "x86"
	configurations { "Debug", "Release"}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"	
	
project (projectname)
	location (projectname)
	kind "ConsoleApp"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		
	}
	
	libdirs {  }
	
	links {  }
	
	cppdialect "C++20"
	staticruntime "Off"
	systemversion "latest"
	
	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"