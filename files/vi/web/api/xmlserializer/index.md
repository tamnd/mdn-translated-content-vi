---
title: XMLSerializer
slug: Web/API/XMLSerializer
page-type: web-api-interface
browser-compat: api.XMLSerializer
---

{{APIRef("HTML DOM")}}

Giao diện `XMLSerializer` cung cấp phương thức {{domxref("XMLSerializer.serializeToString", "serializeToString()")}} để xây dựng một chuỗi XML biểu diễn cây {{Glossary("DOM")}}.

> [!NOTE]
> Chuỗi XML kết quả không đảm bảo là XML đúng định dạng (well-formed).

## Constructor

- {{domxref("XMLSerializer.XMLSerializer", "XMLSerializer()")}}
  - : Tạo một đối tượng `XMLSerializer` mới.

## Phương thức thể hiện

- {{domxref("XMLSerializer.serializeToString", "serializeToString()")}}
  - : Trả về chuỗi đã tuần tự hóa của cây con.

## Ví dụ

### Tuần tự hóa XML thành chuỗi

Ví dụ này đơn giản tuần tự hóa toàn bộ tài liệu thành một chuỗi chứa XML.

```js
const s = new XMLSerializer();
const str = s.serializeToString(document);
saveXML(str);
```

Quá trình này bao gồm việc tạo một đối tượng `XMLSerializer` mới, sau đó truyền {{domxref("Document")}} cần tuần tự hóa vào {{domxref("XMLSerializer.serializeToString", "serializeToString()")}}, phương thức này trả về chuỗi tương đương XML của tài liệu. `saveXML()` đại diện cho một hàm sẽ lưu chuỗi đã tuần tự hóa.

### Chèn các nút vào DOM dựa trên XML

Ví dụ này sử dụng phương thức {{domxref("Element.insertAdjacentHTML()")}} để chèn một {{domxref("Node")}} DOM mới vào phần thân của {{domxref("Document")}}, dựa trên XML được tạo bằng cách tuần tự hóa một đối tượng {{domxref("Element")}}.

> [!NOTE]
> Trong thực tế, bạn thường nên gọi phương thức {{domxref("Document.importNode", "importNode()")}} để nhập nút mới vào DOM, sau đó gọi một trong các phương thức sau để thêm nút vào cây DOM:
>
> - Các phương thức {{domxref("Element.append()")}}/{{domxref("Element.prepend()")}} và {{domxref("Document.append()")}}/{{domxref("Document.prepend()")}}.
> - Phương thức {{domxref("Element.replaceWith")}} (để thay thế một nút hiện có bằng nút mới).
> - Phương thức {{domxref("Element.insertAdjacentElement()")}}.

Vì `insertAdjacentHTML()` chấp nhận một chuỗi chứ không phải một `Node` làm tham số thứ hai, `XMLSerializer` được dùng để trước tiên chuyển đổi nút thành chuỗi.

```js
const inp = document.createElement("input");
const XMLS = new XMLSerializer();
const inpSerialized = XMLS.serializeToString(inp); // Trước tiên chuyển đổi nút DOM thành chuỗi

// Chèn nút mới tạo vào phần body của tài liệu
document.body.insertAdjacentHTML("afterbegin", inpSerialized);
```

Đoạn mã trên tạo một phần tử {{HTMLElement("input")}} mới bằng cách gọi {{domxref("Document.createElement()")}}, sau đó tuần tự hóa nó thành XML bằng {{domxref("XMLSerializer.serializeToString", "serializeToString()")}}.

Sau khi hoàn tất, `insertAdjacentHTML()` được dùng để chèn phần tử `<input>` vào DOM.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Phân tích cú pháp và tuần tự hóa XML](/en-US/docs/Web/XML/Guides/Parsing_and_serializing_XML)
- {{domxref("DOMParser")}}
