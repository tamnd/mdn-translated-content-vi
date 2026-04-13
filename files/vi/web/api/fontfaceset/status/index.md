---
title: "FontFaceSet: thuộc tính status"
short-title: status
slug: Web/API/FontFaceSet/status
page-type: web-api-instance-property
browser-compat: api.FontFaceSet.status
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`status`** của giao diện {{domxref("FontFaceSet")}} trả về trạng thái tải của các font trong tập hợp.

## Giá trị

Một trong:

- `"loading"`
- `"loaded"`

## Ví dụ

Trong ví dụ sau, `status` của `FontFaceSet` được in ra console.

```js
console.log(document.fonts.status);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
