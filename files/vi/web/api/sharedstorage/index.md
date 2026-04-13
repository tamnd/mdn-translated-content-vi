---
title: SharedStorage
slug: Web/API/SharedStorage
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SharedStorage
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`SharedStorage`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho bộ lưu trữ chia sẻ của một nguồn gốc cụ thể, định nghĩa các phương thức để ghi dữ liệu vào bộ lưu trữ chia sẻ.

`SharedStorage` là lớp cơ sở cho:

- {{domxref("WindowSharedStorage")}}, truy cập qua {{domxref("Window.sharedStorage")}}.
- {{domxref("WorkletSharedStorage")}}, truy cập qua {{domxref("SharedStorageWorkletGlobalScope.sharedStorage")}}.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("SharedStorage.append", "append()")}} {{deprecated_inline}}
  - : Nối thêm một chuỗi vào giá trị của một cặp key-value hiện có trong bộ lưu trữ chia sẻ của nguồn gốc hiện tại.
- {{domxref("SharedStorage.clear", "clear()")}} {{deprecated_inline}}
  - : Xóa bộ lưu trữ chia sẻ của nguồn gốc hiện tại, xóa toàn bộ dữ liệu.
- {{domxref("SharedStorage.delete", "delete()")}} {{deprecated_inline}}
  - : Xóa một cặp key-value hiện có khỏi bộ lưu trữ chia sẻ của nguồn gốc hiện tại.
- {{domxref("SharedStorage.set", "set()")}} {{deprecated_inline}}
  - : Lưu trữ một cặp key-value mới trong bộ lưu trữ chia sẻ của nguồn gốc hiện tại hoặc cập nhật cặp hiện có.

## Ví dụ

```js
window.sharedStorage
  .set("ab-testing-group", "0")
  .then(() => console.log("Value saved to shared storage"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WindowSharedStorage")}}
- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
