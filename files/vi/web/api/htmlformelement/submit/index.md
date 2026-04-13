---
title: "HTMLFormElement: phương thức submit()"
short-title: submit()
slug: Web/API/HTMLFormElement/submit
page-type: web-api-instance-method
browser-compat: api.HTMLFormElement.submit
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLFormElement.submit()`** gửi một {{HtmlElement("form")}} đã cho.

Phương thức này tương tự, nhưng không giống hệt, với việc kích hoạt nút gửi {{HtmlElement("button")}} của biểu mẫu. Tuy nhiên, khi gọi phương thức này trực tiếp:

- Không có sự kiện {{domxref("HTMLFormElement/submit_event", "submit")}} nào được kích hoạt. Đặc biệt, trình xử lý sự kiện `onsubmit` của biểu mẫu không được chạy.
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) không được kích hoạt.

Phương thức {{domxref("HTMLFormElement.requestSubmit()")}} giống hệt với việc kích hoạt nút gửi {{HtmlElement("button")}} của biểu mẫu và không có các khác biệt này.

Một điều khiển biểu mẫu (chẳng hạn như nút submit) có `name` hoặc `id` là `submit` sẽ che khuất phương thức `submit` của biểu mẫu. Việc cố gắng gọi `myForm.submit();` sẽ ném lỗi "submit is not a function" vì trong trường hợp này `submit` trỏ đến điều khiển biểu mẫu có `name` hoặc `id` là `submit`.

{{HtmlElement("input")}} với thuộc tính type="submit" sẽ không được gửi cùng biểu mẫu khi sử dụng **`HTMLFormElement.submit()`**, nhưng nó sẽ được gửi khi bạn thực hiện bằng cách gửi biểu mẫu HTML gốc.

## Cú pháp

```js-nolint
submit()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
document.forms["my-form"].submit();
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
