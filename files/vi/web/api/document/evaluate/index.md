---
title: "Document: phương thức evaluate()"
short-title: evaluate()
slug: Web/API/Document/evaluate
page-type: web-api-instance-method
browser-compat: api.Document.evaluate
---

{{ ApiRef("DOM") }}

Phương thức **`evaluate()`** của giao diện {{domxref("Document")}} chọn các phần tử dựa trên biểu thức [XPath](/en-US/docs/Web/XML/XPath) được cung cấp trong tham số.

Các biểu thức XPath có thể được đánh giá trên cả tài liệu HTML và XML.

## Cú pháp

```js-nolint
evaluate(xpathExpression, contextNode, namespaceResolver, resultType, result)
```

### Tham số

- `xpathExpression`
  - : Một chuỗi đại diện cho _xpath_ cần được đánh giá.
- `contextNode`
  - : _Nút ngữ cảnh_ cho truy vấn.
    Thông thường truyền `document` làm nút ngữ cảnh.
- `namespaceResolver`
  - : Một hàm sẽ được truyền bất kỳ tiền tố namespace nào và nên trả về một chuỗi đại diện cho URI namespace được liên kết với tiền tố đó.
    Nó sẽ được sử dụng để phân giải các tiền tố trong chính _xpath_, để chúng có thể khớp với tài liệu.
    Giá trị `null` thường dùng cho tài liệu HTML hoặc khi không sử dụng tiền tố namespace.
- `resultType`
  - : Một số nguyên tương ứng với kiểu kết quả `XPathResult` cần trả về.
    Các giá trị sau có thể được sử dụng:
    - `ANY_TYPE` (`0`)
      - : Bất kỳ kiểu nào tự nhiên sinh ra từ biểu thức đã cho.
    - `NUMBER_TYPE` (`1`)
      - : Một tập kết quả chứa một số duy nhất. Hữu ích, ví dụ, trong biểu thức _xpath_ sử dụng hàm `count()`.
    - `STRING_TYPE` (`2`)
      - : Một tập kết quả chứa một chuỗi duy nhất.
    - `BOOLEAN_TYPE` (`3`)
      - : Một tập kết quả chứa một giá trị boolean duy nhất. Hữu ích, ví dụ, trong biểu thức _xpath_ sử dụng hàm `not()`.
    - `UNORDERED_NODE_ITERATOR_TYPE` (`4`)
      - : Một tập kết quả chứa tất cả các nút khớp với biểu thức. Các nút trong tập kết quả không nhất thiết theo thứ tự xuất hiện trong tài liệu.
        > [!NOTE]
        > Kết quả của kiểu này chứa tham chiếu đến các nút trong tài liệu.
        > Sửa đổi một nút sẽ làm iterator không hợp lệ.
        > Sau khi sửa đổi một nút, việc cố gắng lặp qua kết quả sẽ gây ra lỗi.
    - `ORDERED_NODE_ITERATOR_TYPE` (`5`)
      - : Một tập kết quả chứa tất cả các nút khớp với biểu thức. Các nút trong tập kết quả theo thứ tự xuất hiện trong tài liệu.
        > [!NOTE]
        > Kết quả của kiểu này chứa tham chiếu đến các nút trong tài liệu.
        > Sửa đổi một nút sẽ làm iterator không hợp lệ.
        > Sau khi sửa đổi một nút, việc cố gắng lặp qua kết quả sẽ gây ra lỗi.
    - `UNORDERED_NODE_SNAPSHOT_TYPE` (`6`)
      - : Một tập kết quả chứa ảnh chụp nhanh của tất cả các nút khớp với biểu thức. Các nút trong tập kết quả không nhất thiết theo thứ tự xuất hiện trong tài liệu.
        > [!NOTE]
        > Kết quả của kiểu này là ảnh chụp nhanh, về cơ bản là danh sách các nút khớp.
        > Bạn có thể thay đổi tài liệu bằng cách thay đổi các nút snapshot.
        > Sửa đổi tài liệu không làm ảnh chụp nhanh mất hiệu lực;
        > tuy nhiên, nếu tài liệu bị thay đổi, ảnh chụp nhanh có thể không tương ứng với trạng thái hiện tại của tài liệu,
        > vì các nút có thể đã di chuyển, bị thay đổi, thêm hoặc xóa.
    - `ORDERED_NODE_SNAPSHOT_TYPE` (`7`)
      - : Một tập kết quả chứa ảnh chụp nhanh của tất cả các nút khớp với biểu thức. Các nút trong tập kết quả theo thứ tự xuất hiện trong tài liệu.
        > [!NOTE]
        > Kết quả của kiểu này là ảnh chụp nhanh, về cơ bản là danh sách các nút khớp.
        > Bạn có thể thay đổi tài liệu bằng cách thay đổi các nút snapshot.
        > Sửa đổi tài liệu không làm ảnh chụp nhanh mất hiệu lực;
        > tuy nhiên, nếu tài liệu bị thay đổi, ảnh chụp nhanh có thể không tương ứng với trạng thái hiện tại của tài liệu,
        > vì các nút có thể đã di chuyển, bị thay đổi, thêm hoặc xóa.
    - `ANY_UNORDERED_NODE_TYPE` (`8`)
      - : Một tập kết quả chứa bất kỳ nút đơn nào khớp với biểu thức. Nút không nhất thiết là nút đầu tiên trong tài liệu khớp với biểu thức.
    - `FIRST_ORDERED_NODE_TYPE` (`9`)
      - : Một tập kết quả chứa nút đầu tiên trong tài liệu khớp với biểu thức.

