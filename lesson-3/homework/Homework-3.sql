create table airport (
    id bigint primary key,
    airport_name varchar(50),
    country varchar(50),
    city varchar(50),
    created_at datetime2,
    updated_at datetime2
)

create table airline (
    id bigint primary key,
    airline_code varchar(10),
    airline_name varchar(50),
    airline_country varchar(50),
    created_at datetime2,
    updated_at datetime2
)

create table passengers (
    id bigint primary key,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    country_of_citizenship varchar(50),
    country_of_residence varchar(50),
    passport_number varchar(20),
    created_at datetime2,
    updated_at datetime2
)

create table no_fly_list (
    id bigint primary key,
    active_from date,
    active_to date,
    no_fly_reason varchar(255),
    created_at datetime2,
    updated_at datetime2,
    psngr_id bigint,
    constraint fk_psngr_id_no_fly_list foreign key (psngr_id) references passengers(id)
)

create table flights (
    flight_id bigint primary key,
    departing_gate varchar(20),
    arriving_gate varchar(20),
    created_at datetime2,
    airline_id bigint,
    departing_airport_id bigint,
    arriving_airport_id bigint,
    constraint fk_airline_id_flights foreign key (airline_id) references airline(id),
    constraint fk_departing_airport_flights foreign key (departing_airport_id) references airport(id),
    constraint fk_arriving_airport_flights foreign key (arriving_airport_id) references airport(id)
)

create table booking (
    bookingid bigint primary key,
    flight_id bigint,
    status varchar(20),
    booking_platform varchar(20),
    created_at datetime2,
    updated_at datetime2,
    passenger_id bigint,
    constraint fk_flight_id_booking foreign key (flight_id) references flights(flight_id),
    constraint fk_passenger_id_booking foreign key (passenger_id) references passengers(id)
)

create table baggage (
    id bigint primary key,
    weight_in_kg decimal(4,2),
    created_date datetime2,
    updated_date datetime2,
    booking_id bigint,
    constraint fk_booking_id_baggage foreign key (booking_id) references booking(bookingid)
)

create table baggage_check (
    id bigint primary key,
    check_result varchar(50),
    created_at datetime2,
    updated_at datetime2,
    booking_id bigint,
    passenger_id bigint,
    constraint fk_booking_id_baggage_check foreign key (booking_id) references booking(bookingid),
    constraint fk_passenger_id_baggage_check foreign key (passenger_id) references passengers(id)
)

create table security_check (
    id bigint primary key,
    check_result varchar(20),
    comments varchar(6535),
    created_at datetime2,
    updated_at datetime2,
    passenger_id bigint,
    constraint fk_passenger_id_security_check foreign key (passenger_id) references passengers(id)
)

create table flight_manifest (
    id bigint primary key,
    created_at datetime2,
    updated_at datetime2,
    booking_id bigint,
    flight_id bigint,
    constraint fk_booking_id_flight_manifest foreign key (booking_id) references booking(bookingid),
    constraint fk_flight_id_flight_manifest foreign key (flight_id) references flights(flight_id)
)

create table boarding_pass (
    id bigint primary key,
    qr_code varchar(6535),
    created_at datetime2,
    updated_at datetime2,
    booking_id bigint,
    constraint fk_booking_id_boarding_pass foreign key (booking_id) references booking(bookingid)
)
