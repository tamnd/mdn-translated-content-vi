---
title: "RTCIceTransport: thuộc tính component"
short-title: component
slug: Web/API/RTCIceTransport/component
page-type: web-api-instance-property
browser-compat: api.RTCIceTransport.component
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`component`** của giao diện {{domxref("RTCIceTransport")}} xác định liệu đối tượng có đang phục vụ để truyền tải {{Glossary("RTP")}} hay {{Glossary("RTCP")}} không.

## Giá trị

Một chuỗi là một trong các giá trị sau:

- `rtp`
  - : Xác định một truyền tải ICE đang được sử dụng cho [Giao thức Truyền tải Thời gian thực](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP) (RTP), hoặc cho RTP được ghép kênh với Giao thức Kiểm soát RTP (RTCP). RTP được định nghĩa trong {{RFC(3550)}}. Giá trị này tương ứng với trường ID thành phần trong dòng `candidate` a-line với giá trị 1.
- `rtcp`
  - : Xác định một truyền tải ICE đang được sử dụng cho RTCP, được định nghĩa trong {{RFC(3550, "", 6)}}. Giá trị này tương ứng với ID thành phần 2.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
