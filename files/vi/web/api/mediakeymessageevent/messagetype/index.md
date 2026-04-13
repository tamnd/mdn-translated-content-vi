---
title: MediaKeyMessageEvent.messageType
slug: Web/API/MediaKeyMessageEvent/messageType
page-type: web-api-instance-property
browser-compat: api.MediaKeyMessageEvent.messageType
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`messageType`** của giao diện {{domxref("MediaKeyMessageEvent")}} trả về loại tin nhắn, giúp ứng dụng xác định cách phản hồi với tin nhắn.

## Giá trị

Chuỗi. Một trong:

- `"license-request"` (yêu cầu giấy phép)
- `"license-renewal"` (gia hạn giấy phép)
- `"license-release"` (giải phóng giấy phép)
- `"individualization-request"` (yêu cầu cá nhân hóa)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
