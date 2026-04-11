---
title: "HTMLImageElement: align property"
short-title: align
slug: Web/API/HTMLImageElement/align
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLImageElement.align
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính _deprecated_ **`align`** của giao diện {{domxref("HTMLImageElement")}} là một chuỗi cho biết cách định vị hình ảnh so với vùng chứa nó. Nó phản ánh thuộc tính nội dung [`align`](/en-US/docs/Web/HTML/Reference/Elements/img#align) của phần tử `<img>`.

Thay vào đó, bạn nên sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, trên thực tế, thuộc tính này cũng hoạt động trên hình ảnh mặc dù tên của nó là như vậy. Bạn cũng có thể sử dụng thuộc tính {{cssxref("float")}} để di chuyển hình ảnh sang lề trái hoặc lề phải.

## Giá trị

Một chuỗi có giá trị là một trong `top`, `middle`, `bottom`, `left` hoặc `right`. Để biết ý nghĩa của chúng, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#align).

## Ví dụ

### Đặt thuộc tính căn chỉnh

```js example-bad
const img = new Image();
img.src = "example.png";
img.align = "top";
```

Thay vì sử dụng thuộc tính `align` không được dùng nữa, thay vào đó hãy xem xét việc đặt thuộc tính CSS `vertical-align`:

```js example-good
const img = new Image();
img.src = "example.png";
img.style.verticalAlign = "top";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
