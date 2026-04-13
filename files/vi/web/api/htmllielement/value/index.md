---
title: "HTMLLIElement: thuộc tính value"
short-title: value
slug: Web/API/HTMLLIElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLLIElement.value
---

{{APIRef("HTML DOM")}}

Thuộc tính **`value`** của giao diện {{domxref("HTMLLIElement")}} cho biết vị trí thứ tự của _phần tử danh sách_ trong {{HTMLElement("ol")}} đã cho. Nó có thể nhỏ hơn `0`. Nếu phần tử {{HTMLElement("li")}} không phải là con của phần tử {{HTMLElement("ol")}}, thuộc tính này không có ý nghĩa.

Nó phản ánh thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/li#value) của phần tử {{htmlelement("li")}} tương ứng. Nếu phần tử `<li>` không có thuộc tính nội dung `value` được chỉ định, thuộc tính này trả về `0` theo mặc định ngay cả khi phần tử có thể có giá trị thứ tự được gán tuần tự mặc định khi hiển thị.

## Giá trị

Một số nguyên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
