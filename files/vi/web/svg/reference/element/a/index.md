---
title: <a>
slug: Web/SVG/Reference/Element/a
page-type: svg-element
browser-compat: svg.elements.a
sidebar: svgref
---

Phần tử **`<a>`** của [SVG](/en-US/docs/Web/SVG) tạo một siêu liên kết tới các trang web khác, tệp, vị trí trong cùng trang, địa chỉ email hoặc bất kỳ URL nào khác. Nó rất giống với phần tử {{htmlelement("a")}} của HTML.

Phần tử `<a>` của SVG là một phần tử vùng chứa, nghĩa là bạn có thể tạo một liên kết bao quanh văn bản (như trong HTML) nhưng cũng có thể bao quanh bất kỳ hình dạng nào.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- [`download`](/en-US/docs/Web/HTML/Reference/Elements/a#download)
  - : Yêu cầu trình duyệt tải xuống một {{Glossary("URL")}} thay vì điều hướng tới nó, để người dùng sẽ được nhắc lưu nó dưới dạng một tệp cục bộ.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("href")}}
  - : {{Glossary("URL")}} hoặc mảnh URL mà siêu liên kết trỏ tới.
    _Kiểu giá trị_: **[\<URL>](/en-US/docs/Web/SVG/Guides/Content_type#url)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**
- [`hreflang`](/en-US/docs/Web/HTML/Reference/Elements/a#hreflang)
  - : Ngôn ngữ tự nhiên của URL hoặc mảnh URL mà siêu liên kết trỏ tới.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- [`interestfor`](/en-US/docs/Web/HTML/Reference/Elements/a#interestfor) {{experimental_inline}} {{non-standard_inline}}
  - : Xác định phần tử `<a>` như một **interest invoker**. Giá trị của nó là `id` của phần tử đích sẽ bị tác động theo một cách nào đó (thường là được hiển thị hoặc ẩn đi) khi sự quan tâm được thể hiện hoặc mất đi trên phần tử invoker (ví dụ, khi rê chuột/không rê chuột hoặc focus/blur nó). Xem [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) để biết thêm chi tiết và ví dụ.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- [`ping`](/en-US/docs/Web/HTML/Reference/Elements/a#ping) {{experimental_inline}}
  - : Một danh sách URL ngăn cách bằng khoảng trắng tới đó, khi siêu liên kết được theo, các yêu cầu {{HTTPMethod("POST")}} với nội dung `PING` sẽ được trình duyệt gửi đi (ở nền). Thường được dùng để theo dõi. Đối với một tính năng được hỗ trợ rộng hơn nhằm giải quyết cùng các trường hợp sử dụng, xem {{domxref("Navigator.sendBeacon()")}}.
    _Kiểu giá trị_: **[\<list-of-URLs>](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/a#referrerpolicy)
  - : Chỉ định [referrer](/en-US/docs/Web/HTTP/Reference/Headers/Referer) nào sẽ được gửi khi tìm nạp {{Glossary("URL")}}.
    _Kiểu giá trị_: `no-referrer` | `no-referrer-when-downgrade` | `same-origin` | `origin` | `strict-origin` | `origin-when-cross-origin` | `strict-origin-when-cross-origin` | `unsafe-url`; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel)
  - : Mối quan hệ của đối tượng đích với đối tượng liên kết.
    _Kiểu giá trị_: **[\<list-of-Link-Types>](/en-US/docs/Web/HTML/Reference/Attributes/rel)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("target")}}
  - : Nơi hiển thị {{Glossary("URL")}} được liên kết tới.
    _Kiểu giá trị_: `_self` | `_parent` | `_top` | `_blank` | **\<XML-Name>**; _Giá trị mặc định_: `_self`; _Có thể hoạt ảnh_: **có**
- [`type`](/en-US/docs/Web/HTML/Reference/Elements/a#type)
  - : Một {{Glossary("MIME type")}} cho URL được liên kết.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("xlink:href")}} {{deprecated_inline}}
  - : URL hoặc mảnh URL mà siêu liên kết trỏ tới. Có thể cần cho khả năng tương thích ngược với các trình duyệt cũ.
    _Kiểu giá trị_: **[\<URL>](/en-US/docs/Web/SVG/Guides/Content_type#url)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGAElement")}}.

## Ví dụ

```css hidden
@namespace svg url("http://www.w3.org/2000/svg");
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Một liên kết bao quanh một hình dạng -->
  <a href="/docs/Web/SVG/Reference/Element/circle">
    <circle cx="50" cy="40" r="35" />
  </a>

  <!-- Một liên kết bao quanh văn bản -->
  <a href="/docs/Web/SVG/Reference/Element/text">
    <text x="50" y="90" text-anchor="middle">&lt;circle&gt;</text>
  </a>
</svg>
```

```css
/* Vì SVG không cung cấp kiểu hiển thị mặc định cho liên kết,
   nên việc thêm một chút là thực hành tốt */

@namespace svg url("http://www.w3.org/2000/svg");
/* Cần thiết để chỉ chọn các phần tử <a> của SVG, chứ không phải của HTML.
   Xem cảnh báo bên dưới */

svg|a:link,
svg|a:visited {
  cursor: pointer;
}

svg|a text,
text svg|a {
  fill: blue; /* Ngay cả với văn bản, SVG vẫn dùng fill thay cho color */
  text-decoration: underline;
}

svg|a:hover,
svg|a:active {
  outline: dotted 1px blue;
}
```

{{EmbedLiveSample('Example', 100, 100)}}

> [!WARNING]
> Vì phần tử này dùng chung tên thẻ với [phần tử HTML `<a>`](/en-US/docs/Web/HTML/Reference/Elements/a), việc chọn `a` bằng CSS hoặc {{domxref("Document.querySelector", "querySelector")}} có thể áp dụng cho sai loại phần tử. Hãy thử quy tắc {{cssxref("@namespace")}} để phân biệt hai loại.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{SVGAttr("xlink:title")}}
- Phần tử HTML {{HTMLElement("a")}}
