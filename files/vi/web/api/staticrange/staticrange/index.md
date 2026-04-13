---
title: "StaticRange: hàm khởi tạo StaticRange()"
short-title: StaticRange()
slug: Web/API/StaticRange/StaticRange
page-type: web-api-constructor
browser-compat: api.StaticRange.StaticRange
---

{{APIRef("DOM")}}

Hàm khởi tạo **`StaticRange()`** tạo một đối tượng {{domxref("StaticRange")}} mới đại diện cho một khoảng nội dung trong DOM.

Hàm khởi tạo này bao gồm các thuộc tính xác định vị trí bắt đầu và kết thúc của phạm vi cũng như một giá trị boolean cho biết phạm vi có bị **thu gọn** (tức là rỗng) hay không.

## Cú pháp

```js-nolint
new StaticRange(rangeSpec)
```

### Tham số

- `rangeSpec`
  - : Tham số bắt buộc `rangeSpec` là một đối tượng chứa bốn thuộc tính sau:
    - `startContainer`
      - : {{domxref("Node")}} chứa điểm bắt đầu của phạm vi.
    - `startOffset`
      - : Độ lệch vào nút bắt đầu tại đó ký tự đầu tiên của phạm vi được tìm thấy.
    - `endContainer`
      - : `Node` chứa điểm kết thúc của phạm vi.
    - `endOffset`
      - : Độ lệch vào nút được chỉ định bởi `endOffset` tại đó ký tự cuối cùng trong phạm vi nằm.

### Giá trị trả về

Một đối tượng `StaticRange` mới được khởi tạo với các giá trị đã cho trong đối tượng `rangeSpec`.

### Ngoại lệ

- `InvalidNodeTypeError`
  - : Một {{domxref("DOMException")}} được ném ra nếu một hoặc cả hai `startContainer` và/hoặc `endContainer` là loại nút không thể đưa vào phạm vi. Các loại nút đó là `Node.DOCUMENT_TYPE_NODE` (đại diện cho nút {{domxref("DocumentType")}} được dẫn xuất từ {{Glossary("Doctype", "DTD")}} được xác định bằng phần mở đầu `doctype` trong HTML, chẳng hạn) và nút {{domxref("Attr")}} mô tả một thuộc tính của một phần tử trên DOM.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
