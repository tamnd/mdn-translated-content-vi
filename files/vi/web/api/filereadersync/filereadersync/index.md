---
title: "FileReaderSync: Hàm tạo FileReaderSync()"
short-title: FileReaderSync()
slug: Web/API/FileReaderSync/FileReaderSync
page-type: web-api-constructor
browser-compat: api.FileReaderSync.FileReaderSync
---

{{APIRef("File API")}} {{AvailableInWorkers("worker_except_service")}}

Hàm tạo **`FileReaderSync()`** tạo một {{domxref("FileReaderSync")}} mới.

## Cú pháp

```js-nolint
new FileReaderSync()
```

### Tham số

Không có.

## Ví dụ

Đoạn mã sau minh họa cách tạo đối tượng [`FileReaderSync`](/en-US/docs/Web/API/FileReaderSync) bằng hàm tạo `FileReaderSync()` và cách sử dụng đối tượng đó:

```js
function readFile(blob) {
  const reader = new FileReaderSync();
  postMessage(reader.readAsDataURL(blob));
}
```

> [!NOTE]
> Đoạn mã này phải được sử dụng bên trong một {{domxref("Worker")}}, vì các giao diện đồng bộ không thể dùng trên luồng chính.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
