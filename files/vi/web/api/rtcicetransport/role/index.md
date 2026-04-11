---
title: "RTCIceTransport: thuộc tính role"
short-title: role
slug: Web/API/RTCIceTransport/role
page-type: web-api-instance-property
browser-compat: api.RTCIceTransport.role
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`role`** của giao diện {{domxref("RTCIceTransport")}} cho biết vai trò {{Glossary("ICE")}} mà truyền tải đang thực hiện: vai trò của tác nhân kiểm soát hay tác nhân bị kiểm soát.

Bạn có thể tìm hiểu thêm về vai trò ICE trong [Chọn cặp ứng cử viên](/en-US/docs/Web/API/WebRTC_API/Connectivity#choosing_a_candidate_pair).

## Giá trị

Một chuỗi xác định liệu {{domxref("RTCIceTransport")}} đại diện cho tác nhân kiểm soát hay tác nhân bị kiểm soát.

Giá trị phải là một trong những giá trị sau:

- `"controlled"`
  - : Truyền tải là tác nhân bị kiểm soát.
- `"controlling"`
  - : Đối tượng {{domxref("RTCIceTransport")}} đang đóng vai trò là tác nhân kiểm soát.
- `"unknown"`
  - : Vai trò chưa được xác định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
