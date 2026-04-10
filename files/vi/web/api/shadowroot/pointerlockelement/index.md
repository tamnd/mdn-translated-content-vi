---
title: "ShadowRoot: thuộc tính pointerLockElement"
short-title: pointerLockElement
slug: Web/API/ShadowRoot/pointerLockElement
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.pointerLockElement
---

{{APIRef("Pointer Lock API")}}

Thuộc tính chỉ đọc **`pointerLockElement`** của giao diện {{domxref("ShadowRoot")}} cung cấp phần tử được đặt làm đích cho các sự kiện chuột trong khi con trỏ bị khóa. Nó là `null` nếu đang chờ khóa, con trỏ chưa được khóa, hoặc đích nằm trong cây khác.

## Giá trị

Một {{domxref("Element")}} hoặc `null`.

## Ví dụ

```js
let customElem = document.querySelector("my-shadow-dom-element");
let shadow = customElem.shadowRoot;
let pleElem = shadow.pointerLockElement;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Document.exitPointerLock()") }}
- {{ domxref("Element.requestPointerLock()") }}
- [Pointer Lock](/en-US/docs/Web/API/Pointer_Lock_API)
