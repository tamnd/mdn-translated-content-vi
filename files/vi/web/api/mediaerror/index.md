---
title: MediaError
slug: Web/API/MediaError
page-type: web-api-interface
browser-compat: api.MediaError
---

{{APIRef("HTML DOM")}}

Giao diện **`MediaError`** đại diện cho lỗi xảy ra trong khi xử lý phương tiện trong phần tử phương tiện HTML dựa trên {{domxref("HTMLMediaElement")}}, chẳng hạn như {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.

Đối tượng `MediaError` mô tả lỗi theo thuật ngữ chung sử dụng `code` số phân loại loại lỗi, và `message` cung cấp thông tin chẩn đoán cụ thể về những gì đã xảy ra sai.

## Thuộc tính phiên bản

_Giao diện này không kế thừa bất kỳ thuộc tính nào._

- {{domxref("MediaError.code")}}
  - : Số đại diện cho [loại lỗi chung đã xảy ra](/en-US/docs/Web/API/MediaError/code#media_error_code_constants).
- {{domxref("MediaError.message")}}
  - : Chuỗi mà con người có thể đọc cung cấp _thông tin chẩn đoán cụ thể_ để giúp người đọc hiểu tình trạng lỗi đã xảy ra; cụ thể, nó không phải là tóm tắt về ý nghĩa của mã lỗi, mà là thông tin chẩn đoán thực tế để giúp hiểu chính xác những gì đã xảy ra sai. Văn bản này và định dạng của nó không được định nghĩa bởi đặc tả và sẽ khác nhau giữa các {{Glossary("user agent")}}. Nếu không có chẩn đoán nào có sẵn, hoặc không thể cung cấp giải thích, giá trị này là chuỗi rỗng (`""`).

## Phương thức phiên bản

_Giao diện này không triển khai hoặc kế thừa bất kỳ phương thức nào và không có phương thức riêng._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement.error")}}