- `result`
  - : Một `XPathResult` hiện có để sử dụng cho kết quả. Nếu đặt thành `null`, phương thức sẽ tạo và trả về một `XPathResult` mới.

### Giá trị trả về

Một {{domxref("XPathResult")}} liên kết đến các nút đã chọn. Nếu `result` là `null`, nó là một đối tượng mới, nếu không, nó là cùng đối tượng với đối tượng được truyền làm tham số `result`.

## Ví dụ

### Tìm tất cả tiêu đề H2 bằng XPath

```js
const headings = document.evaluate(
  "/html/body//h2",
  document,
  null,
  XPathResult.ANY_TYPE,
  null,
);
/* Tìm kiếm trong tài liệu tất cả phần tử h2.
 * Kết quả có thể là một unordered node iterator. */
let thisHeading = headings.iterateNext();
let alertText = "Các tiêu đề cấp 2 trong tài liệu này là:\n";
while (thisHeading) {
  alertText += `${thisHeading.textContent}\n`;
  thisHeading = headings.iterateNext();
}
alert(alertText); // Cảnh báo văn bản của tất cả phần tử h2
```

Lưu ý, trong ví dụ trên, một _xpath_ dài dòng hơn được ưu tiên hơn các lối tắt phổ biến như `//h2`. Nhìn chung, các bộ chọn _xpath_ cụ thể hơn, như trong ví dụ trên, thường mang lại cải thiện hiệu suất đáng kể, đặc biệt trên các tài liệu rất lớn. Điều này là do việc đánh giá truy vấn không lãng phí thời gian truy cập các nút không cần thiết. Sử dụng // thường chậm vì nó truy cập _mọi_ nút từ nút gốc và tất cả nút con để tìm các kết quả khả thi.

Tối ưu hóa thêm có thể đạt được bằng cách sử dụng cẩn thận tham số ngữ cảnh. Ví dụ, nếu bạn biết nội dung đang tìm kiếm nằm đâu đó bên trong thẻ body, bạn có thể sử dụng:

```js
document.evaluate(".//h2", document.body, null, XPathResult.ANY_TYPE, null);
```

Lưu ý trong đoạn mã trên `document.body` được sử dụng làm ngữ cảnh thay vì `document` nên _xpath_ bắt đầu từ phần tử body. (Trong ví dụ này, `"."` là quan trọng để chỉ ra rằng việc truy vấn nên bắt đầu từ nút ngữ cảnh, document.body. Nếu "." bị bỏ qua (để `//h2`) truy vấn sẽ bắt đầu từ nút gốc (`html`) sẽ lãng phí hơn.)

Xem [Giới thiệu sử dụng XPath trong JavaScript](/en-US/docs/Web/XML/XPath/Guides/Introduction_to_using_XPath_in_JavaScript) để biết thêm thông tin.

### Lấy phần tử theo xml:id

Hàm này là sự thay thế cho {{domxref("Document.getElementById()")}} khi bạn cần tìm kiếm theo `xml:id` thay thế.

```js
function getElementByIdWrapper(xmlDoc, id) {
  return xmlDoc.evaluate(
    `//*[@xml:id="${id}"]`,
    xmlDoc,
    () => "http://www.w3.org/XML/1998/namespace",
    XPathResult.FIRST_ORDERED_NODE_TYPE,
    null,
  ).singleNodeValue;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.createExpression()")}}
- {{domxref("XPathResult")}}
