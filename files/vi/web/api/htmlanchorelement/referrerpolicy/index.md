---
title: "HTMLAnchorElement: thuộc tính referrerPolicy"
short-title: referrerPolicy
slug: Web/API/HTMLAnchorElement/referrerPolicy
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.referrerPolicy
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLAnchorElement.referrerPolicy`** phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/a#referrerpolicy) của phần tử {{HTMLElement("a")}}, xác định referrer nào được gửi khi lấy tài nguyên.

## Giá trị

Một chuỗi; là một trong các giá trị sau:

- `no-referrer`
  - : Tiêu đề {{HTTPHeader("Referer")}} sẽ bị bỏ qua hoàn toàn. Không có thông tin referrer nào được gửi cùng với các yêu cầu.
- `no-referrer-when-downgrade`
  - : URL được gửi làm referrer khi mức bảo mật giao thức giữ nguyên (ví dụ: HTTP -> HTTP, HTTPS -> HTTPS), nhưng không được gửi đến đích kém bảo mật hơn (ví dụ: HTTPS -> HTTP).
- `origin`
  - : Chỉ gửi nguồn gốc của tài liệu làm referrer trong mọi trường hợp. Tài liệu `https://example.com/page.html` sẽ gửi referrer `https://example.com/`.
- `origin-when-cross-origin`
  - : Gửi một URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, nhưng chỉ gửi nguồn gốc của tài liệu cho các trường hợp khác.
- `same-origin`
  - : Một referrer sẽ được gửi cho [các nguồn gốc cùng trang](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nhưng các yêu cầu khác nguồn gốc sẽ không chứa thông tin referrer.
- `strict-origin`
  - : Chỉ gửi nguồn gốc của tài liệu làm referrer khi mức bảo mật giao thức giữ nguyên (ví dụ: HTTPS -> HTTPS), nhưng không gửi nó đến đích kém bảo mật hơn (ví dụ: HTTPS -> HTTP).
- `strict-origin-when-cross-origin` (mặc định)
  - : Đây là hành vi mặc định của trình duyệt khi không có chính sách nào được chỉ định. Gửi một URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, chỉ gửi nguồn gốc khi mức bảo mật giao thức giữ nguyên (ví dụ: HTTPS -> HTTPS), và không gửi tiêu đề nào đến đích kém bảo mật hơn (ví dụ: HTTPS -> HTTP).
- `unsafe-url`
  - : Gửi một URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc hoặc khác nguồn gốc. Chính sách này sẽ làm rò rỉ nguồn gốc và đường dẫn từ các tài nguyên được bảo vệ TLS đến các nguồn gốc không bảo mật. Hãy cân nhắc cẩn thận tác động của cài đặt này.

## Ví dụ

```js
const elt = document.createElement("a");
const linkText = document.createTextNode("Liên kết của tôi");
elt.appendChild(linkText);
elt.href = "https://developer.mozilla.org/en-US/";
elt.referrerPolicy = "no-referrer";

const div = document.getElementById("divAround");
div.appendChild(elt); // Khi nhấp vào, liên kết sẽ không gửi tiêu đề referrer.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.referrerPolicy")}},
  {{domxref("HTMLAreaElement.referrerPolicy")}}, và
  {{domxref("HTMLIFrameElement.referrerPolicy")}}.
