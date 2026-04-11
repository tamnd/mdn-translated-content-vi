---
title: "HTMLElement: thuộc tính offsetTop"
short-title: offsetTop
slug: Web/API/HTMLElement/offsetTop
page-type: web-api-instance-property
browser-compat: api.HTMLElement.offsetTop
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`offsetTop`** của giao diện {{domxref("HTMLElement")}} trả về khoảng cách từ cạnh ngoài của viền phần tử hiện tại (bao gồm margin của nó) đến cạnh trên của padding của {{domxref("HTMLelement.offsetParent","offsetParent")}}, tổ tiên _được định vị gần nhất_.

## Giá trị

Một số.

## Ví dụ

```js
const d = document.getElementById("div1");
const topPos = d.offsetTop;

if (topPos > 10) {
  // object offset is more
  // than 10 pixels from its parent
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác định kích thước của các phần tử](/en-US/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("Element.clientTop")}}
- {{domxref("Element.scrollTop")}}
- {{domxref("HTMLElement.offsetHeight")}}
- {{domxref("HTMLElement.offsetWidth")}}
- {{domxref("HTMLElement.offsetLeft")}}
- {{domxref("Element.getBoundingClientRect()")}}
