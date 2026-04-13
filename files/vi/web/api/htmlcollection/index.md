---
title: HTMLCollection
slug: Web/API/HTMLCollection
page-type: web-api-interface
browser-compat: api.HTMLCollection
---

{{APIRef("DOM")}}

**`HTMLCollection`** là một giao diện đại diện cho một tập hợp chung các phần tử (một đối tượng có dạng giống mảng như {{jsxref("Functions/arguments", "arguments")}}) theo thứ tự trong tài liệu, và cung cấp các phương thức cùng thuộc tính để chọn phần tử từ danh sách.

`HTMLCollection` trong HTML DOM là một tập hợp động; nó sẽ tự động được cập nhật khi tài liệu nền thay đổi. Vì vậy, nên tạo một bản sao của nó, chẳng hạn bằng {{jsxref("Array/from", "Array.from")}}, trước khi lặp qua nếu bạn đang thêm, di chuyển hoặc xóa các nút.

Giao diện này được gọi là `HTMLCollection` vì lý do lịch sử, bởi trước DOM hiện đại thì các tập hợp triển khai giao diện này chỉ có thể chứa các phần tử HTML.

Giao diện này là một [nỗ lực tạo ra một danh sách không thể sửa đổi](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156) và chỉ còn được hỗ trợ để không làm hỏng các đoạn mã đã sử dụng nó. Các API hiện đại biểu diễn cấu trúc danh sách bằng những kiểu dựa trên mảng [JavaScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), nhờ đó cung cấp nhiều phương thức của mảng, đồng thời áp đặt thêm ngữ nghĩa khi sử dụng chúng (chẳng hạn như làm cho các phần tử của nó chỉ đọc).

Những lý do lịch sử này không có nghĩa là bạn nên tránh dùng `HTMLCollection`. Bạn không tự tạo các đối tượng `HTMLCollection`, mà nhận chúng từ các API như {{domxref("Document.getElementsByClassName()")}}, và các API này không bị phản đối sử dụng. Tuy nhiên, hãy cẩn thận với sự khác biệt về ngữ nghĩa so với một mảng thực sự.

## Thuộc tính thể hiện

- {{domxref("HTMLCollection.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng phần tử trong tập hợp.

## Phương thức thể hiện

- {{domxref("HTMLCollection.item()")}}
  - : Trả về phần tử cụ thể tại chỉ số `index` tính từ 0 trong danh sách. Trả về `null` nếu `index` nằm ngoài phạm vi.

    Đây là lựa chọn thay thế cho việc truy cập `collection[i]` (cách này sẽ trả về `undefined` khi `i` nằm ngoài phạm vi). Cách này chủ yếu hữu ích cho các triển khai DOM không phải JavaScript.

- {{domxref("HTMLCollection.namedItem()")}}
  - : Trả về nút cụ thể có `id` hoặc, nếu không có, `name` khớp với chuỗi được chỉ định bởi `name`. Việc khớp theo `name` chỉ được dùng như lựa chọn cuối, chỉ trong HTML, và chỉ khi phần tử được tham chiếu có hỗ trợ thuộc tính `name`. Trả về `null` nếu không có nút nào khớp với tên đã cho.

    Đây là lựa chọn thay thế cho việc truy cập `collection[name]` (cách này sẽ trả về `undefined` khi `name` không tồn tại). Cách này chủ yếu hữu ích cho các triển khai DOM không phải JavaScript.

## Sử dụng trong JavaScript

`HTMLCollection` cũng hiển thị các thành viên của nó dưới dạng thuộc tính theo tên và chỉ số. Mã định danh HTML có thể chứa `:` và `.` như các ký tự hợp lệ, điều này sẽ buộc phải dùng cú pháp ngoặc vuông để truy cập thuộc tính. Hiện tại, một đối tượng `HTMLCollection` không nhận diện các `id` chỉ gồm chữ số, điều này sẽ gây xung đột với kiểu truy cập như mảng, dù HTML vẫn cho phép chúng.

Ví dụ, giả sử trong tài liệu chỉ có một phần tử `<form>` và `id` của nó là `myForm`:

```js
let elem1, elem2;

// document.forms is an HTMLCollection

elem1 = document.forms[0];
elem2 = document.forms.item(0);

alert(elem1 === elem2); // shows: "true"

elem1 = document.forms.myForm;
elem2 = document.forms.namedItem("myForm");

alert(elem1 === elem2); // shows: "true"

elem1 = document.forms["named.item.with.periods"];
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("NodeList")}}
- {{domxref("HTMLFormControlsCollection")}}, {{domxref("HTMLOptionsCollection")}}
