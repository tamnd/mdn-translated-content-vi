---
title: Boolean attribute (HTML)
slug: Glossary/Boolean/HTML
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thuộc tính boolean** trong {{Glossary("HTML")}} là một {{glossary("attribute", "thuộc tính")}} đại diện cho các giá trị `true` hoặc `false`. Nếu một thẻ HTML chứa thuộc tính boolean — bất kể giá trị của thuộc tính đó là gì — thì thuộc tính đó được đặt thành `true` trên phần tử đó. Nếu một thẻ HTML không chứa thuộc tính, thì thuộc tính đó được đặt thành `false`.

Nếu thuộc tính có mặt, nó có thể có một trong các dạng sau:

- Chỉ có tên thuộc tính; ví dụ: `attribute`, có nghĩa là giá trị ngầm định của nó là chuỗi rỗng
- Thuộc tính với giá trị là chuỗi rỗng; ví dụ: `attribute=""`
- Thuộc tính với giá trị là chính tên của thuộc tính đó, không có khoảng trắng đầu hay cuối và không phân biệt chữ hoa/thường; ví dụ: `attribute="attribute"`, `attribute="ATTRIBUTE"`

> [!NOTE]
> Các chuỗi "true" và "false" là các giá trị không hợp lệ. Để đặt thuộc tính thành `false`, thuộc tính phải được bỏ hoàn toàn. Mặc dù các trình duyệt hiện đại coi _bất kỳ_ giá trị chuỗi nào là `true`, bạn không nên dựa vào hành vi đó.

Dưới đây là ví dụ về thuộc tính boolean HTML `checked`:

```html
<!-- Các checkbox sau sẽ được chọn khi hiển thị ban đầu -->
<input type="checkbox" checked />
<input type="checkbox" checked="" />
<input type="checkbox" checked="checked" />
<input type="checkbox" checked="Checked" />

<!-- Checkbox sau sẽ không được chọn khi hiển thị ban đầu -->
<input type="checkbox" />
```

## Xem thêm

- [Boolean attributes](/en-US/docs/Web/HTML/Reference/Attributes#boolean_attributes)
- [Boolean attributes](https://html.spec.whatwg.org/#boolean-attributes) trong đặc tả HTML
- Các thuật ngữ liên quan:
  - {{Glossary("Attribute")}}
  - {{Glossary("Enumerated", "Enumerated attribute")}}
