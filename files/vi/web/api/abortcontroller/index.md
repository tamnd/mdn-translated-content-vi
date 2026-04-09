---
title: AbortController
slug: Web/API/AbortController
page-type: web-api-interface
browser-compat: api.AbortController
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`AbortController`** biểu diễn một đối tượng điều khiển, cho phép bạn hủy một hay nhiều yêu cầu Web khi cần.

Bạn có thể tạo một đối tượng `AbortController` mới bằng bộ khởi tạo {{domxref("AbortController.AbortController()", "AbortController()")}}. Việc giao tiếp với một thao tác bất đồng bộ được thực hiện thông qua đối tượng {{domxref("AbortSignal")}}.

## Bộ khởi tạo

- {{domxref("AbortController.AbortController()", "AbortController()")}}
  - : Tạo một thể hiện đối tượng `AbortController` mới.

## Thuộc tính thể hiện

- {{domxref("AbortController.signal")}} {{ReadOnlyInline}}
  - : Trả về một thể hiện đối tượng {{domxref("AbortSignal")}}, có thể được dùng để giao tiếp với hoặc hủy một thao tác bất đồng bộ.

## Phương thức thể hiện

- {{domxref("AbortController.abort()")}}
  - : Hủy một thao tác bất đồng bộ trước khi nó hoàn tất. Phương thức này có thể hủy [yêu cầu fetch](/en-US/docs/Web/API/Window/fetch), việc đọc bất kỳ phần thân phản hồi nào và các stream.

## Ví dụ

Xem ví dụ sử dụng trong [trang `AbortSignal`](/en-US/docs/Web/API/AbortSignal#examples).

Bạn có thể xem [một ví dụ hoàn chỉnh trên GitHub](https://github.com/mdn/dom-examples/tree/main/abort-api); đồng thời cũng có thể xem [bản chạy trực tiếp](https://mdn.github.io/dom-examples/abort-api/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- [Abortable Fetch](https://developer.chrome.com/blog/abortable-fetch/) của Jake Archibald
