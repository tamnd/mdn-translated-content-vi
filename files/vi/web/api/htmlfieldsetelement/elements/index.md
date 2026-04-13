---
title: "HTMLFieldSetElement: thuộc tính elements"
short-title: elements
slug: Web/API/HTMLFieldSetElement/elements
page-type: web-api-instance-property
browser-compat: api.HTMLFieldSetElement.elements
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`elements`** của giao diện {{domxref("HTMLFieldSetElement")}} trả về một đối tượng {{domxref("HTMLCollection")}} chứa tất cả các phần tử điều khiển form ({{htmlelement("button")}}, {{htmlelement("fieldset")}}, {{htmlelement("input")}}, {{htmlelement("object")}}, {{htmlelement("output")}}, {{htmlelement("select")}}, và {{htmlelement("textarea")}}) là con cháu của field set này.

Bạn có thể truy cập một điều khiển form cụ thể trong collection được trả về bằng cách sử dụng chỉ mục hoặc thuộc tính `name` hay `id` của phần tử. Nếu nhiều điều khiển form có cùng tên, như thường gặp với một nhóm radio button, việc sử dụng tên chung sẽ trả về phần tử đầu tiên có giá trị đó.

## Giá trị

Một {{domxref("HTMLCollection")}}.

## Ví dụ

```html
<form id="my-form">
  <fieldset id="my-fieldset">
    <legend>Fieldset của tôi</legend>
    <p>
      <label for="username">Tên đăng nhập:</label>
      <input type="text" id="username" name="username" />
    </p>
    <p>
      <label for="password">Mật khẩu:</label>
      <input type="password" id="password" name="password" />
    </p>
    <p>
      <input type="checkbox" id="remember-me" name="remember-me" />
      <label for="remember-me">Ghi nhớ tôi</label>
    </p>
  </fieldset>
</form>
```

```js
const fieldset = document.getElementById("my-fieldset");
console.log(fieldset.elements.length); // 3
console.log(fieldset.elements["remember-me"].value); // "on"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFieldSetElement")}}
- {{domxref("HTMLFormElement.elements")}}
- {{HTMLElement("fieldset")}}
