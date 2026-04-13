---
title: "HTMLIFrameElement: thuộc tính referrerPolicy"
short-title: referrerPolicy
slug: Web/API/HTMLIFrameElement/referrerPolicy
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.referrerPolicy
---

{{APIRef("HTML DOM")}}

Thuộc tính
**`HTMLIFrameElement.referrerPolicy`**
phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/iframe#referrerpolicy) của phần tử {{HTMLElement("iframe")}} xác định referrer nào được gửi khi lấy tài nguyên.

## Giá trị

- `no-referrer`
  - : Tiêu đề {{HTTPHeader("Referer")}} sẽ bị bỏ qua hoàn toàn. Không có thông tin referrer nào được gửi cùng với các yêu cầu.
- `no-referrer-when-downgrade`
  - : URL được gửi dưới dạng referrer khi mức độ bảo mật giao thức giữ nguyên (HTTP→HTTP, HTTPS→HTTPS), nhưng không được gửi đến đích kém bảo mật hơn (HTTPS→HTTP).
- `origin`
  - : Chỉ gửi nguồn gốc của tài liệu làm referrer trong mọi trường hợp.
    Tài liệu `https://example.com/page.html` sẽ gửi referrer `https://example.com/`.
- `origin-when-cross-origin`
  - : Gửi một URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, nhưng chỉ gửi nguồn gốc của tài liệu cho các trường hợp khác.
- `same-origin`
  - : Một referrer sẽ được gửi cho các [nguồn gốc cùng trang](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nhưng các yêu cầu khác nguồn gốc sẽ không chứa thông tin referrer.
- `strict-origin`
  - : Chỉ gửi nguồn gốc của tài liệu làm referrer khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), nhưng không gửi nó đến đích kém bảo mật hơn (HTTPS→HTTP).
- `strict-origin-when-cross-origin` (mặc định)
  - : Đây là hành vi mặc định của user agent nếu không có chính sách nào được chỉ định. Gửi một URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, chỉ gửi nguồn gốc khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), và không gửi tiêu đề nào đến đích kém bảo mật hơn (HTTPS→HTTP).
- `unsafe-url`
  - : Gửi một URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc hoặc khác nguồn gốc.

    > [!NOTE]
    > Chính sách này sẽ rò rỉ nguồn gốc và đường dẫn từ các tài nguyên được bảo vệ TLS
    > đến các nguồn gốc không an toàn. Hãy cân nhắc kỹ tác động của cài đặt này.

## Ví dụ

```js
const iframe = document.createElement("iframe");
iframe.src = "/";
iframe.referrerPolicy = "unsafe-url";
const body = document.querySelector("body");
body.appendChild(iframe); // Lấy image bằng cách sử dụng URL đầy đủ làm referrer
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAnchorElement.referrerPolicy")}},
  {{domxref("HTMLAreaElement.referrerPolicy")}}, và
  {{domxref("HTMLAreaElement.referrerPolicy")}}.
