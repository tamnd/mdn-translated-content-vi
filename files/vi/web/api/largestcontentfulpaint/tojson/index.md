---
title: "LargestContentfulPaint: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/LargestContentfulPaint/toJSON
page-type: web-api-instance-method
browser-compat: api.LargestContentfulPaint.toJSON
---

{{APIRef("Performance API")}}

Phương thức **`toJSON()`** của giao diện {{domxref("LargestContentfulPaint")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("LargestContentfulPaint")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là bản tuần tự hóa của đối tượng {{domxref("LargestContentfulPaint")}}.

JSON không chứa thuộc tính {{domxref("LargestContentfulPaint.element", "element")}} vì nó có kiểu {{domxref("Element")}}, vốn không cung cấp thao tác `toJSON()`.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `LargestContentfulPaint`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "largest-contentful-paint", buffered: true });
```

Điều này sẽ ghi nhật ký một đối tượng JSON như sau:

```json
{
  "name": "",
  "entryType": "largest-contentful-paint",
  "startTime": 468.2,
  "duration": 0,
  "size": 19824,
  "renderTime": 468.2,
  "loadTime": 0,
  "id": "",
  "url": ""
}
```

Để lấy chuỗi JSON, bạn có thể dùng [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
