class DatMilestone < ActiveRecord::Base

  #########################
  # 関連定義
  #########################
  # プロジェクト構成データに所有される(1:1)
  belongs_to :dat_projectcomp, :foreign_key => "project_tree_id"

  #
  #=== テンプレートデータから属性値をコピーする
  #
  #指定されたテンプレートデータ(TPマイルストーンマスタ）から
  #属性値をコピーする。
  #
  def copyFromTemplate(template)
    self.attributes.each_pair do | key, value |
      case key.to_s
      when "create_user_id"
      when "created_on"
      when "update_user_id"
      when "updated_on"
      else
        if ! template[key.to_s].nil?
          self[key.to_s] = template[key.to_s]
        end
      end
    end
  end

end
