---
title: "PerformanceLongAnimationFrameTiming: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/PerformanceLongAnimationFrameTiming/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PerformanceLongAnimationFrameTiming.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceLongAnimationFrameTiming")}} là {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng `PerformanceLongAnimationFrameTiming`.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là biểu diễn tuần tự hóa của đối tượng {{domxref("PerformanceLongAnimationFrameTiming")}}.

## Ví dụ

### Sử dụng phương thức `toJSON`

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `PerformanceLongAnimationFrameTiming`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "long-animation-frame", buffered: true });
```

Điều này sẽ ghi lại một đối tượng như sau:

```js
({
  blockingDuration: 0,
  duration: 60,
  entryType: "long-animation-frame",
  firstUIEventTimestamp: 11801.099999999627,
  name: "long-animation-frame",
  renderStart: 11858.800000000745,
  scripts: [
    {
      duration: 45,
      entryType: "script",
      executionStart: 11803.199999999255,
      forcedStyleAndLayoutDuration: 0,
      invoker: "DOMWindow.onclick",
      invokerType: "event-listener",
      name: "script",
      pauseDuration: 0,
      sourceURL: "https://web.dev/js/index-ffde4443.js",
      sourceFunctionName: "myClickHandler",
      sourceCharPosition: 17796,
      startTime: 11803.199999999255,
      window: {
        // …Window object…
      },
      windowAttribution: "self",
    },
  ],
  startTime: 11802.400000000373,
  styleAndLayoutStart: 11858.800000000745,
});
```

Để lấy chuỗi JSON, bạn có thể sử dụng [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{jsxref("JSON")}}
