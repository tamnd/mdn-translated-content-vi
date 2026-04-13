---
title: "SharedWorkerGlobalScope: name property"
short-title: name
slug: Web/API/SharedWorkerGlobalScope/name
page-type: web-api-instance-property
browser-compat: api.SharedWorkerGlobalScope.name
---

{{APIRef("Web Workers API")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("SharedWorkerGlobalScope")}} trả về tên mà {{domxref("SharedWorker")}} được (tùy chọn) gán khi được tạo. Đây là tên mà hàm tạo {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}} có thể truyền vào để lấy tham chiếu tới {{domxref("SharedWorkerGlobalScope")}}.

## Giá trị

Một chuỗi.

## Ví dụ

Nếu một shared worker được tạo bằng một hàm tạo có tùy chọn `name`:

```js
const myWorker = new SharedWorker("worker.js", { name: "mySharedWorker" });
```

thì {{domxref("SharedWorkerGlobalScope")}} sẽ có tên là "mySharedWorker", có thể trả về bằng cách chạy

```js
self.name;
```

ngay bên trong shared worker.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SharedWorkerGlobalScope")}}
