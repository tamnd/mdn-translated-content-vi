---
title: "PerformanceScriptTiming: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformanceScriptTiming/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceScriptTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng `PerformanceScriptTiming`.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là dạng tuần tự hóa của đối tượng {{domxref("PerformanceScriptTiming")}}.

## Ví dụ

### Sử dụng phương thức `toJSON`

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `PerformanceScriptTiming` đầu tiên có sẵn trong một khung hoạt hình dài được quan sát.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.scripts[0].toJSON());
  });
});

observer.observe({ type: "long-animation-frame", buffered: true });
```

Kết quả sẽ là một đối tượng như sau:

```js
({
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
  windowAttribution: "self",
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
