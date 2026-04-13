---
title: "HTMLDetailsElement: name property"
short-title: name
slug: Web/API/HTMLDetailsElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLDetailsElement.name
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`name`** của giao diện {{domxref("HTMLDetailsElement")}} phản ánh thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/details#name) của các phần tử {{htmlelement("details")}}. Nó cho phép nhiều phần tử `<details>` được kết nối với nhau, trong đó chỉ một phần tử `<details>` có thể mở tại một thời điểm. Điều này cho phép các nhà phát triển dễ dàng tạo các tính năng giao diện người dùng như accordion mà không cần scripting.

Thuộc tính name chỉ định tên nhóm. Hãy đặt cùng giá trị name cho nhiều phần tử `<details>` để nhóm chúng lại. Chỉ một trong các phần tử `<details>` được nhóm có thể mở tại một thời điểm. Mở một phần tử sẽ khiến phần tử khác đóng lại. Nếu nhiều phần tử `<details>` trong nhóm được đặt thuộc tính `open`, chỉ phần tử đầu tiên theo thứ tự nguồn sẽ được hiển thị mở.

## Giá trị

Một chuỗi. Chuỗi rỗng nếu phần tử không thuộc nhóm nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{htmlelement("details")}} và {{htmlelement("summary")}}
