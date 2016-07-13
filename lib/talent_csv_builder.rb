#-*- coding: utf-8 -*-
module TalentCsvBuilder
  class TalentRecord < BaseCsvBuilder::BaseRecord
    FIELDS = [
      [:code, "ＩＤ"],
      [:name, "名前"],
      [:name_kana, "ふりがな"],
      [:category_id, "カテゴリ"]
    ]
    define_field_attr_accessor

    def initialize
      @code = ""
      @name = ""
      @name_kana = ""
      @category_id = ""
    end
  end

  class TalentCsvOutput < BaseCsvBuilder::BaseCsvOutput
    @@params = {}

    def setParam (att, val)
      @@params[att] = val
    end

    def output(talents)
      @records << TalentRecord.header

      if talents != nil
        talents.each do |talent|
          record = TalentRecord.new

          record.code = talent.code
          record.name = talent.name
          record.name_kana = talent.name_kana
          record.category_id = @@params['category_list'][talent.category_id]

          @records << record.to_csv
        end
      end

      @records.join("\n")
    end
  end
end
