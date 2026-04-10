---
title: "Document: thuộc tính forms"
short-title: forms
slug: Web/API/Document/forms
page-type: web-api-instance-property
browser-compat: api.Document.forms
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`forms`** của giao diện {{domxref("Document")}} trả về một {{domxref("HTMLCollection")}} liệt kê tất cả các phần tử {{HTMLElement("form")}} chứa trong tài liệu.

> [!NOTE]
> Tương tự, bạn có thể truy cập danh sách các phần tử nhập liệu thành phần của biểu mẫu bằng thuộc tính {{domxref("HTMLFormElement.elements")}}.

Bạn cũng có thể truy cập các phần tử `<form>` đã đặt tên dưới dạng thuộc tính của đối tượng `document`.
Ví dụ: `document["login-form"]` và `document.forms["login-form"]` đều có thể được sử dụng để truy cập biểu mẫu có tên `login-form`.

> [!WARNING]
> Dựa vào mẫu `document["form-name"]` là nguy hiểm và không được khuyến khích vì có thể dẫn đến xung đột không mong muốn với các API hiện có hoặc tương lai trong trình duyệt.
> Ví dụ: nếu trình duyệt giới thiệu thuộc tính `document["login-form"]` tích hợp sẵn trong tương lai, mã của bạn có thể không còn truy cập được phần tử biểu mẫu.
> Để tránh xung đột như vậy, luôn sử dụng `document.forms` để truy cập các biểu mẫu đã đặt tên.

## Giá trị

Một đối tượng {{domxref("HTMLCollection")}} liệt kê tất cả các biểu mẫu của tài liệu.
Mỗi mục trong bộ sưu tập là một {{domxref("HTMLFormElement")}} đại diện cho một phần tử `<form>` duy nhất.

Nếu tài liệu không có biểu mẫu nào, bộ sưu tập trả về sẽ rỗng, với độ dài bằng không.

## Ví dụ

### Lấy thông tin biểu mẫu

```html
<form id="robby">
  <input type="button" value="Biểu mẫu của robby" />
</form>

<form id="dave">
  <input type="button" value="Biểu mẫu của dave" />
</form>

<form id="paul">
  <input type="button" value="Biểu mẫu của paul" />
</form>
```

```js
document.querySelectorAll("input[type=button]").forEach((button, i) => {
  button.addEventListener("click", (event) => {
    console.log(document.forms[i].id);
  });
});
```

### Lấy một phần tử từ bên trong biểu mẫu

```js
const selectForm = document.forms[index];
const selectFormElement = document.forms[index].elements[index];
```

### Truy cập biểu mẫu đã đặt tên

```html
<form name="login">
  <input name="email" type="email" />
  <input name="password" type="password" />
  <button type="submit">Đăng nhập</button>
</form>
```

```js
const loginForm = document.forms.login; // Hoặc document.forms['login']
loginForm.elements.email.placeholder = "test@example.com";
loginForm.elements.password.placeholder = "password";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("form")}} và giao diện {{domxref("HTMLFormElement")}}
