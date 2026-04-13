---
title: NDEFRecord
slug: Web/API/NDEFRecord
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NDEFRecord
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Giao diện **`NDEFRecord`** của [Web NFC API](/en-US/docs/Web/API/Web_NFC_API) cung cấp dữ liệu có thể được đọc từ, hoặc ghi vào, các thiết bị NFC tương thích, ví dụ: các thẻ NFC hỗ trợ NDEF.

## Hàm khởi tạo

- {{DOMxRef("NDEFRecord.NDEFRecord", "NDEFRecord()")}} {{Experimental_Inline}}
  - : Trả về một `NDEFRecord` mới.

## Thuộc tính phiên bản

- {{DOMxRef("NDEFRecord.recordType")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về loại bản ghi của bản ghi. Các bản ghi phải có tên loại đã biết tiêu chuẩn như `"empty"`, `"text"`, `"url"`, `"smart-poster"`, `"absolute-url"`, `"mime"` hoặc `"unknown"` hoặc tên loại bên ngoài, bao gồm tên miền và tên loại tùy chỉnh được phân tách bằng dấu hai chấm (":").
- {{DOMxRef("NDEFRecord.mediaType")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về {{Glossary("MIME type")}} của bản ghi. Giá trị này sẽ là `null` nếu `recordType` không bằng `"mime"`.
- {{DOMxRef("NDEFRecord.id")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về định danh bản ghi, là URL tuyệt đối hoặc tương đối dùng để xác định bản ghi.
    > [!NOTE]
    > Tính duy nhất của định danh chỉ được thực thi bởi trình tạo bản ghi.
- {{DOMxRef("NDEFRecord.data")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("DataView")}} chứa các byte thô của tải trọng bản ghi.
- {{DOMxRef("NDEFRecord.encoding")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về mã hóa của tải trọng văn bản, hoặc `null` nếu không phải.
- {{DOMxRef("NDEFRecord.lang")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về ngôn ngữ của tải trọng văn bản, hoặc `null` nếu không được cung cấp.

## Phương thức phiên bản

- {{DOMxRef("NDEFRecord.toRecords", "NDEFRecord.toRecords()")}} {{Experimental_Inline}}
  - : Chuyển đổi {{DOMxRef("NDEFRecord.data")}} thành chuỗi các bản ghi. Điều này cho phép phân tích các tải trọng của các loại bản ghi có thể chứa bản ghi lồng nhau, chẳng hạn như smart poster và bản ghi loại bên ngoài.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
