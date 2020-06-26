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
	DA_FIELD [S -> detachable ANY, D -> detachable ANY]

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
		do
			if attached value as al_value then
				Result := eiffel_to_sqlite (al_value)
			end
		end

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

	set_value (a_value: attached like value)
			--
		do
			value := a_value
		end

	set_value_from_sqlite_value (a_value: attached like sqlite_bind_arg)
			-- Set `value' from `a_value', which is a SQLite3 value.
		do
			value := sqlite_to_eiffel (a_value)
		end

feature -- Basic Operations

	sqlite_to_eiffel (a_value: S): D
			-- Convert `sqlite_to_eiffel'.
		deferred
		end

	eiffel_to_sqlite (a_value: like value): S
			-- Convert `eiffel_to_sqlite'.
		deferred
		end

feature -- Output

	value_out: STRING
			-- Output of `value' in `sqlite_bind_arg'.
		deferred
		end

	formatted_value_out (a_value: detachable S): STRING
			-- Formatted output of `a_value'.
		deferred
		end

feature -- WHERE

	where_out: STRING
			-- Output of WHERE expressions, conjoined (if needed)
		do
			create Result.make_empty
			across
				where_expressions as ic
			loop
				Result.append_string_general (ic.item.t_expr)
				if attached ic.item.t_conjunction as al_conj then
					Result.append_character (' ')
					Result.append_string_general (al_conj)
					Result.append_character (' ')
				end
			end
		end

	where_expressions: ARRAYED_LIST [TUPLE [t_expr: STRING; t_conjunction: detachable STRING]]
			-- A list of WHERE <expr> items.
		attribute
			create Result.make (10)
		end

	add_where_equal (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_equal			-- <expr> = "[Field_name] = [Value]"
		do
			add_where_key_oper_value (a_not, a_value, a_conjunction, "=")
		end

	add_where_lt (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_lt			-- <expr> = "[Field_name] < [Value]"
		do
			add_where_key_oper_value (a_not, a_value, a_conjunction, "<")
		end

	add_where_lte (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_lte			-- <expr> = "[Field_name] <= [Value]"
		do
			add_where_key_oper_value (a_not, a_value, a_conjunction, "<=")
		end

	add_where_gt (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_gt			-- <expr> = "[Field_name] > [Value]"
		do
			add_where_key_oper_value (a_not, a_value, a_conjunction, ">")
		end

	add_where_gte (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_gte			-- <expr> = "[Field_name] >= [Value]"
		do
			add_where_key_oper_value (a_not, a_value, a_conjunction, ">=")
		end

	add_where_is_not (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_is_not		-- <expr> = "[Field_name] IS NOT [Value]"
		do
			add_where_key_oper_value (a_not, a_value, a_conjunction, "IS NOT")
		end

	add_where_key_oper_value (a_not: BOOLEAN; a_value: S; a_conjunction: detachable STRING; a_oper: STRING)
			-- Generically add WHERE with key operator and value (possibly notted)
		local
			l_expr: STRING
		do
			create l_expr.make_empty
			if a_not then
				l_expr.append_string_general (" NOT ")
			end
			l_expr.append_string_general (name)
			l_expr.append_string_general (" " + a_oper + " ")
			l_expr.append_string_general (formatted_value_out (a_value))
			add_expression (l_expr, a_conjunction)
		end

feature -- WHERE LIKE / GLOB / IN / BETWEEN / EXISTS

	add_where_like (a_not, a_starts_like, a_ends_like: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_like			-- <expr> = "[Field_name] LIKE [Value]" (e.g. 'Ki%')
		local
			l_expr: STRING
		do
			create l_expr.make_empty
			if a_not then
				l_expr.append_string_general (" NOT ")
			end
			l_expr.append_string_general (name)
			l_expr.append_string_general (" LIKE ")
			if a_starts_like then
				l_expr.append_string_general (formatted_value_out (a_value) + "%%")
			elseif a_ends_like then
				l_expr.append_string_general ("%%" + formatted_value_out (a_value))
			else -- has-like ...
				l_expr.append_string_general ("%%" + formatted_value_out (a_value) + "%%")
			end
			add_expression (l_expr, a_conjunction)
		end

	add_where_glob (a_not, a_starts_like, a_ends_like: BOOLEAN; a_value: S; a_conjunction: detachable STRING)
			--Where_glob			-- <expr> = "[Field_name] GLOB [Value]" (e.g. 'Ki*')
		local
			l_expr: STRING
		do
			create l_expr.make_empty
			if a_not then
				l_expr.append_string_general (" NOT ")
			end
			l_expr.append_string_general (name)
			l_expr.append_string_general (" LIKE ")
			if a_starts_like then
				l_expr.append_string_general (formatted_value_out (a_value) + "*")
			elseif a_ends_like then
				l_expr.append_string_general ("*" + formatted_value_out (a_value))
			else -- has-like ...
				l_expr.append_string_general ("*" + formatted_value_out (a_value) + "*")
			end
			add_expression (l_expr, a_conjunction)
		end

	add_where_in (a_not: BOOLEAN; a_value_list: ARRAY [S]; a_conjunction: detachable STRING)
			--Where_in			-- <expr> = "[Field_name]IN ([CSV_value_list])"
		local
			l_expr: STRING
		do
			create l_expr.make_empty
			if a_not then
				l_expr.append_string_general (" NOT ")
			end
			l_expr.append_string_general (name)
			l_expr.append_string_general (" IN (")
			across
				a_value_list as ic
			loop
				l_expr.append_string_general (formatted_value_out (ic.item))
				if ic.cursor_index < a_value_list.count then
					l_expr.append_character (',')
				end
			end
			l_expr.append_character (')')
			add_expression (l_expr, a_conjunction)
		end

	add_where_between (a_not: BOOLEAN; a_lb, a_nb: detachable S; a_conjunction: detachable STRING)
			--Where_between		-- <expr> = "[Field_name] BETWEEN [Value_lower] AND [Value_upper]"
		local
			l_expr: STRING
		do
			create l_expr.make_empty
			if a_not then
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

	add_expression (a_expr: STRING; a_conjunction: detachable STRING)
			-- Add `a_expr' to `where_expressions'
		do
			where_expressions.force ([a_expr, a_conjunction])
		end

end
