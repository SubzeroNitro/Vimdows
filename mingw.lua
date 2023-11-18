premake.tools.mingw = premake.tools.gcc

function premake.tools.mingw.gettoolname(cfg, tool)
    name = "x86_64-w64-mingw32-"

    if tool == "cc" then
	return name .. "gcc"
    elseif tool == "cxx" then
	return name .. "g++"
    else
	return nil
    end
end
