-- Copyright 2010 Andreas Fredriksson
--
-- This file is part of Tundra.
--
-- Tundra is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- Tundra is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Tundra.  If not, see <http://www.gnu.org/licenses/>.

local env = ...

-- load the generic GCC toolset first
load_toolset("gcc", env)

env:set_many {
	["NATIVE_SUFFIXES"] = { ".c", ".cpp", ".cc", ".cxx", ".m", ".a", ".o" },
	["FRAMEWORKS"] = "",
	["SHLIBOPTS"] = "-shared",
	["_OS_CCOPTS"] = "$(FRAMEWORKS:p-F)",
	["SHLIBCOM"] = "$(LD) $(SHLIBOPTS) $(LIBPATH:p-L) $(LIBS:p-l) $(FRAMEWORKS:p-framework ) -o $(@) $(<)",
	["PROGCOM"] = "$(LD) $(PROGOPTS) $(LIBS:p-l)  $(FRAMEWORKS:p-framework ) -o $(@) $(<)",
	["OBJCCOM"] = "$(CCCOM)", -- objc uses same commandline
}
