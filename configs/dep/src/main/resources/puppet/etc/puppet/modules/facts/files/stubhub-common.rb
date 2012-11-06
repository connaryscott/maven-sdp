# common host facts

Facter.add("sh_system_role") do
	setcode do
		%x{/bin/hostname -s | cut -c 7-9}.chomp
	end
end

Facter.add("sh_location") do
	setcode do
		%x{/bin/hostname -s | cut -c 1-3}.chomp
	end
end

Facter.add("sh_envloc") do
	setcode do
		%x{/bin/hostname -s | cut -c 1-4}.chomp
	end
end

Facter.add("sh_envlocupper") do
	setcode do
		%x{/bin/hostname -s | cut -c 1-4 | tr [:lower:] [:upper:]}.chomp
	end
end

Facter.add("sh_envtype") do
	setcode do
		%x{/bin/hostname -s | cut -c 4}.chomp
	end
end

Facter.add("sh_envtypeupper") do
	setcode do
		%x{/bin/hostname -s | cut -c 4 | tr [:lower:] [:upper:]}.chomp
	end
end

Facter.add("sh_envnum") do
	setcode do
		%x{/bin/hostname -s | cut -c 5-6}.chomp
	end
end

Facter.add("sh_envnumblock") do
	setcode do
		%x{/bin/hostname -s | cut -c 5| awk '{print $1"0"}'}.chomp
	end
end

Facter.add("sh_rolenum") do
	setcode do
		%x{/bin/hostname -s | cut -c 10-12}.chomp
	end
end

Facter.add("sh_a_b") do
	setcode do
		begin
		n = Facter.fact(:sh_rolenum).value.to_i
		ref = ( n % 2 ) 
			if  ref != 0 
				"a"
			else 
				"b"
			end
		end
	end
end

