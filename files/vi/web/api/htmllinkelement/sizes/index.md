---
title: "HTMLLinkElement: thuộc tính sizes"
short-title: sizes
slug: Web/API/HTMLLinkElement/sizes
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.sizes
---

{{APIRef("HTML DOM")}}

Thuộc tính **`sizes`** chỉ đọc của giao diện {{domxref("HTMLLinkElement")}} xác định kích thước của các biểu tượng cho phương tiện trực quan chứa trong tài nguyên. Nó phản ánh thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/link#sizes) của phần tử {{HTMLElement("link")}}, nhận danh sách các kích thước được phân tách bằng dấu cách, mỗi kích thước theo định dạng `<chiều_rong_pixel>x<chiều_cao_pixel>`, hoặc từ khóa `any`.

Nó chỉ liên quan nếu {{domxref("HTMLLinkElement.rel", "rel")}} là `icon` hoặc một loại không chuẩn như `apple-touch-icon`.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}}.

Mặc dù bản thân thuộc tính `sizes` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `sizes`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}}, và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```html
<link rel="icon" sizes="72x72 114x114" href="smallish.ico" />
```

```js
const link = document.querySelector("[rel=icon],[rel=apple-touch-icon]");
console.dir(link.sizes); /* output:
  DOMTokenList [ "72x72", "114x114" ]
    0: "72x72"
    1: "114x114"
    length: 2
    value: "72x72 114x114"
  */
console.log(link.sizes.value); // output: '72x72 114x114'
console.log(link.sizes.length); // output: 2'
console.log(link.sizes[0]); // output: '72x72'
console.log(link.sizes[1]); // output: '114x114'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.rel")}}
- {{domxref("HTMLLinkElement.relList")}}
- {{domxref("HTMLLinkElement.type")}}
- {{domxref("HTMLLinkElement.href")}}
- {{HTMLElement("link")}}
- Thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel)
