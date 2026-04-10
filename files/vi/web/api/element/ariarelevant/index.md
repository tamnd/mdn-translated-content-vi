---
title: "Element: thuộc tính ariaRelevant"
short-title: ariaRelevant
slug: Web/API/Element/ariaRelevant
page-type: web-api-instance-property
status:
  - non-standard
browser-compat: api.Element.ariaRelevant
---

{{APIRef("DOM")}}{{Non-standard_Header}}

Thuộc tính **`ariaRelevant`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant), cho biết những thông báo nào user agent sẽ kích hoạt khi cây khả năng tiếp cận trong vùng trực tiếp được sửa đổi. Điều này được sử dụng để mô tả những thay đổi nào trong vùng `aria-live` có liên quan và nên được thông báo.

## Giá trị

Một chuỗi chứa một hoặc nhiều giá trị sau, phân tách bằng dấu cách:

- `"additions"`
  - : Việc thêm các Node Phần tử trong vùng trực tiếp sẽ được coi là có liên quan.
- `"removals"`
  - : Việc xóa các Node khỏi vùng trực tiếp sẽ được coi là có liên quan.
- `"text"`
  - : Các thay đổi đối với nội dung văn bản của các node hiện có sẽ được coi là có liên quan.
- `"all"`
  - : Tương đương với `"additions removals text"`.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant) trên phần tử có ID `text` được đặt thành "all". Sử dụng `ariaRelevant` chúng ta cập nhật giá trị thành "text".

```html
<div
  id="clock"
  role="timer"
  aria-live="polite"
  aria-atomic="true"
  aria-relevant="all"></div>
```

```js
let el = document.getElementById("clock");
console.log(el.ariaRelevant); // all
el.ariaRelevant = "text";
console.log(el.ariaRelevant); // text
```

## Tương thích trình duyệt

{{Compat}}
