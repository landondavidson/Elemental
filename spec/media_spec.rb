require 'spec_helper'

describe Media do
  describe "#new" do
    it "creates a media object when valid json is passed in" do
      media = Media.new "[
                          {
                            \"price\": 15.99,
                            \"chapters\": [
                              \"one\",
                              \"two\",
                              \"three\"
                              ],
                            \"year\": 1999,
                            \"title\": \"foo\",
                            \"author\": \"mary\",
                            \"type\": \"book\"
                          },
                          {
                            \"price\": 11.99,
                            \"minutes\": 90,
                            \"year\": 2004,
                            \"title\": \"bar\",
                            \"director\": \"alan\",
                            \"type\": \"dvd\"
                          },
                          {
                            \"price\": 15.99,
                            \"tracks\": [
                              {
                                \"seconds\": 180,
                                \"name\": \"one\"
                              },
                              {
                                \"seconds\": 200,
                                \"name\": \"two\"
                              }
                            ],
                            \"year\": 2000,
                            \"title\": \"baz\",
                            \"author\": \"joan\",
                            \"type\": \"cd\"
                          }
                        ]"
      expect(media).to be_an_instance_of Media
    end

    it "throws an ArgumentError when no parameters passed in" do
      expect{Media.new}.to raise_error ArgumentError
    end

    it "throws a ParseError when invalid json is passed in" do
      expect{Media.new "invald json".to raise_error JSON::ParseError}
    end
  end
  
  describe "#most_expensive" do
    it "returns the five most expensive items of each type when 10 of each type with unique prices are passed in" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(5)["book"]
      expect(result["book"].all? { |e| e["price"] >= 6.99  }).to eq true
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result).to have_exactly(5)["cd"]
      expect(result["cd"].all? { |e| e["price"] >= 27.99  }).to eq true
    end

    it "returns the five most expensive items of each type when 10 of each type with some duplicate prices are passed in" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(5)["book"]
      expect(result["book"].all? { |e| e["price"] >= 6.99  }).to eq true
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result).to have_exactly(5)["cd"]
      expect(result["cd"].all? { |e| e["price"] >= 27.99  }).to eq true
    end

    it "returns the five most expensive items of each type when there are more than 5 item of each type, but when there are less than 5 items all are returned" do
      media = Media.new "[
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(3)["book"]
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result).to have_exactly(5)["cd"]
      expect(result["cd"].all? { |e| e["price"] >= 27.99  }).to eq true
    end

    it "returns the five most expensive items of each type.  Only two types are passed in book and dvd.  No cds are returned." do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(5)["book"]
      expect(result["book"].all? { |e| e["price"] >= 6.99  }).to eq true
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result["cd"]).to eq nil
    end

    it "returns the five most expensive items of each type.  If there are 6 items that have the same price in a category only 5 will be returned in no particular secondary result." do
      media = Media.new "[
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(5)["book"]
      expect(result["book"].all? { |e| e["price"] >= 9.99  }).to eq true
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result).to have_exactly(5)["cd"]
      expect(result["cd"].all? { |e| e["price"] >= 27.99  }).to eq true
    end

    it "returns the five most expensive items of each type when 10 of each type. If one item has no type that item is skipped" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"notype\":\"notype\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(5)["book"]
      expect(result["book"].all? { |e| e["price"] >= 6.99  }).to eq true
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result).to have_exactly(5)["cd"]
      expect(result["cd"].all? { |e| e["price"] >= 27.99  }).to eq true
    end

    it "returns the five most expensive items of each type when 10 of each type. If an item has no price that item is skipped" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"type\":\"noprice\"}
                        ]"
      result = media.most_expensive(5)
      expect(result).to have_exactly(5)["book"]
      expect(result["book"].all? { |e| e["price"] >= 6.99  }).to eq true
      expect(result).to have_exactly(5)["dvd"]
      expect(result["dvd"].all? { |e| e["price"] >= 17.99  }).to eq true
      expect(result).to have_exactly(5)["cd"]
      expect(result["cd"].all? { |e| e["price"] >= 27.99  }).to eq true
    end
  end

  describe "#cd_runtime" do
    it "returns all cds with a runtime of greater than 60 minutes" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 300,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 600,\"name\": \"two\"},{\"seconds\": 400,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.cd_runtime{|time| time > 3600}
      expect(result).to have_exactly(4).items
    end

    it "returns no cds if no cds are passed in" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"}
                        ]"
      result = media.cd_runtime{|time| time > 3600}
      expect(result).to have_exactly(0).items
    end

    it "returns all cds with a runtime of greater than 60 minutes. If there is a record with no type that record is ignored" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 300,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 600,\"name\": \"two\"},{\"seconds\": 400,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"notype\":\"notype\"}
                        ]"
      result = media.cd_runtime{|time| time > 3600}
      expect(result).to have_exactly(4).items
    end

    it "returns all cds with a runtime of greater than 60 minutes. If a cd has no tracks it is assumed the runtime is 0." do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 300,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 600,\"name\": \"two\"},{\"seconds\": 400,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.cd_runtime{|time| time > 3600}
      expect(result).to have_exactly(4).items
    end

    it "returns all cds with a runtime of greater than 60 minutes. If a cd has a track with no seconds it is assumed that the track's length is 0." do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 300,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 600,\"name\": \"two\"},{\"seconds\": 400,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.cd_runtime{|time| time > 3600}
      expect(result).to have_exactly(4).items
    end

    it "returns all cds with a runtime of greater than 60 minutes. If a cd is missing tracks that cd is skipped." do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 21.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 300,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 22.99,\"tracks\": [{\"seconds\": 1800,\"name\": \"one\"},{\"seconds\": 500,\"name\": \"two\"},{\"seconds\": 600,\"name\": \"two\"},{\"seconds\": 400,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"}
                        ]"
      result = media.cd_runtime{|time| time > 3600}
      expect(result).to have_exactly(4).items
    end
  end

  describe "#people_with_cd_and_book" do
    it "returns all the authors that have written books and released cds." do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"}
                        ]"
      result = media.people_with_cd_and_book
      expect(result).to have_exactly(3).items
    end

    it "returns all the authors that have written books and released cds even when an author has written two books and no cds" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"}
                        ]"
      result = media.people_with_cd_and_book
      expect(result).to have_exactly(3).items
    end

    it "returns no authors if no books or cds are passed in." do
      media = Media.new "[
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"}
                        ]"
      result = media.people_with_cd_and_book
      expect(result).to have_exactly(0).items
    end

    it "returns all the authors that have written books and released cds. If an author is null then that author is skipped" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": null,\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": null,\"type\": \"cd\"}
                        ]"
      result = media.people_with_cd_and_book
      expect(result).to have_exactly(3).items
    end

    it "returns all the authors that have written books and released cds. But it an item with a duplicate author has a null type that author is not returned" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": null},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"}
                        ]"
      result = media.people_with_cd_and_book
      expect(result).to have_exactly(3).items
    end

    it "returns all the authors that have written books and released cds. But if a dvd has an author field that author is not returned" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"author\": \"joan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"}
                        ]"
      result = media.people_with_cd_and_book
      expect(result).to have_exactly(3).items
    end
  end

  describe "#name_with_year" do
    it "returns all the items with a title, track or chapter that contains a year.  A year is defined as any string of digits or a single quote and two digits" do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"1997\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"The summer of '67\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"author\": \"joan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"Year 87, Romans were around\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"}
                        ]"
      result = media.name_with_year
      expect(result).to have_exactly(3).items
    end

    it "returns all the items with a title, track or chapter that contains a year.  If an item has no title, chapters or track names then that record is skipped." do
      media = Media.new "[
                          {\"price\": 1.99,\"chapters\": [\"1997\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"mary\",\"type\": \"book\"},
                          {\"price\": 2.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"fred\",\"type\": \"book\"},
                          {\"price\": 3.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"george\",\"type\": \"book\"},
                          {\"price\": 4.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"peter\",\"type\": \"book\"},
                          {\"price\": 5.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"paul\",\"type\": \"book\"},
                          {\"price\": 6.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"john\",\"type\": \"book\"},
                          {\"price\": 7.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"derek\",\"type\": \"book\"},
                          {\"price\": 8.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"may\",\"type\": \"book\"},
                          {\"price\": 9.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"sarah\",\"type\": \"book\"},
                          {\"price\": 10.99,\"chapters\": [\"one\",\"two\",\"three\"],\"year\": 1999,\"title\": \"foo\",\"author\": \"lisa\",\"type\": \"book\"},
                          {\"price\": 11.99,\"minutes\": 90,\"year\": 2004,\"title\": \"The summer of '67\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 12.99,\"minutes\": 90,\"year\": 2004,\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 13.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 14.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 15.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 16.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 17.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 18.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 19.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"director\": \"alan\",\"type\": \"dvd\"},
                          {\"price\": 20.99,\"minutes\": 90,\"year\": 2004,\"title\": \"bar\",\"author\": \"joan\",\"type\": \"dvd\"},
                          {\"price\": 23.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"Year 87, Romans were around\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"joan\",\"type\": \"cd\"},
                          {\"price\": 24.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"fred\",\"type\": \"cd\"},
                          {\"price\": 25.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"chris\",\"type\": \"cd\"},
                          {\"price\": 26.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"stuart\",\"type\": \"cd\"},
                          {\"price\": 27.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"lisa\",\"type\": \"cd\"},
                          {\"price\": 28.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bill\",\"type\": \"cd\"},
                          {\"price\": 29.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"bob\",\"type\": \"cd\"},
                          {\"price\": 30.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"john\",\"type\": \"cd\"},
                          {\"price\": 31.99,\"tracks\": [{\"seconds\": 180,\"name\": \"one\"},{\"seconds\": 200,\"name\": \"two\"}],\"year\": 2000,\"title\": \"baz\",\"author\": \"harry\",\"type\": \"cd\"}
                        ]"
      result = media.name_with_year
      expect(result).to have_exactly(3).items
    end
  end
end
