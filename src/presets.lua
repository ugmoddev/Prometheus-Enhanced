-- This Script is Part of the Prometheus Obfuscator by levno-710
--
-- presets.lua
--
-- This Script provides the predefined obfuscation presets for Prometheus

return {
	-- Minifies your code. Does not obfuscate it. No performance loss.
	["Minify"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {},
	},

	-- Weak obfuscation. Very readable, low performance loss.
	["Weak"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true
				},
			},
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- This is here for the tests.lua file.
	-- It helps isolate any problems with the Vmify step.
	-- It is not recommended to use this preset for obfuscation.
	-- Use the Weak, Medium, or Strong for obfuscation instead.
	["Vmify"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "Vmify", Settings = {} },
		},
	},

	-- Medium obfuscation. Moderate obfuscation, moderate performance loss.
	["Medium"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "AntiTamper",
				Settings = {
					UseDebug = false,
				},
			},
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					LocalWrapperThreshold = 0,
				},
			},
			{ Name = "NumbersToExpressions", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- Strong obfuscation, high performance loss.
	["Strong"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "Vmify", Settings = {} },
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "AntiTamper",
				Settings = {
					UseDebug = false,
				},
			},
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					LocalWrapperThreshold = 0
				},
			},
			{
				Name = "NumbersToExpressions",
				Settings = {
					NumberRepresentationMutation = true
				},
			},
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- Extreme obfuscation. Maximum built-in protection and highest runtime overhead.
	["Extreme"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "SplitStrings",
				Settings = {
					Threshold = 1,
					MinLength = 3,
					MaxLength = 7,
					ConcatenationType = "custom",
					CustomFunctionType = "local",
					CustomLocalFunctionsCount = 2,
				},
			},
			{ Name = "AntiTamper", Settings = { UseDebug = false } },
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					Encoding = "mixed",
					LocalWrapperThreshold = 0,
				},
			},
			{ Name = "NumbersToExpressions", Settings = { NumberRepresentationMutation = true } },
			{ Name = "AddVararg", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- LuaU profile for Roblox/Luau sources. Avoids Lua 5.1-only transforms.
	["LuaU"] = {
		LuaVersion = "LuaU",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{ Name = "SplitStrings", Settings = { Threshold = 1, MinLength = 3, MaxLength = 7, ConcatenationType = "strcat" } },
			{ Name = "ConstantArray", Settings = { Threshold = 1, StringsOnly = true, Shuffle = true, Rotate = true, Encoding = "mixed" } },
			{ Name = "NumbersToExpressions", Settings = { NumberRepresentationMutation = true } },
		},
	},

	-- Maximum stable profile. Strong transforms with additional indirection.
	["Maximum"] = {
		LuaVersion = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{ Name = "SplitStrings", Settings = { Threshold = 1, MinLength = 2, MaxLength = 5, ConcatenationType = "custom", CustomFunctionType = "inline" } },
			{ Name = "AntiTamper", Settings = { UseDebug = false } },
			{ Name = "Vmify", Settings = {} },
			{ Name = "ConstantArray", Settings = { Threshold = 1, StringsOnly = true, Shuffle = true, Rotate = true, Encoding = "mixed", LocalWrapperThreshold = 0 } },
			{ Name = "NumbersToExpressions", Settings = { NumberRepresentationMutation = true } },
			{ Name = "AddVararg", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},
}
