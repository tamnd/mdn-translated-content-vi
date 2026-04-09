---
title: tabindex
slug: Web/SVG/Reference/Attribute/tabindex
page-type: svg-attribute
browser-compat: svg.global_attributes.tabindex
sidebar: svgref
---

Thuộc tính **`tabindex`** cho phép bạn kiểm soát việc một phần tử có thể nhận focus hay không và xác định thứ tự tương đối của phần tử cho mục đích điều hướng focus tuần tự.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<?xml version="1.0"?>
<svg viewBox="0 0 260 260" xmlns="http://www.w3.org/2000/svg">
  <circle r="10" tabindex="0" fill="green" cx="60" cy="60" />
  <circle r="40" tabindex="0" fill="red" cx="60" cy="160" />
  <circle r="60" tabindex="0" fill="blue" cx="160" cy="60" />
  <circle r="20" tabindex="0" fill="black" cx="160" cy="160" />
</svg>
```

{{EmbedLiveSample("Example", "260", "260")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <a href="https://html.spec.whatwg.org/multipage/common-microsyntaxes.html#valid-integer">số nguyên hợp lệ</a>
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

- số nguyên hợp lệ
  - : Thứ tự tương đối của phần tử cho mục đích điều hướng focus tuần tự.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTML `tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
