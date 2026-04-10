---
title: "HTMLLinkElement: thuộc tính referrerPolicy"
short-title: referrerPolicy
slug: Web/API/HTMLLinkElement/referrerPolicy
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.referrerPolicy
---

{{APIRef("HTML DOM")}}

Thuộc tính **`referrerPolicy`** của giao diện {{domxref("HTMLLinkElement")}} phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/link#referrerpolicy) của phần tử {{HTMLElement("link")}} xác định referrer nào được gửi khi tải tài nguyên.

Xem tiêu đề HTTP {{HTTPHeader("Referrer-Policy")}} để biết chi tiết.

## Giá trị

Một chuỗi; một trong các giá trị sau:

- `no-referrer`
  - : Tiêu đề {{HTTPHeader("Referer")}} sẽ bị bỏ qua hoàn toàn. Không có thông tin referrer nào được gửi cùng với yêu cầu.
- `no-referrer-when-downgrade`
  - : URL được gửi làm referrer khi mức bảo mật giao thức giữ nguyên (ví dụ: HTTP→HTTP, HTTPS→HTTPS), nhưng không được gửi đến đích kém bảo mật hơn (ví dụ: HTTPS→HTTP).
- `origin`
  - : Chỉ gửi nguồn gốc của tài liệu làm referrer trong mọi trường hợp.
    Tài liệu `https://example.com/page.html` sẽ gửi referrer `https://example.com/`.
- `origin-when-cross-origin`
  - : Gửi URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, nhưng chỉ gửi nguồn gốc của tài liệu cho các trường hợp khác.
- `same-origin`
  - : Một referrer sẽ được gửi cho [các nguồn gốc cùng trang](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nhưng yêu cầu xuyên nguồn gốc sẽ không chứa thông tin referrer.
- `strict-origin`
  - : Chỉ gửi nguồn gốc của tài liệu làm referrer khi mức bảo mật giao thức giữ nguyên (ví dụ: HTTPS→HTTPS), nhưng không gửi đến đích kém bảo mật hơn (ví dụ: HTTPS→HTTP).
- `strict-origin-when-cross-origin` (mặc định)
  - : Đây là hành vi mặc định của trình duyệt khi không có chính sách nào được chỉ định. Gửi URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, chỉ gửi nguồn gốc khi mức bảo mật giao thức giữ nguyên (ví dụ: HTTPS→HTTPS), và không gửi tiêu đề nào đến đích kém bảo mật hơn (ví dụ: HTTPS→HTTP).
- `unsafe-url`
  - : Gửi URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc hoặc xuyên nguồn gốc. Chính sách này sẽ làm rò rỉ nguồn gốc và đường dẫn từ tài nguyên được bảo vệ TLS đến các nguồn gốc không bảo mật. Hãy cân nhắc kỹ tác động của thiết lập này.

## Ví dụ

```js
const links = document.getElementsByTagName("link");
links[0].referrerPolicy; // "no-referrer"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Tiêu đề HTTP {{HTTPHeader("Referrer-Policy")}}
- {{domxref("HTMLAnchorElement.referrerPolicy")}}
- {{domxref("HTMLAreaElement.referrerPolicy")}}
- {{domxref("HTMLIFrameElement.referrerPolicy")}}
- {{domxref("HTMLImageElement.referrerPolicy")}}
