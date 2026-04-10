---
title: "WebTransport: thuộc tính reliability"
short-title: reliability
slug: Web/API/WebTransport/reliability
page-type: web-api-instance-property
browser-compat: api.WebTransport.reliability
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`reliability`** của giao diện {{domxref("WebTransport")}} cho biết kết nối chỉ hỗ trợ các transport đáng tin cậy hay còn hỗ trợ cả transport không đáng tin cậy, như UDP.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `pending`
  - : Kết nối vẫn chưa được thiết lập.
    Độ tin cậy chưa được biết.
- `reliable-only`
  - : Kết nối chỉ hỗ trợ các transport đáng tin cậy.
- `supports-unreliable`
  - : Kết nối hỗ trợ cả transport không đáng tin cậy và đáng tin cậy.

## Ví dụ

```js
const url = "https://example.com:4999/wt";

async function initTransport(url) {
  // Khởi tạo kết nối transport
  const transport = new WebTransport(url);

  // Khi ready được giải quyết thì kết nối có thể dùng được
  // Trước đó reliability là "pending"
  await transport.ready;

  if (transport.reliability === "reliable-only") {
    // Chỉ dùng kết nối với các transport đáng tin cậy
  } else {
    // Dùng kết nối với transport đáng tin cậy hoặc không đáng tin cậy.
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
