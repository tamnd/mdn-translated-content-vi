---
title: Clipboard
slug: Web/API/Clipboard
page-type: web-api-interface
browser-compat: api.Clipboard
---

{{APIRef("Clipboard API")}}{{SecureContext_Header}}

Giao diện **`Clipboard`** của [Clipboard API](/en-US/docs/Web/API/Clipboard_API) cung cấp quyền truy cập đọc và ghi vào nội dung của bảng nhớ tạm hệ thống.
Điều này cho phép ứng dụng web triển khai các tính năng cắt, sao chép và dán.

{{InheritanceDiagram}}

Bảng nhớ tạm hệ thống được cung cấp thông qua thuộc tính toàn cục {{domxref("Navigator.clipboard")}}.

Tất cả các phương thức của Clipboard API đều hoạt động bất đồng bộ; chúng trả về một {{jsxref("Promise")}} được giải quyết sau khi việc truy cập bảng nhớ tạm hoàn tất.
Promise sẽ bị từ chối nếu quyền truy cập bảng nhớ tạm không được cấp.

Mọi phương thức đều yêu cầu [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
Các yêu cầu bổ sung khi sử dụng API này được thảo luận trong phần [Lưu ý về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của trang tổng quan API.

## Phương thức thể hiện

_`Clipboard` dựa trên giao diện {{domxref("EventTarget")}} và bao gồm các phương thức của giao diện đó._

- {{domxref("Clipboard.read()","read()")}}
  - : Yêu cầu dữ liệu bất kỳ (chẳng hạn như hình ảnh) từ bảng nhớ tạm, trả về một {{jsxref("Promise")}} được giải quyết với một mảng các đối tượng {{domxref("ClipboardItem")}} chứa nội dung của bảng nhớ tạm.
- {{domxref("Clipboard.readText()","readText()")}}
  - : Yêu cầu văn bản từ bảng nhớ tạm hệ thống, trả về một {{jsxref("Promise")}} được hoàn thành bằng một chuỗi chứa văn bản trên bảng nhớ tạm khi nó sẵn sàng.
- {{domxref("Clipboard.write()","write()")}}
  - : Ghi dữ liệu bất kỳ vào bảng nhớ tạm hệ thống, trả về một {{jsxref("Promise")}} được giải quyết khi thao tác hoàn tất.
- {{domxref("Clipboard.writeText()","writeText()")}}
  - : Ghi văn bản vào bảng nhớ tạm hệ thống, trả về một {{jsxref("Promise")}} được giải quyết sau khi văn bản đã được sao chép hoàn toàn vào bảng nhớ tạm.

## Sự kiện

- {{domxref("Clipboard.clipboardchange_event","clipboardchange")}} {{experimental_inline}}
  - : Được kích hoạt khi nội dung bảng nhớ tạm hệ thống thay đổi theo bất kỳ cách nào, ví dụ thông qua lệnh sao chép của hệ thống hoặc qua một phương thức API như {{domxref("Clipboard.writeText()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.execCommand()")}}
