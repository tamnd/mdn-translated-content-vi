---
title: "Worker: phương thức terminate()"
short-title: terminate()
slug: Web/API/Worker/terminate
page-type: web-api-instance-method
browser-compat: api.Worker.terminate
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức **`terminate()`** của giao diện {{domxref("Worker")}} chấm dứt ngay lập tức {{domxref("Worker")}}. Phương thức này không cho worker cơ hội hoàn thành các hoạt động của nó; worker bị dừng ngay lập tức.

## Cú pháp

```js-nolint
terminate()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã sau hiển thị việc tạo một đối tượng {{domxref("Worker")}} bằng cách sử dụng hàm tạo {{domxref("Worker.Worker", "Worker()")}}, sau đó ngay lập tức chấm dứt nó.

```js
const myWorker = new Worker("worker.js");

myWorker.terminate();
```

> [!NOTE]
> DedicatedWorkers và SharedWorkers cũng có thể bị dừng từ instance {{domxref("Worker")}} bằng cách sử dụng các phương thức {{domxref("DedicatedWorkerGlobalScope.close()")}} hoặc {{domxref("SharedWorkerGlobalScope.close()")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- Giao diện {{domxref("Worker")}}
- {{domxref("DedicatedWorkerGlobalScope.close()")}}
- {{domxref("SharedWorkerGlobalScope.close()")}}
