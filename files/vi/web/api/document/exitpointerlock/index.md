---
title: "Document: phương thức exitPointerLock()"
short-title: exitPointerLock()
slug: Web/API/Document/exitPointerLock
page-type: web-api-instance-method
browser-compat: api.Document.exitPointerLock
---

{{APIRef("Pointer Lock API")}}

Phương thức **`exitPointerLock()`** của giao diện {{domxref("Document")}} giải phóng không đồng bộ khóa con trỏ đã được yêu cầu trước đó thông qua {{domxref("Element.requestPointerLock")}}.

> [!NOTE]
> Trong khi phương thức **`exitPointerLock()`** được gọi trên document, phương thức **`requestPointerLock()`** được gọi trên một phần tử.

Để theo dõi thành công hay thất bại của yêu cầu, cần lắng nghe các sự kiện {{domxref("Document/pointerlockchange_event", "pointerlockchange")}} và {{domxref("Document/pointerlockerror_event", "pointerlockerror")}}.

## Cú pháp

```js-nolint
exitPointerLock()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Document.pointerLockElement") }}
- {{ domxref("Element.requestPointerLock()") }}
- [Pointer Lock](/en-US/docs/Web/API/Pointer_Lock_API)
