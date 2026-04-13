---
title: "SVGAnimatedEnumeration: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedEnumeration/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedEnumeration.baseVal
---

{{APIRef("SVG")}}

Thuộc tính **`baseVal`** của giao diện {{domxref("SVGAnimatedEnumeration")}} chứa giá trị ban đầu của một kiểu liệt kê SVG.

## Giá trị

Một số nguyên chứa giá trị ban đầu của kiểu liệt kê.

## Ví dụ

Xem xét đoạn này với phần tử {{SVGElement("clipPath")}}: Thuộc tính {{SVGAttr("clipPathUnits")}} của nó liên quan đến đối tượng {{domxref("SVGAnimatedEnumeration")}}.

```html
<svg viewBox="0 0 100 100" width="200" height="200">
  <clipPath id="clip1" clipPathUnits="userSpaceOnUse">
    <circle cx="50" cy="50" r="35" />
  </clipPath>

  <!-- Một số hình chữ nhật tham chiếu để cụ thể hóa đường cắt -->
  <rect id="r1" x="0" y="0" width="45" height="45" />
</svg>
```

Đoạn này lấy phần tử và ghi lại `baseVal` của thuộc tính {{domxref("SVGClipPathElement.clipPathUnits")}}.

```js
const clipPathElt = document.getElementById("clip1");
console.log(clipPathElt.clipPathUnits.baseVal); // Ghi ra 1 tương ứng với userSpaceOnUse
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedEnumeration.animVal")}}
