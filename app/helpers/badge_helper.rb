module BadgeHelper
  def badge_header(badge)
    if badge.new_record?
      t('helpers.badge.header.create')
    else
      t('helpers.badge.header.edit', title: badge.title)
    end
  end

  def condition_title(condition)
    t("helpers.badge.conditions.#{condition}")
  end

  def conditions_list
    AchievementService::CONDITIONS.map { |c| [condition_title(c), c] }
  end
end
