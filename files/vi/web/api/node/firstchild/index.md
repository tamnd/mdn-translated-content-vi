---
title: "Node: thuộc tính firstChild"
short-title: firstChild
slug: Web/API/Node/firstChild
page-type: web-api-instance-property
browser-compat: api.Node.firstChild
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`firstChild`** của giao diện {{domxref("Node")}} trả về phần tử con đầu tiên của nút trong cây, hoặc `null` nếu nút không có phần tử con.

Nếu nút là một {{domxref("Document")}}, thuộc tính này trả về nút đầu tiên trong danh sách các phần tử con trực tiếp của nó.

> [!NOTE]
> Thuộc tính này trả về bất kỳ kiểu nút nào là phần tử con đầu tiên của nút này. Nó có thể là một nút {{domxref("Text")}} hoặc {{domxref("Comment")}}. Nếu bạn muốn lấy phần tử {{domxref("Element")}} đầu tiên là con của một phần tử khác, hãy cân nhắc dùng {{domxref("Element.firstElementChild")}}.

## Giá trị

Một {{domxref("Node")}}, hoặc `null` nếu không có phần tử nào.

## Ví dụ

Ví dụ này minh họa cách dùng `firstChild` và cách các nút khoảng trắng có thể ảnh hưởng đến việc dùng thuộc tính này.

```html
<p id="para-01">
  <span>First span</span>
</p>
```

```js
const p01 = document.getElementById("para-01");
console.log(p01.firstChild.nodeName);
```

Trong ví dụ trên, console sẽ hiển thị `'#text'` vì một nút văn bản được chèn để duy trì khoảng trắng giữa thẻ mở `<p>` và thẻ `<span>`. **Bất kỳ** [khoảng trắng](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) nào cũng sẽ tạo một nút `#text`, từ một khoảng trắng đơn lẻ đến nhiều khoảng trắng, xuống dòng, tab, v.v.

Một nút `#text` khác được chèn giữa thẻ đóng `</span>` và `</p>`.

Nếu xóa khoảng trắng này khỏi mã nguồn, các nút `#text` sẽ không được chèn và phần tử span sẽ trở thành phần tử con đầu tiên của đoạn văn.

```html
<p id="para-01"><span>First span</span></p>
```

```js
const p01 = document.getElementById("para-01");
console.log(p01.firstChild.nodeName);
```

Bây giờ console sẽ hiển thị `SPAN`.

Để tránh vấn đề `node.firstChild` trả về các nút `#text` hoặc `#comment`, có thể dùng {{domxref("Element.firstElementChild")}} để chỉ trả về nút phần tử đầu tiên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.firstElementChild")}}
- {{domxref("Node.lastChild")}}
