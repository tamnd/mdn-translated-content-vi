---
title: MimeType
slug: Web/API/MimeType
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.MimeType
---

{{APIRef("HTML DOM")}}{{Deprecated_Header}}

Giao diện **`MimeType`** chứa thông tin về loại MIME được liên kết với một plugin cụ thể. {{domxref("Navigator.mimeTypes")}} trả về một mảng đối tượng này.

## Thuộc tính phiên bản

- {{domxref("MimeType.type")}} {{Deprecated_Inline}}
  - : Trả về loại MIME của plugin liên kết.
- {{domxref("MimeType.description")}} {{Deprecated_Inline}}
  - : Trả về mô tả của plugin liên kết hoặc một chuỗi trống nếu không có.
- {{domxref("MimeType.suffixes")}} {{Deprecated_Inline}}
  - : Chuỗi chứa các phần mở rộng tệp hợp lệ cho dữ liệu được hiển thị bởi plugin, hoặc một chuỗi trống nếu phần mở rộng không hợp lệ cho module cụ thể.
- {{domxref("MimeType.enabledPlugin")}} {{Deprecated_Inline}}
  - : Trả về một thể hiện của {{domxref("Plugin")}} chứa thông tin về plugin đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
