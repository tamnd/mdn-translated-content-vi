---
title: File and Directory Entries API
slug: Web/API/File_and_Directory_Entries_API
page-type: web-api-overview
browser-compat: api.FileSystem
---

{{DefaultAPISidebar("File and Directory Entries API")}}

File and Directory Entries API cung cấp một cách để xử lý các thư mục và danh sách tệp được cung cấp bởi người dùng thông qua đầu vào biểu mẫu hoặc thao tác kéo thả. Đây là phiên bản nâng cao hơn của [File API](/en-US/docs/Web/API/File), cho phép bạn làm việc với một tệp đơn. Ban đầu API này được thiết kế để hỗ trợ hệ thống tệp ảo đầy đủ, nhưng hiện tại chỉ hỗ trợ các hoạt động đọc trên dữ liệu do người dùng cung cấp.

## Truy cập hệ thống tệp

Có hai cách để truy cập hệ thống tệp được định nghĩa trong bản nháp thông số kỹ thuật hiện tại:

- Khi xử lý sự kiện {{domxref("HTMLElement/drop_event", "drop")}} để kéo thả, bạn có thể gọi {{domxref("DataTransferItem.webkitGetAsEntry()")}} để lấy {{domxref("FileSystemEntry")}} cho một mục được thả.
- Thuộc tính {{domxref("HTMLInputElement.webkitEntries")}} cho phép bạn truy cập các đối tượng {{domxref("FileSystemFileEntry")}} cho các tệp hiện được chọn.

## Lịch sử

File System API gốc được tạo ra để cho phép các trình duyệt triển khai hỗ trợ truy cập hệ thống tệp ảo trên thiết bị lưu trữ của người dùng. Công việc chuẩn hóa thông số kỹ thuật đã bị từ bỏ vào năm 2012, nhưng đến thời điểm đó, Google Chrome đã có triển khai riêng của API. Theo thời gian, một số trang web và ứng dụng web phổ biến đã sử dụng nó. Mozilla thay vào đó đã triển khai các API khác có thể giải quyết nhiều vấn đề tương tự, chẳng hạn như [IndexedDB](/en-US/docs/Web/API/IndexedDB_API).

Do đó, một số trang web phổ biến không hoạt động đúng trên các trình duyệt khác ngoài Chrome. Để giải quyết vấn đề đó, các tính năng của Google API mà đạt được sự đồng thuận đã được chuẩn hóa thành File and Directory Entries API và sau đó được triển khai trong các trình duyệt khác.

## Giao diện

File and Directory Entries API bao gồm các giao diện sau:

- {{domxref("FileSystem")}}
  - : Đại diện cho hệ thống tệp.
- {{domxref("FileSystemEntry")}}
  - : Giao diện cơ bản đại diện cho một mục duy nhất trong hệ thống tệp.
- {{domxref("FileSystemFileEntry")}}
  - : Đại diện cho một tệp đơn lẻ trong hệ thống tệp.
- {{domxref("FileSystemDirectoryEntry")}}
  - : Đại diện cho một thư mục đơn lẻ trong hệ thống tệp.
- {{domxref("FileSystemDirectoryReader")}}
  - : Được tạo bởi việc gọi {{domxref("FileSystemDirectoryEntry.createReader()")}}, giao diện này cung cấp chức năng đọc nội dung của thư mục.

### Mở rộng cho các giao diện khác

- {{domxref("DataTransferItem.webkitGetAsEntry()")}}
  - : Trả về đối tượng dựa trên {{domxref("FileSystemEntry")}} đại diện cho mục của tệp được chọn trong hệ thống tệp của nó.
- {{domxref("File.webkitRelativePath")}}
  - : Trả về đường dẫn mà URL của `File` là tương đối so với nó.
- {{domxref("HTMLInputElement.webkitdirectory")}}
  - : Boolean đại diện cho thuộc tính [`webkitdirectory`](/en-US/docs/Web/HTML/Reference/Elements/input#webkitdirectory). Nếu là `true`, giao diện chọn tệp chỉ chấp nhận thư mục thay vì tệp.
- {{domxref("HTMLInputElement.webkitEntries")}}
  - : Mô tả các tệp hoặc thư mục hiện đang được chọn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
