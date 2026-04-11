---
title: "SharedWorkerGlobalScope: close() method"
short-title: close()
slug: Web/API/SharedWorkerGlobalScope/close
page-type: web-api-instance-method
browser-compat: api.SharedWorkerGlobalScope.close
---

{{APIRef("Web Workers API")}}

Phương thức **`close()`** của giao diện {{domxref("SharedWorkerGlobalScope")}} loại bỏ mọi tác vụ đang xếp hàng trong vòng lặp sự kiện của `SharedWorkerGlobalScope`, qua đó đóng phạm vi cụ thể này.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Nếu bạn muốn đóng thể hiện worker của mình ngay bên trong worker, bạn có thể gọi như sau:

```js
close();
```

`close()` và `self.close()` về cơ bản là tương đương nhau - cả hai đều biểu thị việc gọi `close()` từ bên trong phạm vi nội bộ của worker.

> [!NOTE]
> Cũng có một cách để dừng worker từ luồng chính: phương thức {{domxref("Worker.terminate")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

{{domxref("DedicatedWorkerGlobalScope")}}
