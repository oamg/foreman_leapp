# frozen_string_literal: true

module Api
  module V2
    class PreupgradeReportsController < ::Api::V2::BaseController
      api :GET, '/preupgrade_reports/', N_('List Preupgrade reports')
      param_group :search_and_pagination, ::Api::V2::BaseController
      def index
        @preupgrade_reports = resource_scope_for_index
      end

      api :GET, '/job_invocations/:id/preupgrade_report', N_('Show Preupgrade report')
      param :id, :identifier, required: true
      def show
        @preupgrade_report = PreupgradeReport.find_by(job_invocation_id: params[:id])
      end
    end
  end
end
