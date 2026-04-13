---
title: "DedicatedWorkerGlobalScope: close() method"
short-title: close()
slug: Web/API/DedicatedWorkerGlobalScope/close
page-type: web-api-instance-method
browser-compat: api.DedicatedWorkerGlobalScope.close
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`close()`** của giao diện {{domxref("DedicatedWorkerGlobalScope")}} loại bỏ mọi tác vụ đang xếp hàng trong vòng lặp sự kiện của `DedicatedWorkerGlobalScope`, qua đó đóng phạm vi cụ thể này.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Nếu bạn muốn đóng một worker instance ngay bên trong chính worker đó, bạn có thể gọi như sau:

```js
close();
```

`close()` và `self.close()` về cơ bản là tương đương nhau, cả hai đều biểu thị việc gọi `close()` từ bên trong phạm vi nội bộ của worker.

> [!NOTE]
> Cũng có một cách để dừng worker từ luồng chính: phương thức {{domxref("Worker.terminate")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

{{domxref("DedicatedWorkerGlobalScope")}}
