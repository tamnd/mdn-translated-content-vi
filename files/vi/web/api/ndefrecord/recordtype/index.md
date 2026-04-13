---
title: "NDEFRecord: thuộc tính recordType"
short-title: recordType
slug: Web/API/NDEFRecord/recordType
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NDEFRecord.recordType
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Thuộc tính **`recordType`** của giao diện {{DOMxRef("NDEFRecord")}} trả về loại bản ghi của bản ghi.

## Giá trị

Một chuỗi có thể là một trong các giá trị sau:

- `"empty"`
  - : Một bản ghi NDEF rỗng.
- `"text"`
  - : Một bản ghi NDEF văn bản.
- `"url"`
  - : Một bản ghi NDEF URI.
- `"smart-poster"`
  - : Một bản ghi NDEF "smart poster".
- `"absolute-url"`
  - : Một bản ghi NDEF URL tuyệt đối.
- `"mime"`
  - : Một bản ghi NDEF {{Glossary("MIME type")}}.
- `"unknown"`
  - : Loại bản ghi NDEF không được biết.
- tên loại cục bộ
  - : Đại diện cho tên loại cục bộ, thường được dùng để chỉ định bản ghi NDEF được nhúng trong bản ghi khác.
- tên loại bên ngoài
  - : Một chuỗi tùy chỉnh bao gồm tên miền và tên loại tùy chỉnh được phân tách bằng dấu hai chấm (":").

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
