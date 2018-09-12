/*
  DWYT-16 SL_HUBSPOT_FIELD_NAMES insert new field definitions
  24/11/2017  TW  New script
*/

USE [HUBSPOT]
GO
INSERT INTO [dbo].[SL_HUBSPOT_FIELD_NAMES]
([QueryFieldName],[Moorings],[Sunsail],[LeBoat],[Footloose])
VALUES
 ('CancelFromTelephone','preference_cancel_from_telephone','','','')
,('Notes','contact_notes','','','')
,('LastContactDate','last_contact_date','','','')
,('BookingCancellationDate', 'most_recent_booking_cancellation_date', '','','')
,('CancellationCancellationDate','most_recent_cancellation_cancellation_date','','','')
,('CancellationBookRef','most_recent_cancellation_bookingref','','','')
,('FirstCharterDepartureDate','earliest_booking_departure_date','','','')
,('FirstCharterDestination','earliest_booking_destination','','','')
,('FirstCharterDateBooked','earliest_booking_booking_date','','','')
,('FirstCharterProduct','earliest_booking_product','','','')
,('FirstCharterHullType','earliest_booking_hull_type','','','')
,('FirstCharterBoat','earliest_booking_boat','','','')
,('NumberOfBookings','number_of_bookings','','','')
,('TritonCreateDate','triton_create_date','','','')
,('BookingSourceSecondary','most_recent_booking_secondary_source_code','','','')
,('BookingSourceTertiary','most_recent_booking_tertiary_source_code','','','')
,('BookingSalesAgent','most_recent_booking_sales_agent','','','')
,('CleanClientID','clean_client_id','','','')
,('BookingCleanBookRef','most_recent_booking_clean_bookingref','','','')
,('BookingTotalPax','most_recent_booking_number_of_pax','','','')
GO
