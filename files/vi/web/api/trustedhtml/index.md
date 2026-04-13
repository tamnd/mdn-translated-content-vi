---
title: TrustedHTML
slug: Web/API/TrustedHTML
page-type: web-api-interface
browser-compat: api.TrustedHTML
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Giao diện **`TrustedHTML`** của {{domxref("Trusted Types API", "", "", "nocode")}} đại diện cho một chuỗi mà nhà phát triển có thể chèn vào [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) sẽ hiển thị nó như HTML. Các đối tượng này được tạo qua {{domxref("TrustedTypePolicy.createHTML()")}} và do đó không có hàm khởi tạo.

Giá trị của đối tượng `TrustedHTML` được đặt khi đối tượng được tạo và không thể thay đổi bởi JavaScript vì không có setter được hiển thị.

## Phương thức phiên bản

- {{domxref("TrustedHTML.toJSON()")}}
  - : Trả về biểu diễn JSON của dữ liệu được lưu trữ.
- {{domxref("TrustedHTML.toString()")}}
  - : Một chuỗi chứa HTML đã được xử lý an toàn.

## Ví dụ

Trong ví dụ bên dưới, chúng ta tạo chính sách sẽ tạo các đối tượng `TrustedHTML` bằng {{domxref("TrustedTypePolicyFactory.createPolicy()")}}. Sau đó chúng ta có thể sử dụng {{domxref("TrustedTypePolicy.createHTML()")}} để tạo chuỗi HTML được xử lý an toàn để chèn vào tài liệu.

Giá trị đã được xử lý an toàn sau đó có thể được sử dụng với {{domxref("Element.innerHTML")}} để đảm bảo không có phần tử HTML mới nào có thể được chèn vào.

```html
<div id="myDiv"></div>
```

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) => string.replace(/</g, "&lt;"),
});

let el = document.getElementById("myDiv");
const escaped = escapeHTMLPolicy.createHTML("<img src=x onerror=alert(1)>");
console.log(escaped instanceof TrustedHTML); // true
el.innerHTML = escaped;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Prevent DOM-based cross-site scripting vulnerabilities with Trusted Types](https://web.dev/articles/trusted-types)
