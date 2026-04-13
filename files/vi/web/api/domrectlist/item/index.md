---
title: "DOMRectList: phương thức item()"
short-title: item()
slug: Web/API/DOMRectList/item
page-type: web-api-instance-method
browser-compat: api.DOMRectList.item
---

{{APIRef("Geometry Interfaces")}}

Phương thức `item()` của {{domxref("DOMRectList")}} trả về {{domxref("DOMRect")}} tại chỉ mục được chỉ định trong danh sách, hoặc `null` nếu chỉ mục nằm ngoài phạm vi.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Một số nguyên dựa trên 0 đại diện cho vị trí của `DOMRect` trong `DOMRectList` cần lấy.

### Giá trị trả về

Một đối tượng {{domxref("DOMRect")}} tại chỉ mục được chỉ định trong `DOMRectList`, hoặc null nếu chỉ mục lớn hơn hoặc bằng số lượng hình chữ nhật trong danh sách.

## Ví dụ

```js
const rects = document.getElementById("rects").getClientRects();
console.log(rects.length); // Number of rectangles in the DOMRectList

if (rects.length > 0) {
  console.log(rects.item(0)); // Logs the first DOMRect object
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
