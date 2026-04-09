---
title: target
slug: Web/SVG/Reference/Attribute/target
page-type: svg-attribute
browser-compat: svg.elements.a.target
sidebar: svgref
---

Thuộc tính **`target`** nên được dùng khi có nhiều mục tiêu khả dĩ cho tài nguyên kết thúc, chẳng hạn khi tài liệu cha được nhúng trong một tài liệu HTML hoặc XHTML, hoặc được xem bằng trình duyệt có tab. Thuộc tính này chỉ định tên của browsing context (ví dụ: một tab trình duyệt hoặc một phần tử iframe hay object (X)HTML) mà một tài liệu sẽ được mở vào khi liên kết được kích hoạt:

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("a")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}

text {
  font:
    20px "Helvetica",
    "Arial",
    sans-serif;
  fill: blue;
  text-decoration: underline;
}
```

```html
<svg viewBox="0 0 300 120" xmlns="http://www.w3.org/2000/svg">
  <a href="https://developer.mozilla.org" target="_self">
    <text x="0" y="20">Open link within iframe</text>
  </a>
  <a href="https://developer.mozilla.org" target="_blank">
    <text x="0" y="60">Open link in new tab or window</text>
  </a>
  <a href="https://developer.mozilla.org" target="_top">
    <text x="0" y="100">Open link in this tab or window</text>
  </a>
</svg>
```

{{EmbedLiveSample("Example", "300", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>_self</code> | <code>_parent</code> | <code>_top</code> |
        <code>_blank</code> | <code>&#x3C;XML-Name></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>_self</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `_replace` {{deprecated_inline}}
  - : Hình SVG hiện tại được thay thế bằng nội dung được liên kết trong cùng một vùng hình chữ nhật, trong cùng một khung như hình SVG hiện tại.

    > [!NOTE]
    > Giá trị này chưa bao giờ được triển khai tốt, và sự khác biệt giữa `_replace` và `_self` đã trở nên dư thừa do các thay đổi trong định nghĩa HTML về browsing context. Hãy dùng `_self` để thay thế tài liệu SVG hiện tại.

- `_self`
  - : Hình SVG hiện tại được thay thế bằng nội dung được liên kết trong cùng browsing context với hình SVG hiện tại.
- `_parent`
  - : Browsing context cha trực tiếp của hình SVG sẽ được thay thế bằng nội dung được liên kết, nếu nó tồn tại và có thể được truy cập an toàn từ tài liệu này.
- `_top`
  - : Nội dung của toàn bộ cửa sổ hoặc tab đang hoạt động sẽ được thay thế bằng nội dung được liên kết, nếu nó tồn tại và có thể được truy cập an toàn từ tài liệu này
- `_blank`
  - : Một cửa sổ hoặc tab mới, không tên được yêu cầu để hiển thị nội dung được liên kết, nếu tài liệu này có thể làm điều đó một cách an toàn. Nếu user agent không hỗ trợ nhiều cửa sổ/tab, kết quả giống như \_top.
- `<XML-Name>`
  - : Chỉ định tên của browsing context (tab, inline frame, object, v.v.) để hiển thị nội dung được liên kết. Nếu một browsing context với tên này đã tồn tại, và có thể được truy cập an toàn từ tài liệu này, nó sẽ được dùng lại, thay thế nội dung hiện có. Nếu nó không tồn tại, nó sẽ được tạo ra (giống như '\_blank', ngoại trừ việc nó có tên). Tên phải là một XML Name hợp lệ \[XML11], và không nên bắt đầu bằng dấu gạch dưới (ký tự U+005F LOW LINE), để đáp ứng các yêu cầu về tên browsing context hợp lệ từ HTML.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
