---
title: crossorigin
slug: Web/SVG/Reference/Attribute/crossorigin
page-type: svg-attribute
browser-compat:
  - svg.elements.feImage.crossorigin
  - svg.elements.image.crossorigin
  - svg.elements.script.crossorigin
sidebar: svgref
---

Thuộc tính `crossorigin`, hợp lệ trên các phần tử {{SVGElement("image")}}, {{SVGElement("feImage")}}, và {{SVGElement("script")}}, cung cấp hỗ trợ cấu hình các yêu cầu Cross-Origin Resource Sharing ([CORS](/en-US/docs/Web/HTTP/Guides/CORS)) cho dữ liệu được phần tử đó tải về.

Bảng này cho thấy các từ khóa có thể dùng và ý nghĩa của chúng:

| Từ khóa           | Mô tả                                                                                                      |
| ----------------- | ---------------------------------------------------------------------------------------------------------- |
| `anonymous`       | Các yêu cầu CORS của client cho phần tử này sẽ có cờ thông tin xác thực được đặt thành `'same-origin'`.    |
| `use-credentials` | Các yêu cầu CORS của client cho phần tử này sẽ có cờ thông tin xác thực được đặt thành `'include'`.        |
| `""`              | Đặt tên thuộc tính thành một giá trị rỗng, như `crossorigin` hoặc `crossorigin=""`, giống như `anonymous`. |

Nó tuân theo cùng các quy tắc xử lý như thuộc tính HTML [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin).

## Ví dụ

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <image
    href="https://example.com/mdn_logo_dark.png"
    height="200"
    width="200"
    crossorigin="use-credentials" />
</svg>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
