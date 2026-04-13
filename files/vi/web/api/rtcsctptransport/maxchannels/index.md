---
title: "RTCSctpTransport: thuộc tính maxChannels"
short-title: maxChannels
slug: Web/API/RTCSctpTransport/maxChannels
page-type: web-api-instance-property
browser-compat: api.RTCSctpTransport.maxChannels
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`maxChannels`** của giao diện {{DOMxRef("RTCSctpTransport")}} cho biết số lượng tối đa các đối tượng {{DOMxRef("RTCDataChannel")}} có thể mở đồng thời.

## Giá trị

Một giá trị số nguyên cho biết số lượng tối đa các đối tượng {{DOMxRef("RTCDataChannel")}} có thể mở đồng thời, hoặc `null` trước khi giao thức truyền tải SCTP chuyển sang [trạng thái](/en-US/docs/Web/API/RTCSctpTransport/state) "connected".

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
