---
title: "LayoutShift: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/LayoutShift/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.LayoutShift.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("LayoutShift")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("LayoutShift")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là sự tuần tự hóa của đối tượng {{domxref("LayoutShift")}}.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `LayoutShift`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "layout-shift", buffered: true });
```

Điều này sẽ ghi lại một đối tượng JSON như sau:

```json
{
  "name": "",
  "entryType": "layout-shift",
  "startTime": 246.39999999850988,
  "duration": 0,
  "value": 0.0071167845054842215,
  "hadRecentInput": false,
  "lastInputTime": 0,
  "sources": [
    {
      "previousRect": {
        "x": 917,
        "y": 708,
        "width": 706,
        "height": 248,
        "top": 708,
        "right": 1623,
        "bottom": 956,
        "left": 917
      },
      "currentRect": {
        "x": 693,
        "y": 708,
        "width": 1154,
        "height": 472,
        "top": 708,
        "right": 1847,
        "bottom": 1180,
        "left": 693
      }
    }
  ]
}
```

Để lấy chuỗi JSON, bạn có thể dùng [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ gọi `toJSON()` tự động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
