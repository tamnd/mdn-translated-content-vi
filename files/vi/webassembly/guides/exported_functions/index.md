---
title: Các hàm xuất khẩu WebAssembly
slug: WebAssembly/Guides/Exported_functions
page-type: guide
sidebar: webassemblysidebar
---

Các hàm xuất khẩu WebAssembly là cách các hàm WebAssembly được biểu diễn trong JavaScript. Bài viết này mô tả chi tiết hơn về chúng là gì.

## Xuất khẩu... Cái gì?

Các hàm xuất khẩu WebAssembly về cơ bản là các wrapper JavaScript đại diện cho các hàm WebAssembly trong JavaScript. Khi bạn gọi chúng, một số hoạt động xảy ra ở nền để chuyển đổi các đối số thành các kiểu mà Wasm có thể làm việc (ví dụ: chuyển đổi số JavaScript thành Int32), các đối số được truyền cho hàm bên trong mô-đun Wasm của bạn, hàm được gọi và kết quả được chuyển đổi và truyền lại cho JavaScript.

Bạn có thể lấy các hàm xuất khẩu WebAssembly theo hai cách:

- Bằng cách gọi [`Table.prototype.get()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/get) trên một bảng hiện có.
- Bằng cách truy cập một hàm được xuất khẩu từ phiên bản mô-đun Wasm thông qua [`Instance.exports`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Instance/exports).

Dù cách nào, bạn cũng nhận được cùng loại wrapper cho hàm cơ bản. Từ góc độ JavaScript, cứ như thể mọi hàm Wasm _là_ một hàm JavaScript nữa — nhưng chúng được bao bọc bởi đối tượng phiên bản hàm Wasm được xuất khẩu và chỉ có một số cách hạn chế để truy cập chúng.

## Một ví dụ

Hãy xem một ví dụ để làm rõ mọi thứ (bạn có thể tìm thấy ví dụ này trên GitHub dưới dạng [table-set.html](https://github.com/mdn/webassembly-examples/blob/main/other-examples/table-set.html); xem nó [chạy trực tiếp](https://mdn.github.io/webassembly-examples/other-examples/table-set.html), và kiểm tra [biểu diễn văn bản](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/table.wat) của Wasm):

```js
const otherTable = new WebAssembly.Table({ element: "anyfunc", initial: 2 });

WebAssembly.instantiateStreaming(fetch("table.wasm")).then((obj) => {
  const tbl = obj.instance.exports.tbl;
  console.log(tbl.get(0)()); // 13
  console.log(tbl.get(1)()); // 42
  otherTable.set(0, tbl.get(0));
  otherTable.set(1, tbl.get(1));
  console.log(otherTable.get(0)());
  console.log(otherTable.get(1)());
});
```

Ở đây chúng ta tạo một bảng (`otherTable`) từ JavaScript bằng cách sử dụng constructor [`WebAssembly.Table`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table), sau đó chúng ta tải `table.wasm` vào trang của mình bằng cách sử dụng phương thức [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static).

Sau đó chúng ta lấy hàm được xuất khẩu từ mô-đun, lấy các hàm mà nó tham chiếu thông qua [`tbl.get()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/get) và ghi lại kết quả của việc gọi mỗi hàm vào bảng điều khiển. Tiếp theo, chúng ta sử dụng `set()` để làm cho bảng `otherTable` chứa các tham chiếu đến cùng các hàm như bảng `tbl`.

Để chứng minh điều này, chúng ta sau đó lấy lại các tham chiếu này từ `otherTable` và in kết quả của chúng vào bảng điều khiển, cho kết quả tương tự.

## Chúng là các hàm thực sự

Trong ví dụ trước, giá trị trả về của mỗi lần gọi [`Table.prototype.get()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/get) là một hàm WebAssembly được xuất khẩu — chính xác những gì chúng ta đã nói.

Điều đáng chú ý là các hàm này là các hàm JavaScript thực sự, ngoài việc là các wrapper cho các hàm WebAssembly. Nếu bạn tải ví dụ trên trong một [trình duyệt hỗ trợ WebAssembly](/en-US/docs/WebAssembly#browser_compatibility), và chạy các dòng sau trong bảng điều khiển của bạn:

```js
const testFunc = otherTable.get(0);
typeof testFunc;
```

bạn sẽ nhận được kết quả `function` được trả về. Sau đó bạn có thể tiếp tục làm hầu hết mọi thứ với hàm này mà bạn có thể làm với các [hàm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) khác trong JavaScript — [`call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call), [`bind()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind), v.v. `testFunc.toString()` trả về một kết quả thú vị:

```plain
function 0() {
    [native code]
}
```

Điều này cho bạn hiểu rõ hơn về bản chất wrapper của nó.

Một số điểm đặc biệt khác cần lưu ý với các hàm WebAssembly được xuất khẩu:

- Thuộc tính [length](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) của chúng là số lượng đối số được khai báo trong chữ ký hàm Wasm.
- Thuộc tính [name](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/name) của chúng là kết quả `toString()` của chỉ số của hàm trong mô-đun Wasm.
- Nếu bạn cố gắng gọi một hàm Wasm được xuất khẩu nhận hoặc trả về một giá trị kiểu i64, hiện tại nó ném ra lỗi vì JavaScript hiện không có cách chính xác để biểu diễn i64. Giải pháp là sử dụng các giá trị BigInt, đại diện cho các số nguyên có kích thước tùy ý, vì vậy chúng có thể biểu diễn các số nguyên 64 bit đúng cách.
