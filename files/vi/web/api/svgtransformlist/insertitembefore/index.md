---
title: "SVGTransformList: insertItemBefore() method"
short-title: insertItemBefore()
slug: Web/API/SVGTransformList/insertItemBefore
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.insertItemBefore
---

{{APIRef("SVG")}}

Phương thức `insertItemBefore()` của giao diện {{domxref("SVGTransformList")}} chèn một phần tử mới vào danh sách tại vị trí chỉ định.

Phần tử đầu tiên có chỉ số `0`. Phần tử được chèn là chính phần tử đó chứ không phải bản sao.

- Nếu `newItem` đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này.

- Nếu phần tử đã có trong danh sách này, lưu ý rằng `index` của phần tử cần chèn trước là trước khi xóa phần tử.

- Nếu `index` bằng `0`, phần tử mới được chèn vào đầu danh sách.

- Nếu `index` lớn hơn hoặc bằng {{domxref("SVGTransformList.numberOfItems", "numberOfItems")}}, phần tử mới sẽ được thêm vào cuối danh sách.

## Cú pháp

```js-nolint
insertItemBefore(newItem, index)
```

### Tham số

- `newItem`
  - : Một phần tử {{domxref("SVGTransform")}} được chèn vào danh sách.
- `index`
  - : Một `integer`; chỉ số tại đó phần tử mới cần được chèn vào là unsigned long.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}; phần tử được chèn vào từ danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGTransformList")}} tương ứng với thuộc tính chỉ đọc hoặc khi bản thân đối tượng là chỉ đọc.

## Ví dụ

### Chèn một biến đổi vào danh sách

```html
<svg width="200" height="200" id="mySvg">
  <rect width="100" height="100" fill="blue" />
</svg>
```

```js
const svgElement = document.querySelector("svg");
const rectElement = svgElement.querySelector("rect");

// Access the transform list of the <rect> element
const transformList = rectElement.transform.baseVal;

// Create a new translate transformation
const translateTransform = svgElement.createSVGTransform();
translateTransform.setTranslate(50, 50);

// Insert the translation transformation at the beginning of the list
transformList.insertItemBefore(translateTransform, 0);

// The transformation list length and type
console.log(`Number of transformations: ${transformList.length}`); // Output: 1
console.log(`Transformation Type: ${transformList.getItem(0).type}`); // Output: 2 (e.g. SVG_TRANSFORM_TRANSLATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
