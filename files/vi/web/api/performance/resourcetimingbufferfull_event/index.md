---
title: "Performance: resourcetimingbufferfull event"
short-title: resourcetimingbufferfull
slug: Web/API/Performance/resourcetimingbufferfull_event
page-type: web-api-event
browser-compat: api.Performance.resourcetimingbufferfull_event
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Sự kiện `resourcetimingbufferfull` được phát ra khi [bộ đệm resource timing](/en-US/docs/Web/API/Performance/setResourceTimingBufferSize) của trình duyệt đầy.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("resourcetimingbufferfull", (event) => { })

onresourcetimingbufferfull = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Tăng kích thước khi bộ đệm đầy

Ví dụ sau lắng nghe sự kiện `resourcetimingbufferfull` và tăng kích thước bộ đệm bằng phương thức {{domxref("Performance.setResourceTimingBufferSize", "setResourceTimingBufferSize()")}}.

```js
function increaseFilledBufferSize(event) {
  console.log(
    "WARNING: Resource Timing Buffer is FULL! Increasing buffer size to 500.",
  );
  performance.setResourceTimingBufferSize(500);
}

performance.addEventListener(
  "resourcetimingbufferfull",
  increaseFilledBufferSize,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.clearResourceTimings()")}}
- {{domxref("Performance.setResourceTimingBufferSize()")}}
