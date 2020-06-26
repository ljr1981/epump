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
			
			Where_not			-- NOT <expr>
			Where_equal			-- <expr> = "[Field_name] = [Value]"
			Where_lt			-- <expr> = "[Field_name] < [Value]"
			Where_lte			-- <expr> = "[Field_name] <= [Value]"
			Where_gt			-- <expr> = "[Field_name] > [Value]"
			Where_gte			-- <expr> = "[Field_name] >= [Value]"
			Where_is_not		-- <expr> = "[Field_name] IS NOT [Value]"
			Where_like			-- <expr> = "[Field_name] LIKE [Value]" (e.g. 'Ki%')
			Where_glob			-- <expr> = "[Field_name] GLOB [Value]" (e.g. 'Ki*')
			Where_in			-- <expr> = "[Field_name]IN ([CSV_value_list])"
			Where_between		-- <expr> = "[Field_name] BETWEEN [Value_lower] AND [Value_upper]"
			Where_exists		-- <expr> = "EXISTS ([Sub_select_on_field_name])" (e.g. (SELECT AGE FROM COMPANY WHERE SALARY > 65000))
		]"
	EIS: "name=where", "src=https://www.tutorialspoint.com/sqlite/sqlite_where_clause.htm"

deferred class
	DA_FIELD [S -> detachable SQLITE_BIND_ARG [ANY] create make end, D -> detachable ANY]

feature -- Access

	parent_pk_field: detachable DA_INTEGER_PK_FIELD
			-- What is the parent, if any?

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

	sqlite_bind_arg_value_anchor: detachable like {S}.value
			-- SQLite3 bind arg value type anchor.

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

feature -- Status Report

	has_parent,
	is_child: BOOLEAN
			-- Is current a child with parent?
		do
			Result := attached parent_pk_field
		end

	parent_pk_table: detachable STRING
			-- What is the table name of the parent, if any?
		do
			if attached parent_pk_field as al_fld then
				Result := al_fld.table_name
			end
		end

	parent_pk_field_name: detachable STRING
			-- What is the field name of the primary key in the parent, if any?
		do
			if attached parent_pk_field as al_fld then
				Result := al_fld.name
			end
		end

feature -- Settings

	set_parent_pk_field (a_fld: attached like parent_pk_field)
			-- Set the `parent_pk_field'.
		do
			parent_pk_field := a_fld
		ensure
			set: attached parent_pk_field as al_fld implies al_fld ~ a_fld
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

feature -- Output

	value_out: STRING
			-- Output of `value' in `sqlite_bind_arg'.
		deferred
		end

	formatted_value_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			-- Formatted output of `a_value'.
		deferred
		end

	where_expressions: ARRAYED_LIST [TUPLE [t_expr: STRING; t_conjunction: detachable STRING]]
			-- A list of WHERE <expr> items.
		attribute
			create Result.make (10)
		end

	add_expression (a_expr: STRING; a_conjunction: detachable STRING)
			-- Add `a_expr' to `where_expressions'
		require
			unique_expr: not where_expressions.has ([a_expr, a_conjunction])
			valid_conjunction: attached a_conjunction as al_conjunction implies
				(<<"AND", "OR">>).has (al_conjunction)
		do
			where_expressions.force ([a_expr, a_conjunction])
		ensure
			added: where_expressions.has ([a_expr, a_conjunction])
		end

