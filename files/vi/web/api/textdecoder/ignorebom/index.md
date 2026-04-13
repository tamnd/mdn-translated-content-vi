---
title: "TextDecoder: ignoreBOM property"
short-title: ignoreBOM
slug: Web/API/TextDecoder/ignoreBOM
page-type: web-api-instance-property
browser-compat: api.TextDecoder.ignoreBOM
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ignoreBOM`** của giao diện {{domxref("TextDecoder")}} là một {{jsxref('Boolean')}} cho biết [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) sẽ được đưa vào đầu ra hay bị bỏ qua. Giá trị của thuộc tính được đặt trong đối số [`ignoreBOM`](/en-US/docs/Web/API/TextDecoder/TextDecoder#ignorebom) của hàm tạo bộ giải mã.

## Giá trị

`true` nếu [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) sẽ được đưa vào văn bản đã giải mã; `false` nếu nó sẽ bị bỏ qua khi giải mã và không được đưa vào kết quả.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
