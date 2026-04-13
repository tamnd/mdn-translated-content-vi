---
title: "MediaDeviceInfo: thuộc tính label"
short-title: label
slug: Web/API/MediaDeviceInfo/label
page-type: web-api-instance-property
browser-compat: api.MediaDeviceInfo.label
---

{{APIRef("Media Capture and Streams")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("MediaDeviceInfo")}} trả về một chuỗi mô tả thiết bị này (ví dụ "External USB Webcam").

Chỉ khả dụng trong khi đang sử dụng `MediaStream` đang hoạt động, hoặc khi đã cấp quyền lâu dài.

## Giá trị

Một chuỗi mô tả thiết bị media. Vì lý do bảo mật, `label` luôn là chuỗi rỗng (`""`) nếu người dùng chưa được cấp quyền sử dụng ít nhất một thiết bị media, bằng cách bắt đầu stream từ microphone hoặc camera, hoặc bằng cách cấp quyền lâu dài.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
