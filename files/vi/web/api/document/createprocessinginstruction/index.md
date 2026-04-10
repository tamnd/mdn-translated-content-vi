---
title: "Document: phương thức createProcessingInstruction()"
short-title: createProcessingInstruction()
slug: Web/API/Document/createProcessingInstruction
page-type: web-api-instance-method
browser-compat: api.Document.createProcessingInstruction
---

{{APIRef("DOM")}}

`createProcessingInstruction()` tạo một nút [processing instruction](/en-US/docs/Web/API/ProcessingInstruction) mới và trả về nó.

Nút mới thường sẽ được chèn vào một tài liệu XML để đạt được bất kỳ điều gì với nó, chẳng hạn như với {{ domxref("node.insertBefore") }}.

## Cú pháp

```js-nolint
createProcessingInstruction(target, data)
```

### Tham số

- `piNode`
  - : Nút {{ domxref("ProcessingInstruction") }} kết quả.
- `target`
  - : Một chuỗi chứa phần đầu tiên của processing instruction (ví dụ: `<?target … ?>`)
- `data`
  - : Một chuỗi chứa bất kỳ thông tin nào mà processing instruction cần mang, sau target. Dữ liệu tùy thuộc vào bạn, nhưng nó không được chứa `?>`, vì điều đó sẽ đóng processing instruction.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu một trong các điều kiện sau đúng:
    - Giá trị [`target`](#target) không phải là một [tên XML](https://www.w3.org/TR/xml/#dt-name) hợp lệ; ví dụ: nó bắt đầu bằng số, dấu gạch ngang hoặc dấu chấm, hoặc chứa các ký tự khác ngoài ký tự chữ-số, dấu gạch dưới, dấu gạch ngang hoặc dấu chấm.
    - _Chuỗi đóng processing instruction_ (`?>`) là một phần của giá trị [`data`](#data).

## Ví dụ

```js
const doc = new DOMParser().parseFromString("<foo />", "application/xml");
const pi = doc.createProcessingInstruction(
  "xml-stylesheet",
  'href="mycss.css"',
);

doc.insertBefore(pi, doc.firstChild);

console.log(new XMLSerializer().serializeToString(doc));
// Displays: <?xml-stylesheet href="mycss.css" type="text/css"?><foo/>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
