---
title: "Request: thuộc tính signal"
short-title: signal
slug: Web/API/Request/signal
page-type: web-api-instance-property
browser-compat: api.Request.signal
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`signal`** của giao diện {{DOMxRef("Request")}} trả về {{domxref("AbortSignal")}} liên kết với request.

## Giá trị

Một đối tượng {{DOMxRef("AbortSignal")}}.

## Ví dụ

```js
// Tạo một abort controller mới
const controller = new AbortController();

// Tạo một request với đối tượng AbortSignal của controller này
const req = new Request("/", { signal: controller.signal });

// Thêm một event handler ghi log trong trường hợp bị abort
req.signal.addEventListener("abort", () => {
  console.log("abort");
});

// Trong trường hợp bị abort, ghi lại AbortSignal reason nếu có
fetch(req).catch(() => {
  if (req.signal.aborted) {
    if (req.signal.reason) {
      console.log(`Request aborted with reason: ${req.signal.reason}`);
    } else {
      console.log("Request aborted but no reason was given.");
    }
  } else {
    console.log("Request not aborted, but terminated abnormally.");
  }
});

// Thực sự abort request
controller.abort();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
