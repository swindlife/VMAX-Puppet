begin
  require 'puppet_x/puppetlabs/transport/emc_vnx'
rescue LoadError => e
  require 'pathname' # WORK_AROUND #14073 and #7788
  module_lib = Pathname.new(__FILE__).parent.parent.parent
  puts "MODULE LIB IS #{module_lib}"
  require File.join module_lib, 'puppet_x/puppetlabs/transport/emc_vnx'
end

Puppet::Type.type(:vmax_device).provide(:vmax_device) do
  include PuppetX::Puppetlabs::Transport::EMCVNX

  desc "Manage devices of VMAX."

  mk_resource_property_methods

  def initialize *args
    super
    @property_flush = {}
  end

  def get_current_properties
  end

  def self.get_device_properties device_info
  end

  # def self.instances
  #   lun_instances = []
  #   luns_info = run ["lun", "-list"]
  #   luns_info.split("\n\n").each do |lun_info|
  #     lun = get_lun_properties lun_info
  #     lun_instances << new(lun)
  #   end
  #   lun_instances
  # end

  # def self.prefetch(resources)
  #   instances.each do |prov|
  #     if resource = resources[prov.name]
  #       resource.provider = prov
  #     end
  #   end
  # end

  # assume exists should be first called
  def exists?
  end

  def set_device
  end

  def create_device
  end

  def create
    @property_flush[:ensure] = :present
  end

  def destroy
    @property_flush[:ensure] = :absent
  end

  def flush
    # destroy
    if @property_flush[:ensure] == :absent
      return
    end

    if exists?
      set_lun
    else
      create_lun
    end
  end
end
