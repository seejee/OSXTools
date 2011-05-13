require 'spec_helper'

describe OSXTools do

  before(:each) do
    ensure_test_image_is_unmounted
    mount_test_image
  end

  after(:each) do
    ensure_test_image_is_unmounted
  end

  context "when mounting a disk image" do

    it 'should appear in the list of available volumes' do
      test_image_volume.nil?.should == false
    end

  end

  context "when unmounting a volume" do

    before(:each) do
      test_image_volume.unmount
    end

    it 'should report as unmounted' do
      test_image_volume.mounted?.should == false
    end

  end

  context "when mounting a volume" do

    before(:each) do
      test_image_volume.unmount
      test_image_volume.mount
    end

    it 'should report as mounted' do
      test_image_volume.mounted?.should == true
    end

  end

  context "when ejecting a volume" do

    before(:each) do
      test_image_volume.eject
    end

    it 'should no longer appear in the list of attached volumes' do
      test_image_attached?.should == false
    end

  end

  private

  def mount_test_image
    OSXTools.mount_image(spec_resource_path + 'test_image.dmg')
  end

  def test_image_attached?
    !test_image_volume.nil?
  end

  def test_image_volume
    OSXTools.attached_volumes.find {|v| v.name == "TESTIMAGE" }
  end

  def ensure_test_image_is_unmounted
    test_image_volume.eject unless test_image_volume.nil?
  end

end