---
title: "HTMLImageElement: longDesc property"
short-title: longDesc
slug: Web/API/HTMLImageElement/longDesc
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLImageElement.longDesc
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính _deprecated_ **`longDesc`** của giao diện {{domxref("HTMLImageElement")}} chỉ định URL của tệp văn bản hoặc HTML chứa mô tả dạng dài của hình ảnh. Điều này có thể được sử dụng để cung cấp các chi tiết bổ sung tùy chọn ngoài mô tả ngắn được cung cấp trong thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title). Nó phản ánh thuộc tính nội dung [`longdesc`](/en-US/docs/Web/HTML/Reference/Elements/img#longdesc) của phần tử `<img>`.

Thuộc tính này được coi là lỗi thời trong [thông số HTML](https://html.spec.whatwg.org/multipage/obsolete.html#element-attrdef-img-longdesc). Nó có một tương lai không chắc chắn; tác giả nên sử dụng một giải pháp thay thế {{glossary("WAI")}}-{{glossary("ARIA")}} chẳng hạn như [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) hoặc [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details). Bạn cũng có thể gói gọn hình ảnh trong một liên kết bằng phần tử {{HTMLElement("a")}}.

## Giá trị

Một chuỗi có thể là chuỗi trống (cho biết không có mô tả dài) hoặc URL của tệp chứa mô tả dạng dài về nội dung của hình ảnh.

## Ví dụ

Hãy xem xét HTML cũ hơn sau:

```html
<img
  src="taco-tuesday.jpg"
  alt="Taco Tuesday"
  longdesc="image-descriptions/taco-tuesday.html" />
```

Ở đây, `longDesc` được sử dụng để chỉ ra rằng người dùng có thể truy cập mô tả chi tiết về hình ảnh `taco-tuesday.jpg` trong tệp HTML `image-descriptions/taco-tuesday.html`.

Điều này sẽ được chuyển đổi thành HTML sau:

```html
<a href="image-descriptions/taco-tuesday.html">
  <img src="taco-tuesday.jpg" alt="Taco Tuesday" />
</a>
```

Cùng với đó, hình ảnh là một liên kết đến tệp HTML mô tả hình ảnh chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details)
