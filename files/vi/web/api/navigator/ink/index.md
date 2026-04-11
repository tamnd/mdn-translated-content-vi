---
title: "Navigator: thuộc tính ink"
short-title: ink
slug: Web/API/Navigator/ink
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.ink
---

{{SeeCompatTable}}{{APIRef("Ink API")}}

Thuộc tính chỉ đọc **`ink`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("Ink")}} cho tài liệu hiện tại, cung cấp quyền truy cập vào chức năng [Ink API](/en-US/docs/Web/API/Ink_API).

## Giá trị

Một đối tượng {{domxref('Ink')}}.

## Ví dụ

```js
async function inkInit() {
  const ink = navigator.ink;
  let presenter = await ink.requestPresenter({ presentationArea: canvas });

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
