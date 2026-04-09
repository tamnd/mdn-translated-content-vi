---
title: HTML translate global attribute
short-title: translate
slug: Web/HTML/Reference/Global_attributes/translate
page-type: html-attribute
browser-compat: html.global_attributes.translate
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`translate`** là thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) dùng để chỉ định xem các giá trị _thuộc tính có thể dịch_ của phần tử và các node con {{domxref("Text")}} của nó có nên được dịch khi trang được bản địa hóa hay không, hay để chúng không thay đổi.

Thuộc tính có thể có các giá trị sau:

- Chuỗi rỗng hoặc `yes`, cho biết phần tử nên được dịch khi trang được bản địa hóa.
- `no`, cho biết phần tử không được dịch.

Mặc dù không phải tất cả các trình duyệt đều nhận ra thuộc tính này, nhưng nó được các hệ thống dịch tự động như Google Translate tôn trọng, và cũng có thể được tôn trọng bởi các công cụ được sử dụng bởi các dịch giả. Do đó điều quan trọng là các tác giả web phải sử dụng thuộc tính này để đánh dấu nội dung không nên được dịch.

## Ví dụ

Trong ví dụ này, thuộc tính `translate` được dùng để yêu cầu các công cụ dịch không dịch tên thương hiệu của công ty trong phần footer.

```html
<footer>
  <small>© 2020 <span translate="no">BrandName</span></small>
</footer>
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- Thuộc tính {{domxref("HTMLElement.translate")}} phản ánh thuộc tính này.
- [Using HTML's translate attribute](https://www.w3.org/International/questions/qa-translate-flag).
- Thuộc tính HTML [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)
