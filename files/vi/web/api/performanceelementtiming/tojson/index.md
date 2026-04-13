---
title: "PerformanceElementTiming: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformanceElementTiming/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PerformanceElementTiming.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceElementTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceElementTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là dạng tuần tự hóa của đối tượng {{domxref("PerformanceElementTiming")}}.

JSON không chứa thuộc tính {{domxref("PerformanceElementTiming.element", "element")}} vì nó thuộc kiểu {{domxref("Element")}}, kiểu này không cung cấp thao tác `toJSON()`. Tuy nhiên, {{domxref("PerformanceElementTiming.id", "id")}} của phần tử được cung cấp.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `PerformanceElementTiming`, với thông tin về phần tử hình ảnh.

```html
<img
  src="image.jpg"
  alt="a nice image"
  elementtiming="big-image"
  id="myImage" />
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.identifier === "big-image") {
      console.log(entry.toJSON());
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

Kết quả sẽ là một đối tượng JSON như sau:

```json
{
  "name": "image-paint",
  "entryType": "element",
  "startTime": 670894.1000000238,
  "duration": 0,
  "renderTime": 0,
  "loadTime": 670894.1000000238,
  "intersectionRect": {
    "x": 299,
    "y": 76,
    "width": 135,
    "height": 155,
    "top": 76,
    "right": 434,
    "bottom": 231,
    "left": 299
  },
  "identifier": "big-image",
  "naturalWidth": 135,
  "naturalHeight": 155,
  "id": "myImage",
  "url": "https://en.wikipedia.org/static/images/project-logos/enwiki.png"
}
```

Để lấy chuỗi JSON, bạn có thể sử dụng [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
