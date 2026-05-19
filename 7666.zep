interface Leave {
  id: string
  service_code: string
  leave_start_date: string
  leave_end_date: string
  leave_duration_days: number
  status: string
  created_at: string
}

interface LeaveTableProps {
  leaves: Leave[]
}

export default function LeaveTable({ leaves }: LeaveTableProps) {
  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'approved':
        return <span className="px-2 py-1 bg-green-100 text-green-800 rounded-full text-sm">موافقة</span>
      case 'rejected':
        return <span className="px-2 py-1 bg-red-100 text-red-800 rounded-full text-sm">مرفوضة</span>
      default:
        return <span className="px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full text-sm">قيد المراجعة</span>
    }
  }

  if (leaves.length === 0) {
    return (
      <div className="bg-white rounded-lg shadow p-8 text-center">
        <p className="text-gray-500">لا توجد إجازات لعرضها</p>
      </div>
    )
  }

  return (
    <div className="bg-white rounded-lg shadow overflow-hidden">
      <div className="overflow-x-auto">
        <table className="min-w-full divide-y divide-gray-200">
          <thead className="bg-gray-50">
            <tr>
              <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                رمز الخدمة
              </th>
              <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                تاريخ البدء
              </th>
              <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                تاريخ النهاية
              </th>
              <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                المدة
              </th>
              <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                الحالة
              </th>
              <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                تاريخ الطلب
              </th>
             </tr>
          </thead>
          <tbody className="bg-white divide-y divide-gray-200">
            {leaves.map((leave) => (
              <tr key={leave.id} className="hover:bg-gray-50">
                <td className="px-6 py-4 whitespace-nowrap text-sm font-medium">
                  {leave.service_code}
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm">
                  {new Date(leave.leave_start_date).toLocaleDateString('ar-EG')}
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm">
                  {new Date(leave.leave_end_date).toLocaleDateString('ar-EG')}
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm">
                  {leave.leave_duration_days} يوم
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  {getStatusBadge(leave.status)}
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm">
                  {new Date(leave.created_at).toLocaleDateString('ar-EG')}
                </td>
              