---
title: ErrorEvent
slug: Web/API/ErrorEvent
page-type: web-api-interface
browser-compat: api.ErrorEvent
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Giao diện **`ErrorEvent`** đại diện cho các sự kiện cung cấp thông tin liên quan đến lỗi trong các script hoặc tệp.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ErrorEvent.ErrorEvent", "ErrorEvent()")}}
  - : Tạo một sự kiện `ErrorEvent` với các tham số được cho.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ lớp cha {{domxref("Event")}}_.

- {{domxref("ErrorEvent.message")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa thông báo lỗi có thể đọc được mô tả sự cố.
- {{domxref("ErrorEvent.filename")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa tên của tệp script trong đó xảy ra lỗi.
- {{domxref("ErrorEvent.lineno")}} {{ReadOnlyInline}}
  - : Một số nguyên chứa số dòng của tệp script nơi xảy ra lỗi.
- {{domxref("ErrorEvent.colno")}} {{ReadOnlyInline}}
  - : Một số nguyên chứa số cột của tệp script nơi xảy ra lỗi.
- {{domxref("ErrorEvent.error")}} {{ReadOnlyInline}}
  - : Một giá trị JavaScript, chẳng hạn {{jsxref("Error")}} hoặc {{domxref("DOMException")}}, đại diện cho lỗi liên kết với sự kiện này.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha {{domxref("Event")}}_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers), các đối tượng có khả năng kích hoạt sự kiện này nhất.
- {{domxref("Window")}}: sự kiện {{domxref("Window/error_event", "error")}}
- {{domxref("Navigation")}}: sự kiện {{domxref("Navigation/navigateerror_event", "navigateerror")}}
