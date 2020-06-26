note
	description: "Abstract notion of a Data Access Field"
	design: "[
		Represents a field from either a table or SQL result
		cursor. The items of interest for a field are:
		
		Field ::=
			Name				-- What is the fields name?
			SQLite_data_type	-- What is the SQLite3 Data Type?
			Data_type			-- What is the Eiffel Data Type? (type anchor)
			Is_primary_key		-- Is this field a Primary Key?
			Is_auto_increment	-- As a PK field, does this key auto-increment?
			Is_sorted			-- Is this feild sorted (ASC/DESC)?
			Is_ascending		-- If Is_sorted, is it in ASC order?
		]"

deferred class
	DA_FIELD [S -> detachable SQLITE_BIND_ARG [ANY] create make end, D -> detachable ANY]

feature -- Access

	parent_table: detachable STRING
			-- Attached if has `parent_table'.
			-- Redefine or Set.

	fk_name: detachable STRING
			-- Attached if has `parent_table'.
			-- Redefine or Set.

	has_parent,
	is_child: BOOLEAN
			-- Is current a child with parent?
		do
			Result := attached parent_table and then
						attached fk_name
		end

	table_name: STRING
		deferred
		end

	name: STRING
		deferred
		end

	sqlite_bind_arg: detachable S
			-- Value Type anchor for SQLite3 Data Type.
			-- Controlled by Generic Parameter.

	value: detachable D
			-- Value Type anchor for Eiffel Data Type.
			-- Controlled by Generic Parameter.

	is_primary_key: BOOLEAN
		deferred
		end

	is_auto_increment: BOOLEAN
		deferred
		end

	is_sorted: BOOLEAN
		deferred
		end

	is_ascending: BOOLEAN
		deferred
		end

feature -- Settings

	set_parent_table (a_name: attached like parent_table)
			-- Set the `parent_table'.
		do
			parent_table := a_name
		ensure
			set: attached parent_table as al_name implies al_name.same_string (a_name)
		end

	set_fk_name (a_name: attached like fk_name)
			-- Set the `fk_name'.
		do
			fk_name := a_name
		ensure
			set: attached fk_name as al_name implies al_name.same_string (a_name)
		end

feature -- Basic Operations

	sqlite_to_eiffel (a_value: like {S}.value): D
			-- Convert `sqlite_to_eiffel'.
		deferred
		end

	eiffel_to_sqlite (a_value: like value): like {S}.value
			-- Convert `eiffel_to_sqlite'.
		deferred
		end

end
