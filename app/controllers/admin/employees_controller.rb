module Admin
    class EmployeesController < ApiController
      def index
        @employees = Employee.all
      end

      def show
        @employee = Employee.find(params[:id])
      end
  
      def update
        @employee = Employee.find(params[:id])
        @employee.attributes = employee_params
        save_employee!
      end
  
      def create
        @employee = Employee.new(employee_params)
        save_employee!
      end

      private
  
      def save_employee!
        @employee.save!
        render :show
      rescue
        render_error fields: @employee.errors.messages
      end
  
      def employee_params
        params.require(:employee).permit(:name, :type_profile, :email, :password, :status)
      end
    end
  end
  