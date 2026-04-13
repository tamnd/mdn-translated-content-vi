---
title: Web NFC API
slug: Web/API/Web_NFC_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.NDEFReader
---

{{DefaultAPISidebar("Web NFC API")}}{{SeeCompatTable}}

Web NFC API cho phép trao đổi dữ liệu qua NFC bằng các thông điệp NDEF (NFC Data Exchange Format) gọn nhẹ.

> [!NOTE]
> Thiết bị và thẻ phải được định dạng và ghi riêng để hỗ trợ định dạng bản ghi NDEF khi dùng với Web NFC. Hiện tại API chưa hỗ trợ các thao tác mức thấp, tuy nhiên đang có thảo luận công khai về một API sẽ bổ sung chức năng đó.

## Giao diện

- {{DOMxRef("NDEFMessage")}}
  - : Giao diện đại diện cho các thông điệp NDEF có thể được nhận từ hoặc gửi tới một thẻ tương thích thông qua đối tượng `NDEFReader`. Một thông điệp gồm siêu dữ liệu và các NDEF Record.
- {{DOMxRef("NDEFReader")}} {{Experimental_Inline}}
  - : Giao diện cho phép đọc và ghi thông điệp từ các thẻ NFC tương thích. Các thông điệp được biểu diễn dưới dạng đối tượng `NDEFMessage`.
- {{DOMxRef("NDEFRecord")}}
  - : Giao diện đại diện cho các bản ghi NDEF có thể được đưa vào một thông điệp NDEF.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