feature -- WHERE

	is_where_not: BOOLEAN
	toggle_where_not do is_where_not := not is_where_not end
			--Where_not			-- NOT <expr>

	is_where_equal: BOOLEAN
	toggle_where_equal do is_where_equal := not is_where_equal end
	where_equal_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_equal			-- <expr> = "[Field_name] = [Value]"
		do
			create Result.make_empty
			if is_where_equal then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" = ")
				Result.append_string_general (formatted_value_out (a_value))
			end
		end

	is_where_lt: BOOLEAN
	toggle_where_lt do is_where_lt := not is_where_lt end
	where_lt_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_lt			-- <expr> = "[Field_name] < [Value]"
		do
			create Result.make_empty
			if is_where_lt then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" < ")
				Result.append_string_general (formatted_value_out (a_value))
			end
		end

	is_where_lte: BOOLEAN
	toggle_where_lte do is_where_lte := not is_where_lte end
	where_lte_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_lte			-- <expr> = "[Field_name] <= [Value]"
		do
			create Result.make_empty
			if is_where_lte then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" <= ")
				Result.append_string_general (formatted_value_out (a_value))
			end
		end

	is_where_gt: BOOLEAN
	toggle_where_gt do is_where_gt := not is_where_gt end
	where_gt_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_gt			-- <expr> = "[Field_name] > [Value]"
		do
			create Result.make_empty
			if is_where_gt then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" > ")
				Result.append_string_general (formatted_value_out (a_value))
			end
		end

	is_where_gte: BOOLEAN
	toggle_where_gte do is_where_gte := not is_where_gte end
	where_gte_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_gte			-- <expr> = "[Field_name] >= [Value]"
		do
			create Result.make_empty
			if is_where_gte then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" >= ")
				Result.append_string_general (formatted_value_out (a_value))
			end
		end

	is_where_is_not: BOOLEAN
	toggle_where_is_not do is_where_is_not := not is_where_is_not end
	where_is_not_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_is_not		-- <expr> = "[Field_name] IS NOT [Value]"
		do
			create Result.make_empty
			if is_where_is_not then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" IS NOT ")
				Result.append_string_general (formatted_value_out (a_value))
			end
		end

	is_where_starts_like: BOOLEAN
	toggle_where_starts_like
		do is_where_starts_like := not is_where_starts_like end

	is_where_ends_like: BOOLEAN
	toggle_where_ends_like
		do is_where_ends_like := not is_where_ends_like end

	where_like_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_like			-- <expr> = "[Field_name] LIKE [Value]" (e.g. 'Ki%')
		do
			create Result.make_empty
			if (is_where_starts_like xor is_where_ends_like) then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" LIKE ")
				if is_where_starts_like then
					Result.append_string_general (formatted_value_out (a_value) + "%%")
				elseif is_where_ends_like then
					Result.append_string_general ("%%" + formatted_value_out (a_value))
				else -- has-like ...
					Result.append_string_general ("%%" + formatted_value_out (a_value) + "%%")
				end
			end
		end

	where_glob_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--Where_glob			-- <expr> = "[Field_name] GLOB [Value]" (e.g. 'Ki*')
		do
			create Result.make_empty
			if (is_where_starts_like xor is_where_ends_like) then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" LIKE ")
				if is_where_starts_like then
					Result.append_string_general (formatted_value_out (a_value) + "*")
				elseif is_where_ends_like then
					Result.append_string_general ("*" + formatted_value_out (a_value))
				else -- has-like ...
					Result.append_string_general ("*" + formatted_value_out (a_value) + "*")
				end
			end
		end

	is_where_in: BOOLEAN
	toggle_where_in do is_where_in := not is_where_in end
	where_in_out (a_value_list: ARRAY [attached like sqlite_bind_arg_value_anchor]): STRING
			--Where_in			-- <expr> = "[Field_name]IN ([CSV_value_list])"
		do
			create Result.make_empty
			if is_where_in then
				if is_where_not then
					Result.append_string_general (" NOT ")
				end
				Result.append_string_general (name)
				Result.append_string_general (" IN (")
				across
					a_value_list as ic
				loop
					Result.append_string_general (formatted_value_out (ic.item))
					if ic.cursor_index < a_value_list.count then
						Result.append_character (',')
					end
				end
				Result.append_character (')')
			end
		end

	add_where_between (a_lb, a_nb: attached like sqlite_bind_arg_value_anchor; a_conjunction: detachable STRING)
			--Where_between		-- <expr> = "[Field_name] BETWEEN [Value_lower] AND [Value_upper]"
		local
			l_expr,
			l_conjunction: STRING
		do
			create l_expr.make_empty
			if is_where_not then
				l_expr.append_string_general (" NOT ")
			end
			l_expr.append_string_general (name)
			l_expr.append_string_general (" BETWEEN ")
			l_expr.append_string_general (formatted_value_out (a_lb))
			l_expr.append_string_general (" AND ")
			l_expr.append_string_general (formatted_value_out (a_nb))
			if attached a_conjunction then
				add_expression (l_expr, a_conjunction)
			else
				add_expression (l_expr, Void)
			end
		end

			--Where_exists		-- <expr> = "EXISTS ([Sub_select_on_field_name])" (e.g. (SELECT AGE FROM COMPANY WHERE SALARY > 65000))

end
