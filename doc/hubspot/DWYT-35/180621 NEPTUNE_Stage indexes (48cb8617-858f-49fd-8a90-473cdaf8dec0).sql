/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.5557)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [NEPTUNE_Stage]
GO
/****** Object:  Index [IX_MARINE_REMBOOK_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_REMBOOK_2] ON [dbo].[ST_MARINE_REMBOOK]
GO
/****** Object:  Index [IX_ST_MARINE_PAXFLIGHTDURATION]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_ST_MARINE_PAXFLIGHTDURATION] ON [dbo].[ST_MARINE_PAXFLIGHTDURATION]
GO
/****** Object:  Index [IX_ST_MARINE_PAXFLIGHT_CK]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_ST_MARINE_PAXFLIGHT_CK] ON [dbo].[ST_MARINE_PAXFLIGHT]
GO
/****** Object:  Index [IX_ST_MARINE_PAX_NC_BKG_PAX]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_ST_MARINE_PAX_NC_BKG_PAX] ON [dbo].[ST_MARINE_PAX]
GO
/****** Object:  Index [IX_MARINE_FBKG_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_FBKG_2] ON [dbo].[ST_MARINE_FBKG]
GO
/****** Object:  Index [IX_MARINE_CLIENTS_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_CLIENTS_2] ON [dbo].[ST_MARINE_CLIENTS]
GO
/****** Object:  Index [NonClusteredIndex-ClientCode]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [NonClusteredIndex-ClientCode] ON [dbo].[ST_MARINE_CLIENT_PREFERENCE]
GO
/****** Object:  Index [IX_MARINE_BOOKINGS_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_BOOKINGS_2] ON [dbo].[ST_MARINE_BOOKINGS]
GO
/****** Object:  Index [IX_BK_NEPTUNE_SFT_ALLOCATION]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_BK_NEPTUNE_SFT_ALLOCATION] ON [dbo].[NEPTUNE_SFT_ALLOCATION]
GO
/****** Object:  Index [IX_NEPTUNE_PASSLINK_NC]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_PASSLINK_NC] ON [dbo].[NEPTUNE_PASSLINK]
GO
/****** Object:  Index [IX_NEPTUNE_PASS_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_PASS_2] ON [dbo].[NEPTUNE_PASS]
GO
/****** Object:  Index [IX_NEPTUNE_FLIGHT_REF_NC]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_FLIGHT_REF_NC] ON [dbo].[NEPTUNE_FLIGHT_REF]
GO
/****** Object:  Index [IX_NEPTUNE_FAMILY_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_FAMILY_2] ON [dbo].[NEPTUNE_FAMILY]
GO
/****** Object:  Index [IX_NEPTUNE_BOOK_2]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_BOOK_2] ON [dbo].[NEPTUNE_BOOK]
GO
/****** Object:  Index [IX_NEPTUNE_AVAIL_NC]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_AVAIL_NC] ON [dbo].[NEPTUNE_AVAIL]
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_NC]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_ACCOMMODATION_NC] ON [dbo].[NEPTUNE_ACCOMMODATION]
GO
/****** Object:  Index [IX_MARINE_REMBOOK_PK]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_REMBOOK_PK] ON [dbo].[ST_MARINE_REMBOOK] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_MARINE_CLIENTS]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_CLIENTS] ON [dbo].[ST_MARINE_CLIENTS] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_MARINE_BOOKINGS_PK]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_MARINE_BOOKINGS_PK] ON [dbo].[ST_MARINE_BOOKINGS] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [ST_MARINE_ACCOMBOAT_CL]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [ST_MARINE_ACCOMBOAT_CL] ON [dbo].[ST_MARINE_ACCOMBOAT] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_NEPTUNE_PASS]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_PASS] ON [dbo].[NEPTUNE_PASS] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_NEPTUNE_MAIL_CONTACT_PK]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_MAIL_CONTACT_PK] ON [dbo].[NEPTUNE_MAIL_CONTACT] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_NEPTUNE_BOOK_PK]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_BOOK_PK] ON [dbo].[NEPTUNE_BOOK] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_REF_CL]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_ACCOMMODATION_REF_CL] ON [dbo].[NEPTUNE_ACCOMMODATION_REF] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_PK]    Script Date: 21/06/2018 10:47:00 ******/
DROP INDEX [IX_NEPTUNE_ACCOMMODATION_PK] ON [dbo].[NEPTUNE_ACCOMMODATION] WITH ( ONLINE = OFF )
GO



