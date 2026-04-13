---
title: "ElementInternals: ariaKeyShortcuts property"
short-title: ariaKeyShortcuts
slug: Web/API/ElementInternals/ariaKeyShortcuts
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaKeyShortcuts
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaKeyShortcuts`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-keyshortcuts`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-keyshortcuts), cho biết các phím tắt bàn phím mà tác giả đã triển khai để kích hoạt hoặc đặt tiêu điểm vào một phần tử.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, giá trị của `ariaKeyShortcuts` được đặt thành "Alt+Shift+A".

```js
this.internals_.ariaKeyShortcuts = "Alt+Shift+A";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
