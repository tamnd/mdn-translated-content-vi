---
title: Ink
slug: Web/API/Ink
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Ink
---

{{APIRef("Ink API")}}{{SeeCompatTable}}

Giao diện **`Ink`** của [Ink API](/en-US/docs/Web/API/Ink_API) cung cấp quyền truy cập vào các đối tượng {{domxref("DelegatedInkTrailPresenter")}} để ứng dụng sử dụng để hiển thị các nét mực.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("Ink.requestPresenter", "requestPresenter()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} thực hiện với một đối tượng {{domxref("DelegatedInkTrailPresenter")}} để xử lý việc hiển thị các nét.

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

## Tương thích trình duyệt

{{Compat}}
