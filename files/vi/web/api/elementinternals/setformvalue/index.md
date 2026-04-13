---
title: "ElementInternals: setFormValue() method"
short-title: setFormValue()
slug: Web/API/ElementInternals/setFormValue
page-type: web-api-instance-method
browser-compat: api.ElementInternals.setFormValue
---

{{APIRef("Web Components")}}

Phương thức **`setFormValue()`** của giao diện {{domxref("ElementInternals")}} đặt giá trị gửi và trạng thái của phần tử, truyền đạt những thông tin này đến tác nhân người dùng.

## Cú pháp

```js-nolint
setFormValue(value)
setFormValue(value, state)
```

### Tham số

- `value`
  - : Một {{domxref("File")}}, một chuỗi hoặc một {{domxref("FormData")}} làm giá trị được gửi đến máy chủ.
- `state` {{optional_inline}}
  - : Một {{domxref("File")}}, một chuỗi hoặc một {{domxref("FormData")}} đại diện cho đầu vào do người dùng thực hiện.
    Điều này cho phép ứng dụng hiển thị lại thông tin mà người dùng đã gửi, theo định dạng mà họ đã gửi, nếu cần.

> [!NOTE]
> Nói chung, `state` được sử dụng để truyền thông tin do người dùng chỉ định, `value` phù hợp để gửi lên máy chủ sau khi đã làm sạch.
> Ví dụ, nếu một phần tử tùy chỉnh yêu cầu người dùng nhập ngày, người dùng có thể nhập "3/15/2019".
> Đây sẽ là `state`.
> Máy chủ mong đợi định dạng ngày là `2019-03-15`, ngày theo định dạng này sẽ được truyền làm `value`.

### Giá trị trả về

Undefined.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không có thuộc tính `formAssociated` được đặt thành `true`.

## Ví dụ

Trong ví dụ sau, một phần tử tùy chỉnh hộp kiểm đặt `on` làm giá trị gửi đến máy chủ và `checked` làm trạng thái.

```js
this.internals_.setFormValue("on", "checked");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
