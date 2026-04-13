---
title: "SVGTransform: type property"
short-title: type
slug: Web/API/SVGTransform/type
page-type: web-api-instance-property
browser-compat: api.SVGTransform.type
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("SVGTransform")}} đại diện cho `type` của phép biến đổi được áp dụng, được chỉ định bởi một trong các hằng số `SVG_TRANSFORM_*` được định nghĩa trên giao diện này.

## Giá trị

Một `integer`; kiểu của giá trị dưới dạng unsigned short.

## Ví dụ

### Xác định kiểu của phép biến đổi

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect id="rect" x="50" y="50" width="100" height="100" fill="blue" />
</svg>
```

```js
const rect = document.getElementById("rect");
const transformList = rect.transform.baseVal;

// Tạo và thêm phép biến đổi dịch chuyển
const translateTransform = rect.ownerSVGElement.createSVGTransform();
translateTransform.setTranslate(20, 30);
transformList.appendItem(translateTransform);

// Kiểm tra kiểu của phép biến đổi được thêm vào
console.log(transformList.getItem(0).type); // Đầu ra: 2 (SVG_TRANSFORM_TRANSLATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
