class Facility

  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees


  #change to look for keyword instead of positional 
  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  #each time a vehicle is registered, a fee is collected based on vehicle type
  def register_vehicle(vehicle)
   if @services.include?('Vehicle Registration')
    vehicle.register 
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    @registered_vehicles << vehicle
   end
  end


  # road and written tests, renewing license. 
  def administer_written_test(registrant)
    if @services.include?('Written Test')
      registrant.pass_test
    end
    registrant.license_data[:written]
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
        registrant.earn_license
    end
    registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License")
        registrant.renew_license
    end
    registrant.license_data[:renewed]
  end

  # end of class
end
