---
title: <script>
slug: Web/SVG/Reference/Element/script
page-type: svg-element
browser-compat: svg.elements.script
sidebar: svgref
---

**`<script>`** [SVG](/en-US/docs/Web/SVG) cho phép thêm script vào một tài liệu SVG.

> [!NOTE]
> Mặc dù phần tử `script` của SVG tương đương với phần tử HTML {{HTMLElement('script')}}, nó có một số khác biệt, như dùng thuộc tính {{SVGAttr('href')}} thay vì [`src`](/en-US/docs/Web/HTML/Reference/Elements/script#src) và cho đến nay vẫn chưa hỗ trợ ECMAScript modules (Xem phần tương thích trình duyệt bên dưới để biết chi tiết).

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- [`crossorigin`](/en-US/docs/Web/HTML/Reference/Elements/script#crossorigin)
  - : Thuộc tính này định nghĩa [cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) như được định nghĩa cho phần tử HTML {{HTMLElement('script')}}.
    _Kiểu giá trị_: [**[ anonymous | use-credentials ]?**](/en-US/docs/Web/CSS/Reference/Values/string); _Giá trị mặc định_: `?`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("fetchpriority")}} {{experimental_inline}} {{non-standard_inline}}
  - : Cung cấp gợi ý về mức độ ưu tiên tương đối khi lấy một script bên ngoài.
    Các giá trị được phép:
    - `high`
      - : Lấy script bên ngoài với mức ưu tiên cao so với các script bên ngoài khác.
    - `low`
      - : Lấy script bên ngoài với mức ưu tiên thấp so với các script bên ngoài khác.
    - `auto`
      - : Không đặt ưu tiên cho việc lấy.
        Giá trị này được dùng nếu không có giá trị nào hoặc giá trị không hợp lệ được đặt.
        Đây là giá trị mặc định.
- {{SVGAttr("href")}}
  - : {{Glossary("URL")}} tới script cần tải.
    _Kiểu giá trị_: **[\<URL>](/en-US/docs/Web/SVG/Guides/Content_type#url)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("type")}}
  - : Thuộc tính này định nghĩa kiểu ngôn ngữ script cần dùng.
    _Kiểu giá trị_: [**`<media-type>`**](/en-US/docs/Glossary/MIME_type); _Giá trị mặc định_: `application/ecmascript`; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("xlink:href")}} {{deprecated_inline}}
  - : {{Glossary("URL")}} tới script cần tải.
    _Kiểu giá trị_: **[\<URL>](/en-US/docs/Web/SVG/Guides/Content_type#url)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGScriptElement")}}.

## Ví dụ

```html
Nhấp vào hình tròn để đổi màu.
<svg
  viewBox="0 0 10 10"
  height="120px"
  width="120px"
  xmlns="http://www.w3.org/2000/svg">
  <circle cx="5" cy="5" r="4" />

  <script>
    // <![CDATA[
    function getColor() {
      const R = Math.round(Math.random() * 255)
        .toString(16)
        .padStart(2, "0");

      const G = Math.round(Math.random() * 255)
        .toString(16)
        .padStart(2, "0");

      const B = Math.round(Math.random() * 255)
        .toString(16)
        .padStart(2, "0");

      return `#${R}${G}${B}`;
    }

    document.querySelector("circle").addEventListener("click", (e) => {
      e.target.style.fill = getColor();
    });
    // ]]>
  </script>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- thuộc tính {{SVGAttr("fetchpriority")}}
- [`script` element in HTML](/en-US/docs/Web/HTML/Reference/Elements/script)
