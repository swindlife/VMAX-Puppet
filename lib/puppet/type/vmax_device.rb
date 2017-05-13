Puppet::Type.newtype(:vmax_device) do
  @doc = "Manage EMC VMAX Devices."

  ensurable

  newparam(:name, :namevar => true) do
    desc "The device name"
    validate do |value|
      fail("LUN name cannot exceed 64 characters") unless value.length <= 64
    end
  end

  newparam(:device_name) do
    desc "The device name"
    validate do |value|
      fail("LUN name cannot exceed 64 characters") unless value.length <= 64
    end
  end

  newproperty(:new_name) do
    desc "The device new name"

    validate do |value|
      fail("LUN name cannot exceed 64 characters") unless value.length <= 64
    end
  end

  newproperty(:size) do
    desc "The device size"
    munge do |value|
      value.to_i
    end
  end

  newproperty(:emulation) do
  end

  newproperty(:config) do
  end

  newproperty(:sg) do
  end


  #============Read Only Properties=============#
  newproperty(:uid) do
    desc "UID"

    validate do
      fail "uid is read-only"
    end
  end
end
