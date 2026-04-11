---
title: "SVGMarkerElement: orient property"
short-title: orient
slug: Web/API/SVGMarkerElement/orient
page-type: web-api-instance-property
browser-compat: api.SVGMarkerElement.orient
---

{{APIRef("SVG")}}

Thuộc tính **`orient`** của giao diện {{domxref("SVGMarkerElement")}} xác định cách điểm đánh dấu được xoay khi đặt tại vị trí của nó trên hình. Nó phản ánh giá trị thuộc tính {{SVGAttr("orient")}} của phần tử {{SVGElement("marker")}} tương ứng.

Khác với {{domxref("SVGMarkerElement.orientType")}} và {{domxref("SVGMarkerElement.orientAngle")}}, vốn chỉ cung cấp quyền truy cập chỉ đọc vào hướng và góc tương ứng, thuộc tính `orient` cho phép bạn đọc và đặt thuộc tính `orient` trực tiếp dưới dạng chuỗi.

## Giá trị

Một chuỗi. Các giá trị có thể là:

- `"auto"`
  - : Điểm đánh dấu được tự động xoay để đi theo hướng của đường dẫn tại điểm đặt.
- `"auto-start-reverse"`
  - : Nếu được đặt bởi {{SVGAttr("marker-start")}}, điểm đánh dấu được định hướng ở góc lệch 180° so với hướng sẽ dùng nếu chỉ định `auto`. Đối với tất cả các điểm đánh dấu khác, `auto-start-reverse` có nghĩa giống như `auto`.
- Giá trị [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle) (ví dụ: `"45deg"`)
  - : Điểm đánh dấu được xoay theo góc chỉ định, tính từ phương ngang.
- Giá trị [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number) (ví dụ: `"45"`)
  - : Điểm đánh dấu được định hướng theo góc chỉ định tính theo độ.

## Ví dụ

### Truy cập thuộc tính `orient`

```html
<svg
  viewBox="0 0 100 100"
  width="300"
  height="300"
  xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="12"
      markerHeight="12"
      orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
  <polyline
    points="10,90 50,10 90,90"
    fill="none"
    stroke="black"
    marker-start="url(#arrow)"
    marker-mid="url(#arrow)"
    marker-end="url(#arrow)" />
</svg>
<output></output>
```

```css hidden
body {
  font-family: system-ui;
}

output {
  display: block;
  font: inherit;
  white-space: pre;
}
```

Chúng ta có thể đọc thuộc tính `orient` và sau đó đặt nó thành một giá trị mới:

```js
const marker = document.querySelector("marker");
const log = document.querySelector("output");

if ("orient" in marker) {
  // Read the current orient value
  log.textContent = `orient: "${marker.orient}"\n`; // "auto-start-reverse"

  // Set a new orient value
  marker.orient = "90deg";
  log.textContent += `after setting "90deg": "${marker.orient}"`;
} else {
  log.textContent = "orient is not supported in this browser";
}
```

{{EmbedLiveSample("Examples", "", "340")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGMarkerElement.orientType")}}
- {{domxref("SVGMarkerElement.orientAngle")}}
- {{domxref("SVGMarkerElement.setOrientToAuto()")}}
- {{domxref("SVGMarkerElement.setOrientToAngle()")}}
- {{SVGAttr("orient")}}
