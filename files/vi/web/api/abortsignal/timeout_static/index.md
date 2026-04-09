---
title: "AbortSignal: phương thức tĩnh timeout()"
short-title: timeout()
slug: Web/API/AbortSignal/timeout_static
page-type: web-api-static-method
browser-compat: api.AbortSignal.timeout_static
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức tĩnh **`AbortSignal.timeout()`** trả về một {{domxref("AbortSignal")}} sẽ tự động bị hủy sau một khoảng thời gian xác định.

Tín hiệu sẽ bị hủy với một {{domxref("DOMException")}} `TimeoutError` khi hết thời gian chờ.

Thời gian chờ được tính theo thời gian "hoạt động" thay vì thời gian trôi qua thực tế, và trên thực tế sẽ bị tạm dừng nếu mã đang chạy trong một worker bị treo hoặc khi tài liệu đang ở trong bộ nhớ đệm chuyển tiếp-lùi ("[bfcache](https://web.dev/articles/bfcache)").

Để kết hợp nhiều tín hiệu, bạn có thể dùng {{domxref("AbortSignal/any_static", "AbortSignal.any()")}}, ví dụ để hủy trực tiếp một lượt tải xuống bằng tín hiệu hết thời gian chờ hoặc bằng cách gọi {{domxref("AbortController.abort()")}}.

## Cú pháp

```js-nolint
AbortSignal.timeout(time)
```

### Tham số

- `time`
  - : Thời gian "hoạt động", tính bằng mili giây, trước khi {{domxref("AbortSignal")}} được trả về bị hủy.
    Giá trị phải nằm trong khoảng từ `0` đến {{jsxref("Number.MAX_SAFE_INTEGER")}}.

### Giá trị trả về

Một {{domxref("AbortSignal")}}.

Khi hết thời gian chờ, tín hiệu sẽ bị hủy và thuộc tính {{domxref("AbortSignal.reason")}} của nó sẽ được đặt thành một {{domxref("DOMException")}} `TimeoutError`, hoặc thành một {{domxref("DOMException")}} `AbortError` nếu thao tác do người dùng kích hoạt.

## Ví dụ

Dưới đây là ví dụ về một thao tác fetch sẽ hết thời gian chờ nếu không thành công sau 5 giây. Lưu ý rằng thao tác này cũng có thể thất bại nếu phương thức không được hỗ trợ, nếu người dùng nhấn nút "dừng" của trình duyệt hoặc vì một lý do khác.

```js
const url = "https://path_to_large_file.mp4";

try {
  const res = await fetch(url, { signal: AbortSignal.timeout(5000) });
  const result = await res.blob();
  // …
} catch (err) {
  if (err.name === "TimeoutError") {
    // This exception is from the abort signal
    console.error("Timeout: It took more than 5 seconds to get the result!");
  } else if (err.name === "AbortError") {
    // This exception is from the fetch itself
    console.error(
      "Fetch aborted by user action (browser stop button, closing tab, etc.",
    );
  } else if (err.name === "TypeError") {
    console.error("AbortSignal.timeout() method is not supported");
  } else {
    // A network error, or some other problem.
    console.error(`Error: type: ${err.name}, message: ${err.message}`);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
