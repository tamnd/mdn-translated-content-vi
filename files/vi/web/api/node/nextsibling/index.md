---
title: "Node: thuộc tính nextSibling"
short-title: nextSibling
slug: Web/API/Node/nextSibling
page-type: web-api-instance-property
browser-compat: api.Node.nextSibling
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`nextSibling`** của giao diện {{domxref("Node")}} trả về nút ngay sau nút đã chỉ định trong danh sách {{domxref("Node.childNodes", "childNodes")}} của nút cha, hoặc `null` nếu nút đã chỉ định là nút cuối cùng trong danh sách đó.

> [!NOTE]
> Trình duyệt chèn các nút văn bản vào tài liệu để biểu diễn khoảng trắng trong mã nguồn. Vì vậy, một nút lấy được, chẳng hạn bằng [`Node.firstChild`](/en-US/docs/Web/API/Node/firstChild) hoặc `Node.nextSibling`, có thể là một nút văn bản khoảng trắng thay vì phần tử thực sự mà tác giả muốn lấy.
>
> Xem [Làm việc với khoảng trắng trong DOM](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) để biết thêm chi tiết.
>
> Bạn có thể dùng [`nextElementSibling`](/en-US/docs/Web/API/Element/nextElementSibling) để lấy nút phần tử kế tiếp, bỏ qua các nút văn bản và mọi nút không phải phần tử khác.
>
> Để đi theo chiều ngược lại qua danh sách nút con, hãy dùng [Node.previousSibling](/en-US/docs/Web/API/Node/previousSibling).

## Giá trị

Một {{domxref("Node")}} đại diện cho nút anh em kế tiếp của nút hiện tại, hoặc `null` nếu không có nút nào.

## Xem thêm

- {{domxref("Node.previousSibling")}}
- {{domxref("Element.nextElementSibling")}}
