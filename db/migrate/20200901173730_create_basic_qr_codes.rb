class CreateBasicQrCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :basic_qr_codes do |t|

      t.timestamps
    end
  end
end
