# frozen_string_literal: true

module ForemanLeapp
  module TemplateHelper
    def build_remediation_plan(remediation_ids, host)
      PreupgradeReportEntry.remediation_details(remediation_ids, host)
                           .reject { |e| e['remediations'].nil? }
                           .map { |e| e['remediations'] }
                           .flatten
                           .select { |r| r['type'] == 'command' }
                           .map { |r| "#{r['context'].join(' ')}\n" }
                           .join('')
    end
  end
end
