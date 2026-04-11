---
title: "HTMLElement: thuộc tính offsetHeight"
short-title: offsetHeight
slug: Web/API/HTMLElement/offsetHeight
page-type: web-api-instance-property
browser-compat: api.HTMLElement.offsetHeight
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`offsetHeight`** của giao diện {{domxref("HTMLElement")}} trả về chiều cao của một phần tử, bao gồm padding dọc và các đường viền, dưới dạng số nguyên.

Thông thường, `offsetHeight` là phép đo chiều cao CSS của phần tử tính bằng pixel, bao gồm bất kỳ đường viền, padding và thanh cuộn ngang nào (nếu được hiển thị). Nó không bao gồm chiều cao của các phần tử giả như `::before` hoặc `::after`. Đối với đối tượng thân tài liệu, phép đo bao gồm tổng chiều cao nội dung tuyến tính thay vì chiều cao CSS của phần tử. Các phần tử nổi kéo dài xuống dưới nội dung tuyến tính khác bị bỏ qua.

Nếu phần tử bị ẩn (ví dụ: bằng cách đặt `style.display` trên phần tử hoặc một trong các tổ tiên của nó thành `"none"`), thì `0` sẽ được trả về.

## Giá trị

Một số nguyên.

## Ví dụ

![Ví dụ phần tử có padding, viền và margin lớn. `offsetHeight` là chiều cao bố cục của phần tử bao gồm padding và viền, không bao gồm margin.](dimensions-offset.png)

Ví dụ hình ảnh trên cho thấy thanh cuộn và `offsetHeight` vừa với cửa sổ. Tuy nhiên, các phần tử không cuộn được có thể có giá trị `offsetHeight` lớn, lớn hơn nhiều so với nội dung hiển thị. Các phần tử này thường được chứa trong các phần tử có thể cuộn; do đó, các phần tử không cuộn được này có thể hoàn toàn hoặc một phần vô hình, tùy thuộc vào cài đặt `scrollTop` của vùng chứa có thể cuộn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác định kích thước của các phần tử](/en-US/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("Element.clientHeight")}}
- {{domxref("Element.scrollHeight")}}
- {{domxref("HTMLElement.offsetWidth")}}
- {{domxref("HTMLElement.offsetLeft")}}
- {{domxref("HTMLElement.offsetTop")}}
- {{domxref("Element.getBoundingClientRect()")}}
