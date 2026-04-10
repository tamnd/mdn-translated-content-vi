---
title: "Node: thuộc tính lastChild"
short-title: lastChild
slug: Web/API/Node/lastChild
page-type: web-api-instance-property
browser-compat: api.Node.lastChild
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`lastChild`** của giao diện {{domxref("Node")}} trả về phần tử con cuối cùng của nút trong cây, hoặc `null` nếu nút không có phần tử con.

Nếu nút là một {{domxref("Document")}}, thuộc tính này trả về nút cuối cùng trong danh sách các phần tử con trực tiếp của nó.

> [!NOTE]
> Thuộc tính này trả về bất kỳ kiểu nút nào là phần tử con cuối cùng của nút này. Nó có thể là một nút {{domxref("Text")}} hoặc {{domxref("Comment")}}. Nếu bạn muốn lấy phần tử {{domxref("Element")}} cuối cùng là con của một phần tử khác, hãy cân nhắc dùng {{domxref("Element.lastElementChild")}}.

## Giá trị

Một {{domxref("Node")}}, hoặc `null` nếu không có phần tử nào.

## Xem thêm

- {{domxref("Element.lastElementChild")}}
- {{domxref("Node.firstChild")}}
