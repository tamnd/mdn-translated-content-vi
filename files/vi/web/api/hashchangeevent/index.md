---
title: HashChangeEvent
slug: Web/API/HashChangeEvent
page-type: web-api-interface
browser-compat: api.HashChangeEvent
---

{{APIRef("HTML DOM")}}

Giao diện **`HashChangeEvent`** đại diện cho các sự kiện kích hoạt khi định danh phân mảnh (fragment identifier) của URL thay đổi.

Định danh phân mảnh là phần của URL theo sau (và bao gồm) ký hiệu `#`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("HashChangeEvent.HashChangeEvent", "HashChangeEvent()")}}
  - : Tạo một đối tượng `HashChangeEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của lớp cha, {{domxref("Event")}}._

- {{domxref("HashChangeEvent.newURL")}} {{ReadOnlyInline}}
  - : URL mới mà cửa sổ đang điều hướng đến.
- {{domxref("HashChangeEvent.oldURL")}} {{ReadOnlyInline}}
  - : URL cũ mà cửa sổ đã điều hướng từ đó.

## Phương thức phiên bản

_Giao diện này không có phương thức riêng, nhưng kế thừa các phương thức của lớp cha, {{domxref("Event")}}._

## Ví dụ

### Ví dụ cơ bản

```js
function locationHashChanged() {
  if (location.hash === "#some-cool-feature") {
    someCoolFeature();
  }
}

window.addEventListener("hashchange", locationHashChanged);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Sự kiện liên quan

- {{domxref("window.hashchange_event", "hashchange")}}
- {{domxref("window.popstate_event", "popstate")}}
