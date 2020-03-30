# frozen_string_literal: true

class PreupgradeReport < ::Report
  belongs_to :job_invocation
  has_many :preupgrade_report_entries, dependent: :destroy

  def self.create_report(host, data, job_invocation)
    report = PreupgradeReport.create(host: host, status: 0,
                                     job_invocation: job_invocation,
                                     reported_at: DateTime.now.utc)

    data['entries']&.each do |entry|
      PreupgradeReportEntry.create! preupgrade_report: report, host_id: host.id, hostname: host.name,
                                    title: entry['title'], actor: entry['actor'], audience: entry['audience'],
                                    severity: entry['severity'], leapp_run_id: data['leapp_run_id'],
                                    summary: entry['summary'], tags: entry['tags'].join(','),
                                    detail: entry['detail']&.to_json
    end
  end
end
