/*
  DWYT-16 SL_HUBSPOT_FIELD_NAMES delete new field definitions
  24/11/2017  TW  New script
*/

USE [HUBSPOT]
GO
DELETE FROM [dbo].[SL_HUBSPOT_FIELD_NAMES]
WHERE [QueryFieldName] IN (
 'CancelFromTelephone'
,'Notes'
,'LastContactDate'
,'BookingCancellationDate'
,'CancellationCancellationDate'
,'CancellationBookRef'
,'CancellationEmail'
,'FirstCharterDepartureDate'
,'FirstCharterDestination'
,'FirstCharterDateBooked'
,'FirstCharterProduct'
,'FirstCharterHullType'
,'FirstCharterBoat'
,'NumberOfBookings'
,'TritonCreateDate'
,'BookingSourceSecondary'
,'BookingSourceTertiary'
,'BookingSalesAgent'
,'CleanClientID'
,'BookingCleanBookRef'
,'BookingTotalPax'
)
GO
