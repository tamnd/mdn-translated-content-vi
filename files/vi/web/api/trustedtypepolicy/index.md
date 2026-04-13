---
title: TrustedTypePolicy
slug: Web/API/TrustedTypePolicy
page-type: web-api-interface
browser-compat: api.TrustedTypePolicy
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Giao diện **`TrustedTypePolicy`** của {{domxref("Trusted Types API", "", "", "nocode")}} xác định một nhóm hàm tạo ra các đối tượng `TrustedType`.

Một đối tượng `TrustedTypePolicy` được tạo bởi {{domxref("TrustedTypePolicyFactory.createPolicy","TrustedTypePolicyFactory.createPolicy()")}} để xác định chính sách cho việc thực thi các quy tắc bảo mật trên đầu vào. Do đó, `TrustedTypePolicy` không có hàm khởi tạo.

## Thuộc tính phiên bản

- {{domxref("TrustedTypePolicy.name")}} {{ReadOnlyInline}}
  - : Chuỗi chứa tên của chính sách.

## Phương thức phiên bản

- {{domxref("TrustedTypePolicy.createHTML","TrustedTypePolicy.createHTML()")}}
  - : Tạo đối tượng {{domxref("TrustedHTML")}}.
- {{domxref("TrustedTypePolicy.createScript","TrustedTypePolicy.createScript()")}}
  - : Tạo đối tượng {{domxref("TrustedScript")}}.
- {{domxref("TrustedTypePolicy.createScriptURL","TrustedTypePolicy.createScriptURL()")}}
  - : Tạo đối tượng {{domxref("TrustedScriptURL")}}.

## Ví dụ

Trong ví dụ dưới đây, chúng ta tạo một chính sách sẽ tạo các đối tượng {{domxref("TrustedHTML")}} sử dụng {{domxref("TrustedTypePolicyFactory.createPolicy()")}}. Sau đó chúng ta có thể sử dụng {{domxref("TrustedTypePolicy.createHTML")}} để tạo một chuỗi HTML đã được làm sạch để chèn vào tài liệu.

Giá trị đã được làm sạch sau đó có thể được sử dụng với {{domxref("Element.innerHTML")}} để đảm bảo không có phần tử HTML mới nào có thể được chèn vào.

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
