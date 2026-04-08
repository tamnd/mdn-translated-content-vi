---
title: "Error: cause"
short-title: cause
slug: Web/JavaScript/Reference/Global_Objects/Error/cause
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Error.cause
sidebar: jsref
---

Data property **`cause`** của một instance {{jsxref("Error")}} chỉ ra nguyên nhân gốc rễ cụ thể của lỗi.

Nó được sử dụng khi bắt và ném lại một lỗi với thông báo lỗi cụ thể hoặc hữu ích hơn nhưng vẫn có thể truy cập lỗi gốc.

## Giá trị

Giá trị được truyền vào constructor [`Error()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Error) trong tham số `options.cause`. Nó có thể không tồn tại.

{{js_property_attributes(1, 0, 1)}}

## Mô tả

Giá trị của `cause` có thể là bất kỳ kiểu nào. Bạn không nên giả định rằng lỗi bạn bắt được có một `Error` là `cause` của nó, tương tự như bạn không thể chắc chắn biến được liên kết trong câu lệnh `catch` là một `Error`. Ví dụ "Cung cấp dữ liệu có cấu trúc như nguyên nhân lỗi" bên dưới cho thấy trường hợp một giá trị không phải lỗi được cố ý cung cấp như nguyên nhân.

Các lớp con {{jsxref("SuppressedError")}} và {{jsxref("AggregateError")}} đều phục vụ mục đích liên kết nhiều lỗi. Cả hai đều đại diện cho nhiều điểm thất bại: `SuppressedError` đại diện cho một lỗi xảy ra khi xử lý một lỗi khác, trong khi `AggregateError` đại diện cho một tập hợp nhiều lỗi không liên quan xảy ra trong cùng một hoạt động. Thuộc tính `cause` đại diện cho một điểm thất bại duy nhất, với lỗi bao bọc chỉ thêm ngữ cảnh cho nguyên nhân và không đại diện cho một thất bại bổ sung.

Sau đây là cách sử dụng điển hình của `cause`. Có một điểm thất bại duy nhất, bắt nguồn từ bên trong `mainLogic()`. Câu lệnh `throw new Error()` chỉ bao bọc lỗi gốc đó để thêm ngữ cảnh và không tạo thành một thất bại bổ sung.

```js
try {
  mainLogic();
} catch (err) {
  throw new Error("Main logic failed", { cause: err });
}
```

Sau đây là cách sử dụng điển hình của `SuppressedError`. Có hai điểm thất bại: một bên trong `mainLogic()` và một bên trong `cleanup()`. Instance `SuppressedError` liên kết hai lỗi này.

```js
try {
  mainLogic();
} catch (primaryError) {
  try {
    cleanup();
  } catch (cleanupError) {
    throw new SuppressedError(
      cleanupError,
      primaryError,
      "Main logic failed; while handling that, cleanup also failed",
    );
  }
}
```

Sau đây là cách sử dụng điển hình của `AggregateError`. Có nhiều điểm thất bại bên trong `mainLogic()`. Instance `AggregateError` liên kết tất cả các lỗi.

```js
function mainLogic() {
  const errors = [];
  try {
    operation1();
  } catch (e1) {
    errors.push(e1);
  }
  try {
    operation2();
  } catch (e2) {
    errors.push(e2);
  }
  if (errors.length > 0) {
    throw new AggregateError(errors, "Multiple operations failed");
  }
}
```

## Ví dụ

### Ném lại lỗi với nguyên nhân

Đôi khi hữu ích khi bắt một lỗi và ném lại nó với một thông báo mới.
Trong trường hợp này, bạn nên truyền lỗi gốc vào constructor cho `Error` mới, như được hiển thị.

```js
try {
  connectToDatabase();
} catch (err) {
  throw new Error("Connecting to database failed.", { cause: err });
}
```

Để xem ví dụ chi tiết hơn, xem [Error > Phân biệt giữa các lỗi tương tự](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error#differentiate_between_similar_errors).

### Cung cấp dữ liệu có cấu trúc như nguyên nhân lỗi

Các thông báo lỗi được viết cho người dùng có thể không phù hợp để máy phân tích cú pháp — vì chúng có thể bị diễn đạt lại hoặc thay đổi dấu chấm câu có thể phá vỡ bất kỳ phân tích cú pháp hiện có nào được viết để sử dụng chúng. Vì vậy, khi ném một lỗi từ một hàm, thay vì thông báo lỗi có thể đọc được bởi con người, bạn có thể cung cấp nguyên nhân như dữ liệu có cấu trúc, để máy phân tích cú pháp.

```js
function makeRSA(p, q) {
  if (!Number.isInteger(p) || !Number.isInteger(q)) {
    throw new Error("RSA key generation requires integer inputs.", {
      cause: { code: "NonInteger", values: [p, q] },
    });
  }
  if (!areCoprime(p, q)) {
    throw new Error("RSA key generation requires two co-prime integers.", {
      cause: { code: "NonCoprime", values: [p, q] },
    });
  }
  // rsa algorithm…
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.message")}}
- {{jsxref("Error.prototype.toString()")}}
