---
title: NodeList
slug: Web/API/NodeList
page-type: web-api-interface
browser-compat: api.NodeList
---

{{APIRef("DOM")}}

Các đối tượng **`NodeList`** là những tập hợp [nút](/en-US/docs/Web/API/Node), thường được trả về bởi các thuộc tính như {{domxref("Node.childNodes")}} và các phương thức như {{domxref("document.querySelectorAll()")}}.

Giao diện này là một [nỗ lực tạo ra một danh sách không thể sửa đổi](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156) và chỉ còn được hỗ trợ để không làm hỏng các đoạn mã đã sử dụng nó. Các API hiện đại biểu diễn cấu trúc danh sách bằng những kiểu dựa trên mảng [JavaScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), nhờ đó cung cấp nhiều phương thức của mảng, đồng thời áp đặt thêm ngữ nghĩa khi sử dụng chúng, chẳng hạn như làm cho các phần tử của chúng chỉ đọc.

Những lý do lịch sử này không có nghĩa là bạn nên tránh dùng `NodeList`. Bạn không tự tạo các đối tượng `NodeList`, mà nhận chúng từ các API như {{domxref("Document.querySelectorAll()")}}, và các API này không bị phản đối sử dụng. Tuy nhiên, hãy cẩn thận với sự khác biệt về ngữ nghĩa so với một mảng thực sự.

Mặc dù `NodeList` không phải là `Array`, bạn vẫn có thể lặp qua nó bằng `forEach()`. Bạn cũng có thể chuyển nó thành một `Array` thật bằng {{jsxref("Array.from()")}}.

## NodeList động và tĩnh

Mặc dù cả hai đều được xem là đối tượng `NodeList`, có hai loại NodeList: _động_ và _tĩnh_.

Trong phần lớn trường hợp, `NodeList` là _động_, nghĩa là các thay đổi trong DOM sẽ tự động cập nhật tập hợp.

Ví dụ, {{domxref("Node.childNodes")}} là một `NodeList` động:

```js
const parent = document.getElementById("parent");
let childNodes = parent.childNodes;
console.log(childNodes.length); // giả sử là "2"
parent.appendChild(document.createElement("div"));
console.log(childNodes.length); // in ra "3"
```

Trong các trường hợp khác, `NodeList` là _tĩnh_, tức là bất kỳ thay đổi nào trong DOM cũng không ảnh hưởng đến nội dung của tập hợp. Phương thức quen thuộc {{domxref("document.querySelectorAll()")}} là API duy nhất trả về một `NodeList` _tĩnh_.

Bạn nên ghi nhớ sự khác biệt này khi chọn cách lặp qua các phần tử trong `NodeList`, cũng như khi cân nhắc có nên lưu tạm giá trị `length` của danh sách hay không.

## Thuộc tính thể hiện

- {{domxref("NodeList.length")}} {{ReadOnlyInline}}
  - : Số lượng nút trong `NodeList`.

## Phương thức thể hiện

- {{domxref("NodeList.item()")}}
  - : Trả về một mục trong danh sách theo chỉ số của nó, hoặc `null` nếu chỉ số nằm ngoài phạm vi.

    Đây là lựa chọn thay thế cho việc truy cập `nodeList[i]` (cách này sẽ trả về `undefined` khi `i` nằm ngoài phạm vi). Cách này chủ yếu hữu ích cho các triển khai DOM không phải JavaScript.

- {{domxref("NodeList.entries()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}}, cho phép mã nguồn duyệt qua tất cả các cặp khóa/giá trị có trong tập hợp. Trong trường hợp này, khóa là các số nguyên bắt đầu từ `0` và giá trị là các nút.
- {{domxref("NodeList.forEach()")}}
  - : Thực thi một hàm được cung cấp một lần cho mỗi phần tử của `NodeList`, truyền phần tử đó làm đối số cho hàm.
- {{domxref("NodeList.keys()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}}, cho phép mã nguồn duyệt qua tất cả các khóa của các cặp khóa/giá trị có trong tập hợp. Trong trường hợp này, khóa là các số nguyên bắt đầu từ `0`.
- {{domxref("NodeList.values()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép mã nguồn duyệt qua tất cả các giá trị, tức các nút, của các cặp khóa/giá trị.

## Ví dụ

Bạn có thể lặp qua các mục trong `NodeList` bằng vòng lặp [for](/en-US/docs/Web/JavaScript/Reference/Statements/for):

```js
for (let i = 0; i < myNodeList.length; i++) {
  let item = myNodeList[i];
}
```

**Không dùng [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) để liệt kê các mục trong `NodeList`**, vì nó cũng sẽ liệt kê cả các thuộc tính `length` và `item`, và có thể gây lỗi nếu mã của bạn giả định rằng nó chỉ phải xử lý các đối tượng {{domxref("Element")}}. Ngoài ra, `for...in` không đảm bảo sẽ duyệt các thuộc tính theo bất kỳ thứ tự cụ thể nào.

Các vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) duyệt qua các đối tượng `NodeList` một cách chính xác:

```js
const list = document.querySelectorAll("input[type=checkbox]");
for (const checkbox of list) {
  checkbox.checked = true;
}
```

Các trình duyệt cũng hỗ trợ phương thức lặp {{domxref("NodeList.forEach()", "forEach()")}}, cũng như {{domxref("NodeList.entries()", "entries()")}}, {{domxref("NodeList.values()", "values()")}} và {{domxref("NodeList.keys()", "keys()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
