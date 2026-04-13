---
title: "Profiler: samplebufferfull event"
short-title: samplebufferfull
slug: Web/API/Profiler/samplebufferfull_event
page-type: web-api-event
browser-compat: api.Profiler.samplebufferfull_event
---

{{APIRef("JS Self-Profiling API")}}

Sự kiện **`samplebufferfull`** của giao diện {{domxref("Profiler")}} được kích hoạt khi số lượng mẫu mà profiler đã ghi khớp với giá trị [`maxBufferSize`](/en-US/docs/Web/API/Profiler/Profiler#maxbuffersize) được truyền vào hàm khởi tạo của profiler.

Sau khi sự kiện này kích hoạt, profiler sẽ không ghi thêm bất kỳ mẫu nào nữa.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("samplebufferfull", (event) => { })

onsamplebufferfull = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}}.

## Ví dụ

```js
const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 100 });

profiler.addEventListener("samplebufferfull", async () => {
  console.log("Sample buffer full!");
  const trace = await profiler.stop();
  console.log(JSON.stringify(trace));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
