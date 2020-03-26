# frozen_string_literal: true

class PreupgradeReportEntry < ApplicationRecord
  belongs_to :preupgrade_report
  validates :preupgrade_report, :host_id, :hostname, :title, :actor, :audience, :severity, :leapp_run_id, presence: true
end
