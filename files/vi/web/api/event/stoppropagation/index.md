---
title: "Event: phương thức stopPropagation()"
short-title: stopPropagation()
slug: Web/API/Event/stopPropagation
page-type: web-api-instance-method
browser-compat: api.Event.stopPropagation
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`stopPropagation()`** của giao diện {{domxref("Event")}} ngăn sự lan truyền tiếp theo của sự kiện hiện tại trong các pha capturing và bubbling. Tuy nhiên, nó không ngăn các hành vi mặc định xảy ra; ví dụ, việc nhấp vào liên kết vẫn được xử lý. Nếu bạn muốn dừng những hành vi đó, hãy xem phương thức {{domxref("Event.preventDefault", "preventDefault()")}}. Nó cũng không ngăn sự lan truyền tới các bộ xử lý sự kiện khác của phần tử hiện tại. Nếu bạn muốn dừng những bộ xử lý đó, hãy xem {{domxref("Event.stopImmediatePropagation", "stopImmediatePropagation()")}}.

## Cú pháp

```js-nolint
stopPropagation()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

## Ví dụ

Xem [Lan truyền sự kiện](/en-US/docs/Web/API/Document_Object_Model#event_propagation).
Cũng xem ví dụ ở {{domxref("Event.stopImmediatePropagation", "stopImmediatePropagation()")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
