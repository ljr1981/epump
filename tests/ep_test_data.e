note
	description: "Temporary Data"

class
	EP_TEST_DATA

inherit
	EP_ANY

feature -- Access

	test_pump_list: ARRAYED_LIST [EP_PUMP]
			-- A list of test {EP_PUMP} items loaded with `test_pump_exhaust_data'.
		local
			i: INTEGER
			l_pump: EP_PUMP
		once ("OBJECT")
			create Result.make (test_pumps.count)
			across
				test_pumps as ic
			from
				i := 0
			loop
				i := ic.cursor_index
				create l_pump.make_from_delimited_string (ic.item)
					-- Exhaust data load
				l_pump.add_exhaust_item (test_pump_dates [1], test_pump_exhaust_data.i_th (i).split (',').i_th (1).to_real)
				l_pump.add_exhaust_item (test_pump_dates [2], test_pump_exhaust_data.i_th (i).split (',').i_th (2).to_real)
				l_pump.add_exhaust_item (test_pump_dates [3], test_pump_exhaust_data.i_th (i).split (',').i_th (3).to_real)
				l_pump.add_exhaust_item (test_pump_dates [4], test_pump_exhaust_data.i_th (i).split (',').i_th (4).to_real)

					-- Temperature data load
				l_pump.add_temperature_item (test_pump_dates [1], test_pump_temperature_data.i_th (i).split (',').i_th (1).to_real)
				l_pump.add_temperature_item (test_pump_dates [2], test_pump_temperature_data.i_th (i).split (',').i_th (2).to_real)
				l_pump.add_temperature_item (test_pump_dates [3], test_pump_temperature_data.i_th (i).split (',').i_th (3).to_real)
				l_pump.add_temperature_item (test_pump_dates [4], test_pump_temperature_data.i_th (i).split (',').i_th (4).to_real)

				Result.force (l_pump)
			end
		end

feature -- Data

	test_pump_dates: ARRAYED_LIST [DATE]
			-- What are the dates of both exhaust and temperature data?
		once ("OBJECT")
			create Result.make (4)
			Result.force (create {DATE}.make_from_string_default ("06/07/2020"))
			Result.force (create {DATE}.make_from_string_default ("06/06/2020"))
			Result.force (create {DATE}.make_from_string_default ("06/05/2020"))
			Result.force (create {DATE}.make_from_string_default ("06/03/2020"))
		end

	test_pump_temperature_data: ARRAYED_LIST [STRING]
			-- The test pump temperature data.
		once ("OBJECT")
			create Result.make (138)
			Result.force ("90,90,90,90")
			Result.force ("84,84,84,84")
			Result.force ("80,77,75,72")
			Result.force ("80,79,78,77")
			Result.force ("80,79,78,78")
			Result.force ("80,78,76,74")
			Result.force ("80,79,78,76")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
			Result.force ("72,72,72,72")
		ensure
			valid_count: Result.count = 138
		end

	test_pump_exhaust_data: ARRAYED_LIST [STRING]
			-- The test pump exhaust data.
		once ("OBJECT")
			create Result.make (138)
			Result.force ("4,3,2,1")
			Result.force ("3.6,3,2.4,2.4")
			Result.force ("9,9,9,9")
			Result.force ("7,7,7,7")
			Result.force ("3.6,3,2.5,2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
			Result.force ("2.2,2.2,2.2,2.2")
		ensure
			pump_data_count: Result.count = 138
		end

	test_pumps: ARRAYED_LIST [STRING]
			-- The tool-chamber-model test pumps.
		once ("OBJECT")
			create Result.make (138)
			Result.force ("CFAMT01X,A,80/500")
			Result.force ("CFAMT01X,B,80/500 ")
			Result.force ("CFAMT01X,C,80/500")
			Result.force ("CFAMT01X,LL,80/500")
			Result.force ("CFAMT01X,DTLR,iQ40")
			Result.force ("CFAMT02X,A,80/500")
			Result.force ("CFAMT02X,B,80/500")
			Result.force ("CFAMT02X,C,80/500")
			Result.force ("CFAMT02X,LL,iQ80")
			Result.force ("CFAMT03X,A,80/250")
			Result.force ("CFAMT03X,B,80/250")
			Result.force ("CFAMT03X,C,80/250")
			Result.force ("CFAMT03X,DTLR,iQ40")
			Result.force ("CFAMT04X,A,80/500")
			Result.force ("CFAMT04X,B,80/500")
			Result.force ("CFAMT04X,C,80/500")
			Result.force ("CFAMT04X,DTLR,iQ40")
			Result.force ("CFAMT05X,A,80/500")
			Result.force ("CFAMT05X,B,80/500")
			Result.force ("CFAMT05X,C,80/500")
			Result.force ("CFAMT05X,MAIN,iQ80")
			Result.force ("CFAMT06X,A,80/250")
			Result.force ("CFAMT06X,B,80/250")
			Result.force ("CFAMT06X,C,80/250")
			Result.force ("CFAMT06X,LL,iQ40")
			Result.force ("CFAMT07X,A,80/500")
			Result.force ("CFAMT07X,B,80/500")
			Result.force ("CFAMT07X,C,80/500")
			Result.force ("CDTEL21X,MAIN,80/1200")
			Result.force ("CDTEL09X,MAIN,80/1200")
			Result.force ("CDTEL10X,MAIN,80/1200")
			Result.force ("CDBTI02X,MAIN,80/1200")
			Result.force ("CDBTI04X,MAIN,80/1200")
			Result.force ("CDBTI12X,MAIN,80/1200")
			Result.force ("CDBTI15X,MAIN,80/1200")
			Result.force ("CDBTI16X,MAIN,80/1200")
			Result.force ("CDBTI17X,MAIN,80/1200")
			Result.force ("CDBTI20X,MAIN,80/1200")
			Result.force ("CSEND01X,SYS,40/250")
			Result.force ("CSEND01X,TURBO,iQ40")
			Result.force ("CSEND02X,SYS,40/250")
			Result.force ("CSEND02X,TURBO,iQ40")
			Result.force ("CSEND03X,SYS,40/250")
			Result.force ("CSEND03X,TURBO,iQ40")
			Result.force ("CECEN01X,A,80/250")
			Result.force ("CECEN01X,B,80/250")
			Result.force ("CECEN01X,C,80/250")
			Result.force ("CECEN01X,D ,80/250")
			Result.force ("CECEN01X,BUFF,iQ40")
			Result.force ("CECEN01X,LL,iQ40")
			Result.force ("CECEN02X,A,40/250")
			Result.force ("CECEN02X,C,80/500")
			Result.force ("CECEN02X,D,80/500")
			Result.force ("CECEN02X,BUFF,iQ80")
			Result.force ("CECEN02X,LL,iQ80")
			Result.force ("CECEN03X,A,80/250")
			Result.force ("CECEN03X,B,80/250")
			Result.force ("CECEN03X,C,80/250")
			Result.force ("CECEN03X,D,80/250")
			Result.force ("CECEN03X,BUFF,iQ80")
			Result.force ("CECEN03X,LL,iQ40")
			Result.force ("CELRC03X,A,80/500")
			Result.force ("CELRC03X,B,iQ80")
			Result.force ("CELRC03X,C,iQ80")
			Result.force ("CELRC03X,D,80/500")
			Result.force ("CELRC03X,TM,ALCATEL")
			Result.force ("CELRC03X,LL,ALCATEL")
			Result.force ("CELRC04X,1,80/500")
			Result.force ("CELRC04X,3,iQ80")
			Result.force ("CELRC04X,4,80/500")
			Result.force ("CELRC04X,TM,iQ80")
			Result.force ("CELRC04X,LL,iQ80")
			Result.force ("CELRC23X,1,iQ80")
			Result.force ("CELRC23X,4,iQ80")
			Result.force ("CELRC23X,TM,80/500")
			Result.force ("CELRC24X,MAIN,iQ80")
			Result.force ("CELRC24X,LL,80/500")
			Result.force ("CELRC21X,ELL,iQ80")
			Result.force ("CELRC21X,XLL,iQ80")
			Result.force ("CELRC21X,MAIN,iQ80")
			Result.force ("CELRC12X,A,80/500")
			Result.force ("CELRC12X,B,iQ80")
			Result.force ("CELRC12X,D,iQ80")
			Result.force ("CELRC12X,LL,ALCATEL")
			Result.force ("CELRC10X,MAIN,80/500")
			Result.force ("CELRC10X,XLL,iQ80")
			Result.force ("CELRC10X,ELL,80/500")
			Result.force ("CELRC11X,MAIN,80/500")
			Result.force ("CELRC11X,XLL,iQ80")
			Result.force ("CELRC11X,ELL,80/500")
			Result.force ("CELRC22X,B,iQ80")
			Result.force ("CELRC22X,C,iQ80")
			Result.force ("CELRC22X,D,iQ80")
			Result.force ("CELRC22X,LL,80/500")
			Result.force ("CELRC14X,MAIN,80/500")
			Result.force ("CELRC14X,XLL,iQ80")
			Result.force ("CELRC14X,LL,80/500")
			Result.force ("CELRC05X,1,80/500")
			Result.force ("CELRC05X,2,iQ80")
			Result.force ("CELRC05X,3,iQ80")
			Result.force ("CELRC05X,4,80/500")
			Result.force ("CELRC05X,TM,ALCATEL")
			Result.force ("CELRC05X,LL,iQ80")
			Result.force ("CETEL15X,A,iQ80")
			Result.force ("CETEL15X,TC,80/500")
			Result.force ("CETEL15X,CC,80/500")
			Result.force ("CETEL13X,A,iQ80")
			Result.force ("CETEL13X,B,iQ80")
			Result.force ("CETEL13X,C,80/500")
			Result.force ("CETEL13X,TC,80/500")
			Result.force ("CETEL13X,CC,ALCATEL")
			Result.force ("CETEL16X,A,iQ80")
			Result.force ("CETEL16X,B,iQ80")
			Result.force ("CETEL16X,C,iQ80")
			Result.force ("CETEL16X,TC,80/500")
			Result.force ("CAGAS06X,MAIN,80/500")
			Result.force ("CAGAS01X,MAIN,80/500")
			Result.force ("CAGAS03X,MAIN,80/500")
			Result.force ("CAGAS07X,MAIN,80/500")
			Result.force ("CAGAS82X,MAIN,80/500")
			Result.force ("CAGAS02X,MAIN,80/500")
			Result.force ("CAGAS05X,MAIN,80/500")
			Result.force ("CAYES01X,MAIN,iQ40")
			Result.force ("CAPEP01X,A,iQX600")
			Result.force ("CAPEP01X,B,iQX600")
			Result.force ("CAASP01X,REAR,80/500")
			Result.force ("CAASP01X,LL,iQX600")
			Result.force ("CAASP02X,REAR,80/500")
			Result.force ("CAASP02X,SIDE,80/500")
			Result.force ("CAASP02X,LL,iQX600")
			Result.force ("CSEND07X,SYS,40/250")
			Result.force ("CSEND07X,D,iQ40")
			Result.force ("CSEND06X,SYS,40/250")
			Result.force ("CSEND06X,D,iQ40")
			Result.force ("CSEND05X,SYS,40/250")
			Result.force ("CSEND05X,D,iQ40")
			Result.force ("CSEND04X,SYS,40/250")
			Result.force ("CSEND04X,D,iQ40")
		ensure
			pump_count: Result.count = 138
		end

end
