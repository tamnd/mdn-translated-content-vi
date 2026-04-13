---
title: "RTCSctpTransport: thuộc tính state"
short-title: state
slug: Web/API/RTCSctpTransport/state
page-type: web-api-instance-property
browser-compat: api.RTCSctpTransport.state
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{DOMxRef("RTCSctpTransport")}} cung cấp thông tin mô tả trạng thái giao thức truyền tải Stream Control Transmission Protocol ({{Glossary("SCTP")}}).

## Giá trị

Một chuỗi có giá trị là một trong các giá trị sau:

- `connecting`
  - : Trạng thái ban đầu khi kết nối đang được thiết lập.
- `connected`
  - : Kết nối đang mở để truyền dữ liệu.
- `closed`
  - : Kết nối đã đóng và không còn có thể sử dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("RTCSctpTransport")}}
