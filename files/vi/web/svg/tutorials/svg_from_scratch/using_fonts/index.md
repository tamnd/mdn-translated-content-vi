---
title: Sử dụng phông chữ trong SVG
slug: Web/SVG/Tutorials/SVG_from_scratch/Using_fonts
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Filter_effects", "Web/SVG/Tutorials/SVG_from_scratch/Image_element") }}

SVG hỗ trợ nhiều cách để chỉ định phông chữ cho các phần tử {{SVGElement("text")}}.
Cách hiện đại được khuyến nghị là dùng CSS, theo cách rất giống với việc bạn tạo kiểu phông chữ trong HTML.

## Áp dụng và tạo kiểu phông chữ bằng CSS

Đoạn mã dưới đây cho thấy cách bạn có thể tạo kiểu cho phần tử `<text>` đã cho bằng một phông chữ cụ thể thông qua CSS: trong trường hợp này là phông hệ thống "Courier New".
Lưu ý rằng CSS ở đây được lồng bên trong phần tử SVG {{SVGElement("style")}}, nhưng cũng có thể được áp dụng trong HTML bao quanh.

```html
<svg>
  <style>
    text {
      /* Specify the system or custom font to use */
      font-family: "Courier New", monospace;

      /* Add other styling */
      font-size: 24px;
      font-weight: bold;
      font-style: italic;
    }
  </style>
  <text x="10" y="20">Some text</text>
</svg>
```

Kết quả hiển thị như dưới đây:

{{EmbedLiveSample("How to apply a font", "100", "30px")}}

## Dùng web font với `@font-face`

Phần trước dùng CSS để áp dụng một phông hệ thống, nhưng bạn cũng có thể áp dụng một web font được chỉ định bằng at-rule {{cssxref("@font-face")}} theo đúng cách tương tự.

Ví dụ này minh họa cách trước hết định nghĩa rồi sau đó sử dụng một họ phông có tên "FiraSans":

```html
<svg
  viewBox="0 0 400 50"
  width="350"
  height="50"
  xmlns="http://www.w3.org/2000/svg">
  <style>
    /* Define the font family using web fonts */
    @font-face {
      font-family: "FiraSans";
      src:
        url("https://mdn.github.io/shared-assets/fonts/FiraSans-Italic.woff2")
          format("woff2"),
        url("https://mdn.github.io/shared-assets/fonts/FiraSans-Bold.woff2")
          format("woff2");
    }

    /* Style the text */
    text {
      /* Specify the system or custom font to use */
      font-family: "FiraSans", sans-serif;

      /* Add other styling */
      font-size: 24px;
      font-weight: bold;
      font-style: italic;
    }
  </style>
  <text x="10" y="20">Text styled with custom font</text>
</svg>
```

{{EmbedLiveSample("Using web fonts with @font-face", "100", "70px")}}

## Tham chiếu kiểu trực tiếp trong phần tử text

Bạn cũng có thể tham chiếu trực tiếp một kiểu bên trong phần tử {{SVGElement("text")}} bằng thuộc tính {{SVGAttr("font-family")}}.
Đoạn mã này cho thấy cách chúng ta có thể áp dụng "My Font" tùy chỉnh cho phần tử `<text>`.

```svg
<svg>
  <text font-family="My Font" x="10" y="20">Text using "My Font" font</text>
</svg>
```

Lưu ý rằng điều này tương tự như việc áp dụng kiểu cho một phần tử HTML.
Mặc dù có những trường hợp nó hữu ích, nhìn chung vẫn tốt hơn khi dùng CSS và các bộ chọn CSS.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Filter_effects", "Web/SVG/Tutorials/SVG_from_scratch/Image_element") }}
