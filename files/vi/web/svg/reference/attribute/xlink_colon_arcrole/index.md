---
title: xlink:arcrole
slug: Web/SVG/Reference/Attribute/xlink:arcrole
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.xlink_arcrole
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`xlink:arcrole`** chỉ định một vai trò ngữ cảnh cho phần tử và tương ứng với khái niệm thuộc tính trong [RDF Primer](https://www.w3.org/TR/rdf-primer/).

Vai trò ngữ cảnh này có thể khác với ý nghĩa của tài nguyên khi xét ngoài ngữ cảnh của cung liên kết cụ thể này. Ví dụ, một tài nguyên có thể nói chung biểu thị một "người", nhưng trong ngữ cảnh của một cung cụ thể, nó có thể đóng vai trò "mẹ" và trong ngữ cảnh của một cung khác, nó có thể đóng vai trò "con gái".

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
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#iri">&#x3C;iri></a></code
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

- `<iri>`
  - : Giá trị này chỉ định một tham chiếu [IRI](/en-US/docs/Web/SVG/Guides/Content_type#iri) xác định một tài nguyên mô tả thuộc tính dự định.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Định nghĩa của thuộc tính `xlink:arcrole` trong đặc tả XLink](https://www.w3.org/TR/xlink/#link-semantics)
