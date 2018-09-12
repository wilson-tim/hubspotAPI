/*
  DWYT-16 SL_HUBSPOT_FIELD_NAMES insert new field definitions
  Save current data for combination of V-AWD-SQL-11 and HubSpot API ZZ Test account
  11/12/2017  TW  New script
*/

USE [HUBSPOT]
GO
TRUNCATE TABLE [dbo].[SL_HUBSPOT_FIELD_NAMES]
GO
INSERT INTO [dbo].[SL_HUBSPOT_FIELD_NAMES]
([QueryFieldName],[Moorings],[Sunsail],[LeBoat],[Footloose])
VALUES
('LifecycleStage','lifecyclestage','lifecyclestage','lifecyclestage','lifecyclestage')
,('BrandName','brand','brand','brand','brand')
,('Broker','broker_agent_','broker_agent_','broker_agent_','broker_agent_')
,('ConfirmDate','closedate','closedate','closedate','closedate')
,('BookingSourcePrimary','most_recent_booking_source_code','most_recent_booking_source_code','most_recent_booking_source_code','most_recent_booking_footloose_source_code')
,('BookingOfficeLocation','booking_office_booking_','booking_office','booking_office_booking_','booking_office_booking_')
,('BookingLanguage','preference_language_selected_','booking_language','booking_language','language')
,('ClientCode','client_id','client_id','client_id','client_id')
,('Title','title','title','title','title')
,('FirstName','firstname','firstname','firstname','firstname')
,('LastName','lastname','lastname','lastname','lastname')
,('CompanyName','company','company','company','company')
,('City','city','city','city','city')
,('County','county_state_province','county_state_province','state','county_state_province')
,('PostCode','zip','zip','zip','zip')
,('Country','country','country','country','country')
,('Email','email','email','email','email')
,('CancelFromMailing','preference_cancel_from_mailing','cancel_from_mailing','preference_do_not_mail','cancel_from_mailing')
,('CancelFromEmail','preference_cancel_from_email','cancel_from_email','preference_do_not_email','do_not_email')
,('CancelFromBrochure','preference_cancel_from_brochure','cancel_from_brochure','preference_cancel_from_brochure','preferences_cancel_from_brochure')
,('Deceased','preference_deceased','deceased','preference_deceased','deceased')
,('Blacklisted','preference_blacklisted','blacklisted','preference_blacklisted','blacklisted')
,('BookingProductName','most_recent_booking_product','most_recent_booking_product','most_recent_booking_product','')
,('BookingDateBooked','most_recent_booking_date_booked','most_recent_booking_date_made','most_recent_booking_booking_date','most_recent_footloose_booking_date_made')
,('BookingDepartureDate','most_recent_booking_departure_date','most_recent_booking_departure_date','most_recent_booking_departure_date','most_recent_footloose_booking_departure_date')
,('BookingDestination','most_recent_booking_destination','most_recent_booking_destination','most_recent_booking_destination','')
,('BookingHullType','most_recent_booking_hull_type','most_recent_booking_hull_type','','')
,('BookingBoatType','','','','')
,('QuoteProductName','most_recent_quote_product','most_recent_quote_product','most_recent_quote_product','')
,('QuoteDateRequested','most_recent_quote_date_requested','most_recent_quote_date_requested','most_recent_quote_date_requested_5_days_','most_recent_footloose_quote_date_requested')
,('QuoteDepartureDate','most_recent_quote_departure_date','most_recent_quote_departure_date','most_recent_quote_departure_date','most_recent_footloose_quote_departure_date')
,('QuoteDestination','most_recent_quote_destination','most_recent_quote_destination','most_recent_quote_destination','')
,('QuoteHullType','most_recent_quote_hull_type','most_recent_quote_hull_type','','')
,('BrochureProductRequested','most_recent_brochure_product_requested','most_recent_brochure_product_requested','most_recent_brochure_product_requested','')
,('BrochureDateRequested','most_recent_brochure_date_requested','most_recent_brochure_date_requested','most_recent_brochure_date_requested','most_recent_footloose_brochure_date_requested')
,('EnewsDateRequested','most_recent_enews_date_requested','most_recent_enews_date_subscribed','most_recent_enews_date_subscribed','most_recent_footloose_enews_date_requested')
,('EnewsProductName','most_recent_enews_product','most_recent_enews_product','','')
,('Address1','address','address','address','address')
,('Address2','address_2','address_2_apt_','address_2_apt_','address_2_apt_')
,('Address3','address_3','address_3','address_3','address_3')
,('Phone1','phone','phone','phone','phone')
,('Phone2','phone_2','phone_2','phone_number_2','phone_2')
,('BusinessPhone','phone_3_business_','phone_3','phone_number_3','phone_3')
,('BookingExecutiveReportingRegion','most_recent_booking_exec_reporting_region','most_recent_booking_exec_reporting_region','','')
,('QuoteExecutiveReportingRegion','most_recent_quote_exec_reporting_region','most_recent_quote_exec_reporting_region','','')
,('NumberOfCharters','no_of_bookings','number_of_bookings','','no_of_bookings')
,('Duration','most_recent_booking_charter_duration','most_recent_booking_charter_duration','duration','')
,('BookingBoat','most_recent_booking_boat','most_recent_booking_boat','','most_recent_booking_footloose_boat')
,('QuoteBoat','most_recent_quote_boat','most_recent_quote_boat','','most_recent_quote_footloose_boat')
,('BookingBookRef','most_recent_booking_bookingref','most_recent_booking_bookingref','most_recent_booking_bookingref','most_recent_booking_footloose_bookingref')
,('QuoteBookRef','most_recent_quote_bookingref','most_recent_quote_bookingref','most_recent_quote_bookingref','most_recent_quote_footloose_bookingref')
,('CustomerLinkCode','client_link_code','client_link_code','','client_link_code')
,('CustomerClass','client_class_triton_','client_class','','client_class')
,('GoneAway','preference_goneaway','preference_goneaway','','preference_goneaway')
,('ClientSourceCode','client_source_code','client_source_code','','client_source_code')
,('Status','activity_status','activity_status','activity_status','activity_status_footloose_')
,('ClientBookingOffice','client_booking_office','client_booking_office','','client_booking_office')
,('QuoteSourcePrimary','most_recent_quote_source_code','most_recent_quote_source_code','','most_recent_quote_footloose_source_code')
,('DateOfBirth','date_of_birth','date_of_birth','date_of_birth','date_of_birth')
,('Charter','','','le_boat_charter','')
,('CancelFromTelephone','preference_cancel_from_telephone','preference_cancel_from_telephone','preference_cancel_from_telephone','preference_cancel_from_telephone')
,('Notes','contact_notes','contact_notes','contact_notes','contact_notes')
,('LastContactDate','last_contact_date','last_contact_date','last_contact_date','last_contact_date')
,('BookingCancellationDate','most_recent_booking_cancellation_date','most_recent_booking_cancellation_date','most_recent_booking_cancellation_date','most_recent_booking_cancellation_date')
,('CancellationCancellationDate','most_recent_cancellation_cancellation_date','most_recent_cancellation_cancellation_date','most_recent_cancellation_cancellation_date','most_recent_cancellation_cancellation_date')
,('CancellationBookRef','most_recent_cancellation_bookingref','most_recent_cancellation_bookingref','most_recent_cancellation_bookingref','most_recent_cancellation_bookingref')
,('FirstCharterDepartureDate','earliest_booking_departure_date','earliest_booking_departure_date','earliest_booking_departure_date','earliest_booking_departure_date')
,('FirstCharterDestination','earliest_booking_destination','earliest_booking_destination','earliest_booking_destination','earliest_booking_destination')
,('FirstCharterDateBooked','earliest_booking_booking_date','earliest_booking_booking_date','earliest_booking_booking_date','earliest_booking_booking_date')
,('FirstCharterProduct','earliest_booking_product','earliest_booking_product','earliest_booking_product','earliest_booking_product')
,('FirstCharterHullType','earliest_booking_hull_type','earliest_booking_hull_type','earliest_booking_hull_type','earliest_booking_hull_type')
,('FirstCharterBoat','earliest_booking_boat','earliest_booking_boat','earliest_booking_boat','earliest_booking_boat')
,('NumberOfBookings','number_of_bookings','number_of_bookings','number_of_bookings','number_of_bookings')
,('TritonCreateDate','triton_create_date','triton_create_date','','triton_create_date')
,('NeptuneCreateDate','','','neptune_create_date','')
,('BookingSourceSecondary','most_recent_booking_secondary_source_code','most_recent_booking_secondary_source_code','most_recent_booking_secondary_source_code','most_recent_booking_secondary_source_code')
,('BookingSourceTertiary','most_recent_booking_tertiary_source_code','most_recent_booking_tertiary_source_code','most_recent_booking_tertiary_source_code','most_recent_booking_tertiary_source_code')
,('BookingSalesAgent','most_recent_booking_sales_agent','most_recent_booking_sales_agent','most_recent_booking_sales_agent','most_recent_booking_sales_agent')
,('CleanClientID','clean_client_id','clean_client_id','clean_client_id','clean_client_id')
,('BookingCleanBookRef','most_recent_booking_clean_bookingref','most_recent_booking_clean_bookingref','most_recent_booking_clean_bookingref','most_recent_booking_clean_bookingref')
,('BookingTotalPax','most_recent_booking_number_of_pax','most_recent_booking_number_of_pax','most_recent_booking_number_of_pax','most_recent_booking_number_of_pax')
GO
