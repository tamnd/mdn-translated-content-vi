---
title: "DocumentFragment: thuộc tính childElementCount"
short-title: childElementCount
slug: Web/API/DocumentFragment/childElementCount
page-type: web-api-instance-property
browser-compat: api.DocumentFragment.childElementCount
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`DocumentFragment.childElementCount`** trả về số lượng phần tử con của một `DocumentFragment`.

Để lấy số lượng phần tử con của một phần tử cụ thể, xem {{domxref("Element.childElementCount")}}.

## Giá trị

Một số đại diện cho số lượng phần tử con của phân đoạn tài liệu.

## Ví dụ

```js
let fragment = new DocumentFragment();
fragment.childElementCount; // 0

let paragraph = document.createElement("p");
fragment.appendChild(paragraph);

fragment.childElementCount; // 1
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.childElementCount")}}
- {{domxref("Document.childElementCount")}}
