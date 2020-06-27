note
	description: "Expanded Data Access Constants"

expanded class
	DA_CONSTANTS

feature -- Constants

	Create_sql_kw: STRING = " CREATE "
	Select_sql_kw: STRING = " SELECT "
	From_sql_kw: STRING = " FROM "
	Where_sql_kw: STRING = " WHERE "
	Insert_into_sql_kw: STRING = " INSERT INTO "
	Values_sql_kw: STRING = " VALUES "
	Deleete_sql_kw: STRING = " DELETE "
	Is_not_sql_kw: STRING = " IS NOT "
	Not_sql_kw: STRING = " NOT "
	Like_sql_kw: STRING = " LIKE "
	In_sql_kw: STRING = " IN "
	Between_sql_kw: STRING = " BETWEEN "

	Equal_sign_kw: STRING = "="
	LT_sign_kw: STRING = "<"
	LTE_sign_kw: STRING = "<="
	GT_sign_kw: STRING = ">"
	GTE_sign_kw: STRING = ">="

	And_conj_kw: STRING = " AND "
	Or_conj_kw: STRING = " OR "

	Conjunctions: ARRAY [STRING] once Result := <<And_conj_kw, Or_conj_kw>> end

	Space_char: CHARACTER = ' '
	Semi_colon_char: CHARACTER = ';'
	Comma_char: CHARACTER = ','
	Left_paren_char: CHARACTER = '('
	Right_paren_char: CHARACTER = ')'
	Double_quote_char: CHARACTER = '"'
	Percent_char: CHARACTER = '%%'
	Asterisk_char: CHARACTER = '*'

end
