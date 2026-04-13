---
title: ProcessingInstruction
slug: Web/API/ProcessingInstruction
page-type: web-api-interface
browser-compat: api.ProcessingInstruction
---

{{APIRef("DOM")}}

Giao diện **`ProcessingInstruction`** biểu diễn một [chỉ thị xử lý](https://www.w3.org/TR/xml/#sec-pi); cụ thể là một {{domxref("Node")}} nhúng một chỉ thị nhắm đến một ứng dụng cụ thể nhưng có thể bị bỏ qua bởi bất kỳ ứng dụng nào khác không nhận diện được chỉ thị đó.

> [!WARNING]
> Các nút `ProcessingInstruction` chỉ được hỗ trợ trong tài liệu XML, không hỗ trợ trong tài liệu HTML. Trong tài liệu HTML, một chỉ thị xử lý sẽ được xem như là một chú thích và được biểu diễn dưới dạng đối tượng {{domxref("Comment")}} trong cây.

Một chỉ thị xử lý có thể khác với [khẩu khai XML](/en-US/docs/Web/XML/Guides/XML_introduction#xml_declaration).

> [!NOTE]
> Các chỉ thị xử lý do người dùng định nghĩa không được bắt đầu bằng `"xml"`, vì các tên đích của chỉ thị xử lý có tiền tố `xml` được dành riêng bởi đặc tả XML cho các mục sử dụng tiêu chuẩn cụ thể (xem ví dụ `<?xml-stylesheet ?>`).

Ví dụ:

```html
<?xml version="1.0"?>
```

là một chỉ thị xử lý có `target` là `xml`.

{{InheritanceDiagram}}

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính từ các giao diện cha của nó: {{domxref("CharacterData")}}, {{domxref("Node")}} và {{domxref("EventTarget")}}._

- {{domxref("ProcessingInstruction.sheet")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("StyleSheet")}} được liên kết, nếu có; hoặc `null` nếu không có.

- {{domxref("ProcessingInstruction.target")}} {{ReadOnlyInline}}
  - : Một tên xác định ứng dụng mà chỉ thị nhắm đến.

## Phương thức instance

_Giao diện này không có phương thức cụ thể nào, nhưng kế thừa các phương thức từ các giao diện cha của nó: {{domxref("CharacterData")}}, {{domxref("Node")}} và {{domxref("EventTarget")}}._

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [document.createProcessingInstruction()](/en-US/docs/Web/API/Document/createProcessingInstruction)
- [DOM API](/en-US/docs/Web/API/Document_Object_Model)
