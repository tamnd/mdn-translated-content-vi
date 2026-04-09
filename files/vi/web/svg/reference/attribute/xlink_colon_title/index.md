---
title: xlink:title
slug: Web/SVG/Reference/Attribute/xlink:title
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.xlink_title
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`xlink:title`** được dùng để mô tả ý nghĩa của một liên kết hoặc tài nguyên theo cách mà con người có thể đọc được.

Việc sử dụng thông tin này phụ thuộc rất nhiều vào kiểu xử lý đang được thực hiện. Ví dụ, nó có thể được dùng để cung cấp tiêu đề cho các ứng dụng dùng bởi người khiếm thị, để tạo một bảng liên kết, hoặc để hiển thị văn bản trợ giúp xuất hiện khi người dùng đưa con trỏ chuột lên một tài nguyên bắt đầu.

> [!NOTE]
> Nội dung mới nên dùng phần tử con {{SVGElement("title")}} thay vì thuộc tính `xlink:title`.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("feImage")}}
- {{SVGElement("filter")}}
- {{SVGElement("image")}}
- {{SVGElement("linearGradient")}}
- {{SVGElement("mpath")}}
- {{SVGElement("pattern")}}
- {{SVGElement("radialGradient")}}
- {{SVGElement("script")}}
- {{SVGElement("set")}}
- {{SVGElement("textPath")}}
- {{SVGElement("use")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#anything"
            >&#x3C;anything></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<anything>`
  - : Giá trị này chỉ định tiêu đề dùng để mô tả ý nghĩa của liên kết hoặc tài nguyên.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