/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_PK]    Script Date: 21/06/2018 10:47:00 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NEPTUNE_ACCOMMODATION_PK] ON [dbo].[NEPTUNE_ACCOMMODATION]
(
	[ACCOMMODATION_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_REF_CL]    Script Date: 21/06/2018 10:47:00 ******/
CREATE CLUSTERED INDEX [IX_NEPTUNE_ACCOMMODATION_REF_CL] ON [dbo].[NEPTUNE_ACCOMMODATION_REF]
(
	[CLIENT_NO] ASC,
	[ACCOMRENO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_BOOK_PK]    Script Date: 21/06/2018 10:47:00 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NEPTUNE_BOOK_PK] ON [dbo].[NEPTUNE_BOOK]
(
	[CLIENT_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_MAIL_CONTACT_PK]    Script Date: 21/06/2018 10:47:00 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NEPTUNE_MAIL_CONTACT_PK] ON [dbo].[NEPTUNE_MAIL_CONTACT]
(
	[F_mail_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_PASS]    Script Date: 21/06/2018 10:47:00 ******/
CREATE CLUSTERED INDEX [IX_NEPTUNE_PASS] ON [dbo].[NEPTUNE_PASS]
(
	[CLIENT_NO] ASC,
	[PASS_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [ST_MARINE_ACCOMBOAT_CL]    Script Date: 21/06/2018 10:47:00 ******/
CREATE CLUSTERED INDEX [ST_MARINE_ACCOMBOAT_CL] ON [dbo].[ST_MARINE_ACCOMBOAT]
(
	[CLIENT_NO] ASC,
	[PASS_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MARINE_BOOKINGS_PK]    Script Date: 21/06/2018 10:47:00 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_MARINE_BOOKINGS_PK] ON [dbo].[ST_MARINE_BOOKINGS]
(
	[BookRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MARINE_CLIENTS]    Script Date: 21/06/2018 10:47:00 ******/
CREATE CLUSTERED INDEX [IX_MARINE_CLIENTS] ON [dbo].[ST_MARINE_CLIENTS]
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MARINE_REMBOOK_PK]    Script Date: 21/06/2018 10:47:00 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_MARINE_REMBOOK_PK] ON [dbo].[ST_MARINE_REMBOOK]
(
	[BookRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_ACCOMMODATION_NC]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_ACCOMMODATION_NC] ON [dbo].[NEPTUNE_ACCOMMODATION]
(
	[ACCOMMODATION_NO] ASC,
	[ACCOMMODATION_TYPE_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NEPTUNE_AVAIL_NC]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_AVAIL_NC] ON [dbo].[NEPTUNE_AVAIL]
(
	[COMPANY_NO] ASC,
	[ACCOMMODATION_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_BOOK_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_BOOK_2] ON [dbo].[NEPTUNE_BOOK]
(
	[MAIL_NO] ASC,
	[FAM_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NEPTUNE_FAMILY_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_FAMILY_2] ON [dbo].[NEPTUNE_FAMILY]
(
	[F_mail_no] ASC,
	[F_leader] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_FLIGHT_REF_NC]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_FLIGHT_REF_NC] ON [dbo].[NEPTUNE_FLIGHT_REF]
(
	[CLIENT_NO] ASC,
	[FLIGHTRENO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_PASS_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_PASS_2] ON [dbo].[NEPTUNE_PASS]
(
	[MAIL_NO] ASC,
	[FAM_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
/****** Object:  Index [IX_NEPTUNE_PASSLINK_NC]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_NEPTUNE_PASSLINK_NC] ON [dbo].[NEPTUNE_PASSLINK]
(
	[CLIENT_NO] ASC,
	[PASS_NO] ASC,
	[REF_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BK_NEPTUNE_SFT_ALLOCATION]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_BK_NEPTUNE_SFT_ALLOCATION] ON [dbo].[NEPTUNE_SFT_ALLOCATION]
(
	[i_SK_InventoryDate] ASC,
	[i_BK_FLNUMB] ASC,
	[i_BK_FLTY] ASC,
	[i_BK_CNNB] ASC,
	[i_BK_CLNB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_BOOKINGS_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_BOOKINGS_2] ON [dbo].[ST_MARINE_BOOKINGS]
(
	[BrandCode] ASC,
	[Status] ASC
)
INCLUDE ( 	[BookRef],
	[BookingDate],
	[CancelledDate],
	[ConfirmDate],
	[TotalPax]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-ClientCode]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-ClientCode] ON [dbo].[ST_MARINE_CLIENT_PREFERENCE]
(
	[ClientCode] ASC
)
INCLUDE ( 	[CancelFromBrochure],
	[CancelFromMailing],
	[CancelFromEmail]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_CLIENTS_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_CLIENTS_2] ON [dbo].[ST_MARINE_CLIENTS]
(
	[MailNo] ASC,
	[Lead] ASC,
	[Email1] ASC,
	[Deceased] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_FBKG_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_FBKG_2] ON [dbo].[ST_MARINE_FBKG]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ST_MARINE_PAX_NC_BKG_PAX]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAX_NC_BKG_PAX] ON [dbo].[ST_MARINE_PAX]
(
	[BkgRef] ASC,
	[PaxNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ST_MARINE_PAXFLIGHT_CK]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAXFLIGHT_CK] ON [dbo].[ST_MARINE_PAXFLIGHT]
(
	[i_SK_Bkg] ASC,
	[i_SK_Pax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ST_MARINE_PAXFLIGHTDURATION]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_ST_MARINE_PAXFLIGHTDURATION] ON [dbo].[ST_MARINE_PAXFLIGHTDURATION]
(
	[BkgRef] ASC,
	[FlightHolidayDuration] ASC,
	[FlightNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MARINE_REMBOOK_2]    Script Date: 21/06/2018 10:47:00 ******/
CREATE NONCLUSTERED INDEX [IX_MARINE_REMBOOK_2] ON [dbo].[ST_MARINE_REMBOOK]
(
	[Email1] ASC
)
INCLUDE ( 	[CompanyNo],
	[RemovedDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO