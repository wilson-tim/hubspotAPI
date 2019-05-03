
for /f %%a IN ('powershell get-date -format "{yyyyMMdd}"') do set today=%%a

G:
CD G:\Marine\Triton\data\FullLoad\

REN MAR_TRT_%TODAY%_Accomodations.csv MAR_TRT_Accomodations.csv
REN MAR_TRT_%TODAY%_Bookings.csv MAR_TRT_Bookings.csv
REN MAR_TRT_%TODAY%_Brochures.csv MAR_TRT_Brochures.csv
REN MAR_TRT_%TODAY%_Clientpref01.csv MAR_TRT_Clientpref01.csv
REN MAR_TRT_%TODAY%_Clientpref02.csv MAR_TRT_Clientpref02.csv
REN MAR_TRT_%TODAY%_Clientpref03.csv MAR_TRT_Clientpref03.csv
REN MAR_TRT_%TODAY%_Clientpref04.csv MAR_TRT_Clientpref04.csv
REN MAR_TRT_%TODAY%_Clientpref05.csv MAR_TRT_Clientpref05.csv
REN MAR_TRT_%TODAY%_Clientpref06.csv MAR_TRT_Clientpref06.csv
REN MAR_TRT_%TODAY%_Clientpref07.csv MAR_TRT_Clientpref07.csv
REN MAR_TRT_%TODAY%_Clientpref08.csv MAR_TRT_Clientpref08.csv
REN MAR_TRT_%TODAY%_Clientpref09.csv MAR_TRT_Clientpref09.csv
REN MAR_TRT_%TODAY%_Clientpref10.csv MAR_TRT_Clientpref10.csv
REN MAR_TRT_%TODAY%_Clientpref11.csv MAR_TRT_Clientpref11.csv
REN MAR_TRT_%TODAY%_Clientpref12.csv MAR_TRT_Clientpref12.csv
REN MAR_TRT_%TODAY%_Clients01.csv MAR_TRT_Clients01.csv
REN MAR_TRT_%TODAY%_Clients02.csv MAR_TRT_Clients02.csv
REN MAR_TRT_%TODAY%_Clients03.csv MAR_TRT_Clients03.csv
REN MAR_TRT_%TODAY%_Clients04.csv MAR_TRT_Clients04.csv
REN MAR_TRT_%TODAY%_Clients05.csv MAR_TRT_Clients05.csv
REN MAR_TRT_%TODAY%_Clients06.csv MAR_TRT_Clients06.csv
REN MAR_TRT_%TODAY%_Clients07.csv MAR_TRT_Clients07.csv
REN MAR_TRT_%TODAY%_Clients08.csv MAR_TRT_Clients08.csv
REN MAR_TRT_%TODAY%_Clients09.csv MAR_TRT_Clients09.csv
REN MAR_TRT_%TODAY%_Clients10.csv MAR_TRT_Clients10.csv
REN MAR_TRT_%TODAY%_Clients11.csv MAR_TRT_Clients11.csv
REN MAR_TRT_%TODAY%_Clients12.csv MAR_TRT_Clients12.csv
REN MAR_TRT_%TODAY%_Clients13.csv MAR_TRT_Clients13.csv
REN MAR_TRT_%TODAY%_Clients14.csv MAR_TRT_Clients14.csv
REN MAR_TRT_%TODAY%_Clients15.csv MAR_TRT_Clients15.csv
REN MAR_TRT_%TODAY%_Clients16.csv MAR_TRT_Clients16.csv
REN MAR_TRT_%TODAY%_Clients17.csv MAR_TRT_Clients17.csv
REN MAR_TRT_%TODAY%_Clients18.csv MAR_TRT_Clients18.csv
REN MAR_TRT_%TODAY%_Clients19.csv MAR_TRT_Clients19.csv
REN MAR_TRT_%TODAY%_Clients20.csv MAR_TRT_Clients20.csv
REN MAR_TRT_%TODAY%_EmailPref.csv MAR_TRT_EmailPref.csv
REN MAR_TRT_%TODAY%_extras.csv MAR_TRT_extras.csv
REN MAR_TRT_%TODAY%_flights.csv MAR_TRT_flights.csv
REN MAR_TRT_%TODAY%_mailhst.csv MAR_TRT_mailhst.csv
REN MAR_TRT_%TODAY%_passengers.csv MAR_TRT_passengers.csv
REN MAR_TRT_%TODAY%_priorities.csv MAR_TRT_priorities.csv
REN MAR_TRT_%TODAY%_quotes.csv MAR_TRT_quotes.csv
REN MAR_TRT_%TODAY%_QuotesAccomodations.csv MAR_TRT_QuotesAccomodations.csv
REN MAR_TRT_%TODAY%_quotesextras.csv MAR_TRT_quotesextras.csv
REN MAR_TRT_%TODAY%_quotesflights.csv MAR_TRT_quotesflights.csv
REN MAR_TRT_%TODAY%_QuotesPassengers.csv MAR_TRT_QuotesPassengers.csv
REN MAR_TRT_%TODAY%_TritonCelerity.csv MAR_TRT_TritonCelerity.csv