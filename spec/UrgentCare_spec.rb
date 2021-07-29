
RSpec.describe Urgentcare do  
  it "has a version number" do
    expect(Urgentcare::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

end

=begin RSpec.describe Office do 
  it "has at least one office" do
    list = Office.all 
    expect(list.nil?).to eq(false)
  end
end

