---
title: id
slug: Web/SVG/Reference/Attribute/id
page-type: svg-attribute
browser-compat: svg.global_attributes.id
sidebar: svgref
---

Thuộc tính **`id`** gán một tên duy nhất cho một phần tử.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Ví dụ

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg">
  <style>
    <![CDATA[
      #smallRect {
        stroke: #000066;
        fill: #00cc00;
      }
    ]]>
  </style>

  <rect id="smallRect" x="10" y="10" width="100" height="100" />
</svg>
```

{{EmbedLiveSample("Example", "120", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>&#x3C;id></td>
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

- \<id>
  - : Chỉ định ID của phần tử. ID phải duy nhất trong cây nút, không được là chuỗi rỗng, và không được chứa ký tự khoảng trắng.

    > [!NOTE]
    > Bạn nên tránh dùng các giá trị `id` có thể được phân tích như một đặc tả view SVG (ví dụ: `MyDrawing.svg#svgView(viewBox(0,200,1000,1000))`) hoặc một media fragment cơ bản khi được dùng làm fragment đích của URL.

    Nó phải hợp lệ trong tài liệu XML. Một tài liệu SVG độc lập dùng cú pháp XML 1.0, cú pháp này quy định rằng ID hợp lệ chỉ bao gồm các ký tự được chỉ định (chữ cái, chữ số, và một số dấu câu), và không được bắt đầu bằng chữ số, dấu chấm (.) hoặc dấu gạch ngang (-).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTML `id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id)
- {{SVGAttr("class")}}
