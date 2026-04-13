---
title: "AbortSignal: thuộc tính reason"
short-title: reason
slug: Web/API/AbortSignal/reason
page-type: web-api-instance-property
browser-compat: api.AbortSignal.reason
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`reason`** trả về một giá trị JavaScript cho biết lý do hủy.

Thuộc tính này là `undefined` khi tín hiệu chưa bị hủy. Nó có thể được đặt thành một giá trị cụ thể khi tín hiệu bị hủy, bằng cách dùng {{domxref("AbortController.abort()")}} hoặc {{domxref("AbortSignal/abort_static", "AbortSignal.abort()")}}. Nếu không được đặt tường minh trong các phương thức đó, nó mặc định là `AbortError` {{domxref("DOMException")}}.

## Giá trị

Một giá trị JavaScript cho biết lý do hủy, hoặc `undefined` nếu chưa bị hủy.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một đối tượng `AbortController` mới và lấy {{domxref("AbortSignal")}} của nó, có sẵn thông qua thuộc tính `signal`. Về sau, dùng thuộc tính `aborted`, chúng ta kiểm tra xem tín hiệu đã bị hủy hay chưa và ghi trạng thái hủy cùng lý do ra console.

```js
const controller = new AbortController();
const signal = controller.signal;

// …

if (signal.aborted) {
  if (signal.reason) {
    console.log(`Request aborted with reason: ${signal.reason}`);
  } else {
    console.log("Request aborted but no reason was given.");
  }
} else {
  console.log("Request not aborted");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
