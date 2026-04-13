---
title: "HTMLScriptElement: thuộc tính referrerPolicy"
short-title: referrerPolicy
slug: Web/API/HTMLScriptElement/referrerPolicy
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.referrerPolicy
---

{{APIRef("HTML DOM")}}

Thuộc tính **`referrerPolicy`** của giao diện
{{domxref("HTMLScriptElement")}} phản ánh HTML
[`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/script#referrerpolicy) của phần tử {{HTMLElement("script")}}, xác định cách referrer được đặt khi tìm nạp tập lệnh và bất kỳ tập lệnh nào mà nó nhập.

## Giá trị

Một chuỗi; một trong các giá trị sau:

- `no-referrer`
  - : Tiêu đề {{HTTPHeader("Referer")}} sẽ bị bỏ qua hoàn toàn. Không có thông tin referrer nào được gửi cùng với các yêu cầu.
- `no-referrer-when-downgrade`
  - : URL được gửi
    như một referrer khi mức bảo mật giao thức duy trì giống nhau (ví dụ HTTP->HTTP,
    HTTPS->HTTPS), nhưng không được gửi đến đích kém bảo mật hơn (ví dụ HTTPS->HTTP).
- `origin`
  - : Chỉ gửi origin của tài liệu như referrer trong mọi trường hợp.
    Tài liệu `https://example.com/page.html` sẽ gửi referrer
    `https://example.com/`.
- `origin-when-cross-origin`
  - : Gửi URL đầy đủ khi thực hiện yêu cầu same-origin, nhưng chỉ gửi origin của
    tài liệu trong các trường hợp khác.
- `same-origin`
  - : Referrer sẽ được gửi cho [same-site origins](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nhưng
    các yêu cầu cross-origin sẽ không chứa thông tin referrer.
- `strict-origin`
  - : Chỉ gửi origin của tài liệu như referrer khi mức bảo mật giao thức
    duy trì giống nhau (ví dụ HTTPS->HTTPS), nhưng không gửi đến đích kém bảo mật hơn
    (ví dụ HTTPS->HTTP).
- `strict-origin-when-cross-origin` (mặc định)
  - : Đây là hành vi mặc định của user agent nếu không có chính sách nào được chỉ định. Gửi URL đầy đủ khi thực hiện yêu cầu same-origin, chỉ gửi origin khi
    mức bảo mật giao thức duy trì giống nhau (ví dụ HTTPS->HTTPS), và không gửi tiêu đề đến
    đích kém bảo mật hơn (ví dụ HTTPS->HTTP).
- `unsafe-url`
  - : Gửi URL đầy đủ khi thực hiện yêu cầu same-origin hoặc cross-origin. Chính sách này
    sẽ làm lộ origin và đường dẫn từ các tài nguyên được bảo vệ bởi TLS đến các origin không an toàn.
    Hãy cân nhắc kỹ tác động của cài đặt này.

> [!NOTE]
> Giá trị chuỗi rỗng (`""`) vừa là giá trị
> mặc định, vừa là giá trị dự phòng nếu `referrerpolicy` không được hỗ trợ. Nếu
> `referrerpolicy` không được chỉ định rõ ràng trên
> phần tử `<script>`, nó sẽ áp dụng chính sách referrer cấp cao hơn,
> tức là chính sách được đặt trên toàn bộ tài liệu hoặc domain. Nếu không có chính sách cấp cao hơn nào
> khả dụng, chuỗi rỗng được xử lý như tương đương với
> `no-referrer-when-downgrade`.

## Ví dụ

```js
const scriptElem = document.createElement("script");
scriptElem.src = "/";
scriptElem.referrerPolicy = "unsafe-url";
document.body.appendChild(scriptElem);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLIFrameElement.referrerPolicy")}}
