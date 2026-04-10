---
title: Clipboard
slug: Web/API/Clipboard
page-type: web-api-interface
browser-compat: api.Clipboard
---

{{APIRef("Clipboard API")}}{{SecureContext_Header}}

Giao diện **`Clipboard`** của [API Clipboard](/en-US/docs/Web/API/Clipboard_API) cung cấp khả năng đọc và ghi vào nội dung của clipboard hệ thống.
Điều này cho phép ứng dụng web triển khai các tính năng cắt, sao chép và dán.

{{InheritanceDiagram}}

Clipboard hệ thống được truy cập thông qua thuộc tính toàn cục {{domxref("Navigator.clipboard")}}.

Tất cả các phương thức của Clipboard API hoạt động bất đồng bộ; chúng trả về một {{jsxref("Promise")}} sẽ được phân giải khi việc truy cập clipboard hoàn tất.
Promise sẽ bị từ chối nếu việc truy cập clipboard bị từ chối.

Tất cả các phương thức đều yêu cầu [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
Các yêu cầu bổ sung để sử dụng API được thảo luận trong phần [Consideration về bảo mật](/en-US/docs/Web/API/Clipboard_API#security_considerations) của chủ đề tổng quan API.

## Phương thức instance

_`Clipboard` dựa trên giao diện {{domxref("EventTarget")}}, và bao gồm các phương thức của nó._

- {{domxref("Clipboard.read()","read()")}}
  - : Yêu cầu dữ liệu tùy ý (chẳng hạn như hình ảnh) từ clipboard, trả về một {{jsxref("Promise")}} phân giải với mảng các đối tượng {{domxref("ClipboardItem")}} chứa nội dung của clipboard.
- {{domxref("Clipboard.readText()","readText()")}}
  - : Yêu cầu văn bản từ clipboard hệ thống, trả về một {{jsxref("Promise")}} được phân giải với chuỗi chứa văn bản của clipboard khi nó sẵn sàng.
- {{domxref("Clipboard.write()","write()")}}
  - : Ghi dữ liệu tùy ý vào clipboard hệ thống, trả về một {{jsxref("Promise")}} phân giải khi thao tác hoàn tất.
- {{domxref("Clipboard.writeText()","writeText()")}}
  - : Ghi văn bản vào clipboard hệ thống, trả về một {{jsxref("Promise")}} được phân giải khi văn bản đã được sao chép hoàn toàn vào clipboard.

## Sự kiện

- {{domxref("Clipboard.clipboardchange_event","clipboardchange")}} {{experimental_inline}}
  - : Được kích hoạt khi nội dung clipboard hệ thống thay đổi theo bất kỳ cách nào, ví dụ qua lệnh sao chép của hệ thống, hoặc qua phương thức API như {{domxref("Clipboard.writeText()")}}.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.execCommand()")}}
