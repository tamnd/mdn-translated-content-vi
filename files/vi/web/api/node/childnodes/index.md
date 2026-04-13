---
title: "Node: thuộc tính childNodes"
short-title: childNodes
slug: Web/API/Node/childNodes
page-type: web-api-instance-property
browser-compat: api.Node.childNodes
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`childNodes`** của giao diện {{domxref("Node")}} trả về một {{domxref("NodeList")}} động của các {{domxref("Node","nút")}} con của phần tử đã cho, trong đó nút con đầu tiên được gán chỉ số `0`. Các nút con bao gồm phần tử, văn bản và chú thích.

> [!NOTE]
> Việc {{domxref("NodeList")}} là động nghĩa là nội dung của nó sẽ thay đổi mỗi khi có phần tử con mới được thêm hoặc bị xóa.
>
> Trình duyệt chèn các nút văn bản vào tài liệu để biểu diễn khoảng trắng trong mã nguồn. Vì vậy, một nút lấy được, chẳng hạn bằng `Node.childNodes[0]`, có thể là một nút văn bản khoảng trắng thay vì phần tử thực sự mà tác giả muốn lấy.
>
> Xem [Làm việc với khoảng trắng trong DOM](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) để biết thêm chi tiết.

Các mục trong tập hợp nút là các đối tượng, không phải chuỗi. Để lấy dữ liệu từ các đối tượng nút, hãy dùng các thuộc tính của chúng. Ví dụ, để lấy tên của nút con đầu tiên, bạn có thể dùng `elementNodeReference.childNodes[0].nodeName`.

Đối tượng {{domxref("document")}} tự nó có hai phần tử con: khai báo Doctype và phần tử gốc, thường được gọi là `documentElement`. Trong tài liệu HTML, phần tử sau là phần tử {{HTMLElement("html")}}.

Cần nhớ rằng `childNodes` bao gồm _tất cả_ các nút con, kể cả các nút không phải phần tử như nút văn bản và chú thích. Để lấy một tập hợp chỉ chứa phần tử, hãy dùng {{domxref("Element.children")}} thay thế.

## Giá trị

Một {{domxref("NodeList")}} động chứa các phần tử con của nút.

> [!NOTE]
> Nhiều lần gọi `childNodes` sẽ trả về _cùng một_ {{domxref("NodeList")}}.

## Ví dụ

### Cách dùng đơn giản

```js
// Lưu ý rằng para là một tham chiếu đối tượng đến phần tử <p>

// Trước tiên kiểm tra xem phần tử có nút con hay không
if (para.hasChildNodes()) {
  let children = para.childNodes;

  for (const node of children) {
    // Xử lý từng nút con như children[i]
    // LƯU Ý: Danh sách là động! Thêm hoặc xóa nút con sẽ làm thay đổi thuộc tính `length` của danh sách
  }
}
```

### Xóa tất cả phần tử con khỏi một nút

```js
// Đây là một cách để xóa tất cả phần tử con khỏi một nút
// box là một tham chiếu đối tượng đến một phần tử
while (box.firstChild) {
  // Danh sách là ĐỘNG nên nó sẽ đánh lại chỉ số ở mỗi lần gọi
  box.removeChild(box.firstChild);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.firstChild")}}
- {{domxref("Node.lastChild")}}
- {{domxref("Node.nextSibling")}}
- {{domxref("Node.previousSibling")}}
- {{domxref("Element.children")}}
