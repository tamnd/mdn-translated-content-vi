---
title: "SVGPatternElement: preserveAspectRatio property"
short-title: preserveAspectRatio
slug: Web/API/SVGPatternElement/preserveAspectRatio
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.preserveAspectRatio
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`preserveAspectRatio`** của giao diện {{domxref("SVGPatternElement")}} phản ánh thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử đã cho. Nó xác định cách nội dung của mẫu nên được thu phóng để phù hợp với không gian đã cho trong khi vẫn giữ tỷ lệ khung hình.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedPreserveAspectRatio")}}.

## Ví dụ

Với SVG sau đây, chúng ta có thể sử dụng thuộc tính `preserveAspectRatio` để lấy hành vi thu phóng của phần tử mẫu:

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">
  <defs>
    <pattern
      id="pattern1"
      width="10"
      height="10"
      preserveAspectRatio="xMidYMid meet">
      <circle cx="5" cy="5" r="5" fill="blue" />
    </pattern>
  </defs>
  <rect x="0" y="0" width="100" height="100" fill="url(#pattern1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `preserveAspectRatio`:

```js
const pattern = document.querySelector("pattern");

console.log(pattern.preserveAspectRatio.baseVal); // output: SVGPreserveAspectRatio {align: 1, meetOrSlice: 1}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("preserveAspectRatio")}}
