---
title: "HTMLAreaElement: thuộc tính alt"
short-title: alt
slug: Web/API/HTMLAreaElement/alt
page-type: web-api-instance-property
browser-compat: api.HTMLAreaElement.alt
---

{{APIRef("HTML DOM")}}

Thuộc tính **`alt`** của giao diện {{DOMxRef("HTMLAreaElement")}} chỉ định văn bản của siêu liên kết, xác định nhãn văn bản cho liên kết của bản đồ hình ảnh. Nó phản ánh thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/area#alt) của phần tử {{htmlelement("area")}}.

Giá trị `alt` phải là văn bản mà khi được trình bày cùng với văn bản `alt` của các siêu liên kết `<area>` khác trong cùng một {{htmlelement("map")}}, cùng với văn bản `alt` của chính {{htmlelement("img")}}, cung cấp cho người dùng cùng loại lựa chọn như siêu liên kết khi được sử dụng mà không có văn bản nhưng với hình dạng được áp dụng cho hình ảnh.

Nếu {{htmlelement("area")}} là một liên kết (chứa thuộc tính {{DOMxRef("HTMLAreaElement.href", "href")}}), giá trị thuộc tính `alt` nên là một chuỗi không rỗng, cung cấp nhãn cho liên kết sao cho phù hợp nếu hình ảnh không khả dụng. Thuộc tính `alt` cho một `<area>` là liên kết chỉ có thể để trống nếu có một phần tử `<area>` khác trong cùng `<map>` trỏ đến cùng tài nguyên và có thuộc tính `alt` không trống.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const areaElement = document.getElementById("imageArea");
console.log(areaElement.alt);
areaElement.alt = "Mô tả liên kết tốt hơn nhiều";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{DOMXref("HTMLImageElement.alt")}}
- {{DOMXref("HTMLInputElement.alt")}}
- {{DOMXref("HTMLMapElement")}}
- {{HTMLElement("area")}}
- {{HTMLElement("map")}}
- {{HTMLElement("a")}}
- [Văn bản alt tốt, văn bản alt tệ — Làm cho nội dung của bạn có thể nhận biết](https://www.wcag.com/blog/good-alt-text-bad-alt-text-making-your-content-perceivable/) trên WCAG.com (2021)
- [Cây quyết định alt](https://www.w3.org/WAI/tutorials/images/decision-tree/) trên W3C Web Accessibility Initiative (WAI)
