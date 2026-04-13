---
title: StaticRange
slug: Web/API/StaticRange
page-type: web-api-interface
browser-compat: api.StaticRange
---

{{APIRef("DOM")}}

Giao diện **`StaticRange`** của [DOM](/en-US/docs/Web/API/Document_Object_Model) mở rộng {{domxref("AbstractRange")}} để cung cấp một phương thức chỉ định một phạm vi nội dung trong DOM mà nội dung của nó không cập nhật để phản ánh các thay đổi xảy ra trong cây DOM.

Giao diện này cung cấp cùng tập hợp các thuộc tính và phương thức như `AbstractRange`.

`AbstractRange` và `StaticRange` không khả dụng từ [web workers](/en-US/docs/Web/API/Web_Workers_API).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("StaticRange.StaticRange", "StaticRange()")}}
  - : Tạo một đối tượng `StaticRange` mới với các tùy chọn chỉ định các giá trị mặc định cho các thuộc tính của nó.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("AbstractRange")}}._

## Ghi chú sử dụng

Một phạm vi DOM xác định một khoảng nội dung trong tài liệu, có thể bắt đầu bên trong một nút (hoặc phần tử) và kết thúc bên trong một nút khác. Không giống như {{domxref("Range")}}, `StaticRange` đại diện cho một phạm vi được cố định tại một thời điểm; nó không thay đổi để cố gắng giữ cùng một nội dung khi tài liệu thay đổi. Nếu có bất kỳ thay đổi nào được thực hiện trong DOM, dữ liệu thực sự có trong phạm vi được chỉ định bởi `StaticRange` có thể thay đổi. Điều này cho phép {{Glossary("user agent")}} tránh nhiều công việc không cần thiết nếu ứng dụng web hoặc trang web không cần một phạm vi cập nhật theo thời gian thực.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phạm vi nội dung cập nhật theo thời gian thực trong DOM: {{domxref("Range")}}
- {{domxref("AbstractRange")}}, giao diện trừu tượng mà từ đó tất cả các phạm vi được dẫn xuất
