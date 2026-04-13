---
title: "MutationEvent: thuộc tính attrChange"
short-title: attrChange
slug: Web/API/MutationEvent/attrChange
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MutationEvent.attrChange
---

{{APIRef("UI Events")}}{{Deprecated_Header}}{{non-standard_header}}

Thuộc tính chỉ đọc **`attrChange`** của giao diện {{domxref("MutationEvent")}} trả về một số cho biết loại thay đổi nào đã kích hoạt sự kiện `DOMAttrModified`. Ba giá trị có thể là `MODIFICATION` (`1`), `ADDITION` (`2`) hoặc `REMOVAL` (`3`). Nó không có ý nghĩa cho các sự kiện khác và được đặt thành `0`.

## Giá trị

Một số nguyên: `0`, `1` (`MODIFICATION`), `2` (`ADDITION`), hoặc `3` (`REMOVAL`).

## Ví dụ

```js
element.addEventListener("DOMAttrModified", (event) => {
  console.log(event.attrChange);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
