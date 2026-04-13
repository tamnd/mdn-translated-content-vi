---
title: "DedicatedWorkerGlobalScope: name property"
short-title: name
slug: Web/API/DedicatedWorkerGlobalScope/name
page-type: web-api-instance-property
browser-compat: api.DedicatedWorkerGlobalScope.name
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("DedicatedWorkerGlobalScope")}} trả về tên mà {{domxref("Worker")}} được (tùy chọn) gán khi được tạo. Đây là tên mà hàm tạo {{domxref("Worker.Worker", "Worker()")}} có thể truyền vào để lấy tham chiếu đến {{domxref("DedicatedWorkerGlobalScope")}}.

## Giá trị

Một chuỗi.

## Ví dụ

Nếu một worker được tạo bằng một hàm tạo có tùy chọn `name`:

```js
const myWorker = new Worker("worker.js", { name: "myWorker" });
```

thì {{domxref("DedicatedWorkerGlobalScope")}} sẽ có tên là "myWorker", và có thể truy xuất bằng cách chạy

```js
self.name;
```

ngay bên trong worker.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DedicatedWorkerGlobalScope")}}
