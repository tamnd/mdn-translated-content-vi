---
title: "XRAnchor: phương thức delete()"
short-title: delete()
slug: Web/API/XRAnchor/delete
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRAnchor.delete
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`delete()`** của giao diện {{domxref("XRAnchor")}} xóa một anchor. Điều này có thể hữu ích khi ứng dụng không còn quan tâm đến việc nhận cập nhật cho một anchor nữa.

## Cú pháp

```js-nolint
delete()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa tất cả các anchor

```js
let anchorsCollection = new Set();

// Upon creating anchors, add them to the Set
// anchorsCollection.add(anchor);

for (const anchor of anchorsCollection) {
  anchor.delete();
}

anchorsCollection.clear();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
