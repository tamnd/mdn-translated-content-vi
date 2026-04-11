---
title: "HTMLElement: thuộc tính offsetWidth"
short-title: offsetWidth
slug: Web/API/HTMLElement/offsetWidth
page-type: web-api-instance-property
browser-compat: api.HTMLElement.offsetWidth
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`offsetWidth`** của giao diện {{domxref("HTMLElement")}} trả về chiều rộng bố cục của một phần tử dưới dạng số nguyên.

Thông thường, `offsetWidth` là phép đo chiều rộng CSS của phần tử tính bằng pixel, bao gồm bất kỳ đường viền, padding và thanh cuộn dọc nào (nếu được hiển thị). Nó không bao gồm chiều rộng của các phần tử giả như `::before` hoặc `::after`.

Nếu phần tử bị ẩn (ví dụ: bằng cách đặt `style.display` trên phần tử hoặc một trong các tổ tiên của nó thành `"none"`), thì `0` sẽ được trả về.

## Giá trị

Một số nguyên.

## Ví dụ

![Ví dụ phần tử có padding, viền và margin lớn. `offsetWidth` là chiều rộng bố cục của phần tử bao gồm padding và viền, không bao gồm margin.](dimensions-offset.png)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác định kích thước của các phần tử](/en-US/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("Element.clientWidth")}}
- {{domxref("Element.scrollWidth")}}
- {{domxref("HTMLElement.offsetHeight")}}
- {{domxref("HTMLElement.offsetLeft")}}
- {{domxref("HTMLElement.offsetTop")}}
- {{domxref("Element.getBoundingClientRect()")}}
