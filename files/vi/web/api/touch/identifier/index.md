---
title: "Touch: thuộc tính identifier"
short-title: identifier
slug: Web/API/Touch/identifier
page-type: web-api-instance-property
browser-compat: api.Touch.identifier
---

{{ APIRef("Touch Events") }}

Thuộc tính **`Touch.identifier`** trả về giá trị định danh duy nhất cho điểm tiếp xúc này với bề mặt cảm ứng. Giá trị này không đổi trong mọi sự kiện liên quan đến ngón tay (hoặc stylus) này cho đến khi nhấc lên khỏi bề mặt.

## Giá trị

Giá trị kiểu `long` đại diện cho ID duy nhất của đối tượng {{ domxref("Touch") }}.

## Ví dụ

```js
someElement.addEventListener("touchmove", (e) => {
  // Duyệt qua danh sách điểm chạm đã thay đổi kể từ sự kiện trước
  // và in ra mã định danh của từng điểm.
  for (let i = 0; i < e.changedTouches.length; i++) {
    console.log(
      `changedTouches[${i}].identifier = ${e.changedTouches[i].identifier}`,
    );
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
