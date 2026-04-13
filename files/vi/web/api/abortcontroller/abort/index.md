---
title: "AbortController: phương thức abort()"
short-title: abort()
slug: Web/API/AbortController/abort
page-type: web-api-instance-method
browser-compat: api.AbortController.abort
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`abort()`** của giao diện {{domxref("AbortController")}} hủy một thao tác bất đồng bộ trước khi nó hoàn tất. Phương thức này có thể hủy [yêu cầu fetch](/en-US/docs/Web/API/Window/fetch), việc đọc bất kỳ phần thân phản hồi nào hoặc các stream.

## Cú pháp

```js-nolint
abort()
abort(reason)
```

### Tham số

- `reason` {{optional_inline}}
  - : Lý do khiến thao tác bị hủy, có thể là bất kỳ giá trị JavaScript nào. Nếu không chỉ định, lý do sẽ được đặt thành `AbortError` {{domxref("DOMException")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem ví dụ sử dụng trong [trang `AbortSignal`](/en-US/docs/Web/API/AbortSignal#examples).

Bạn có thể xem [một ví dụ hoàn chỉnh trên GitHub](https://github.com/mdn/dom-examples/tree/main/abort-api); đồng thời cũng có thể xem [bản chạy trực tiếp](https://mdn.github.io/dom-examples/abort-api/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
