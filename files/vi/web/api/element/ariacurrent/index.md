---
title: "Element: thuộc tính ariaCurrent"
short-title: ariaCurrent
slug: Web/API/Element/ariaCurrent
page-type: web-api-instance-property
browser-compat: api.Element.ariaCurrent
---

{{APIRef("DOM")}}

Thuộc tính **`ariaCurrent`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-current`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-current), cho biết phần tử đại diện cho mục hiện tại trong vùng chứa hoặc tập hợp các phần tử liên quan.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"page"`
  - : Đại diện cho trang hiện tại trong tập hợp các trang.
- `"step"`
  - : Đại diện cho bước hiện tại trong một quy trình.
- `"location"`
  - : Đại diện cho vị trí hiện tại, ví dụ trang hiện tại trong hệ thống phân cấp breadcrumbs.
- `"date"`
  - : Đại diện cho ngày hiện tại trong tập hợp các ngày.
- `"time"`
  - : Đại diện cho thời gian hiện tại trong tập hợp các thời gian.
- `"true"`
  - : Đại diện cho mục hiện tại trong tập hợp.
- `"false"`
  - : Không đại diện cho mục hiện tại trong tập hợp.

## Ví dụ

Trong ví dụ này, một tập hợp các liên kết được sử dụng để điều hướng trang web. Thuộc tính `aria-current` cho biết trang hiện tại. Giá trị `page` được kết hợp vào thông báo của trình đọc màn hình. Sử dụng `ariaCurrent` chúng ta có thể cập nhật giá trị đó.

```html
<nav>
  <ul>
    <li><a id="link-home" href="/" aria-current="page">Home</a></li>
    <li><a href="/">About</a></li>
    <li><a href="/">Contact</a></li>
  </ul>
</nav>
```

```js
let el = document.getElementById("link-home");
console.log(el.ariaCurrent); // "page"
el.ariaCurrent = "tab";
console.log(el.ariaCurrent); // "tab"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thuộc tính aria-current](https://tink.uk/using-the-aria-current-attribute/)
