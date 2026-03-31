---
title: JSON.isRawJSON()
short-title: isRawJSON()
slug: Web/JavaScript/Reference/Global_Objects/JSON/isRawJSON
page-type: javascript-static-method
browser-compat: javascript.builtins.JSON.isRawJSON
sidebar: jsref
---

Phương thức tĩnh **`JSON.isRawJSON()`** kiểm tra xem một giá trị có phải là đối tượng được trả về bởi {{jsxref("JSON.rawJSON()")}} hay không.

## Cú pháp

```js-nolint
JSON.isRawJSON(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra.

### Giá trị trả về

`true` nếu `value` được tạo bởi {{jsxref("JSON.rawJSON()")}}; ngược lại là `false`.

## Mô tả

Các đối tượng "JSON thô", khi được tuần tự hóa sang JSON, được xử lý như thể chúng đã là một đoạn JSON. Hơn nữa, do cách thức hoạt động của {{jsxref("JSON.rawJSON()")}}, JSON thô được đảm bảo là cú pháp JSON hợp lệ. Để biết thêm thông tin về hình dạng và hành vi của các đối tượng JSON thô, xem {{jsxref("JSON.rawJSON()")}}. Phương thức này tồn tại để cho phép các thư viện tuần tự hóa khác triển khai hành vi tương tự như `JSON.stringify()` cho các đối tượng JSON thô.

## Ví dụ

### Sử dụng JSON.isRawJSON()

Ví dụ sau minh họa cách sử dụng `JSON.isRawJSON()` để kiểm tra xem một đối tượng có được trả về bởi `JSON.rawJSON()` hay không. Nó triển khai một bộ tuần tự hóa tùy chỉnh tuần tự hóa dữ liệu sang định dạng giống YAML.

```js
function mySerializer(value, indent = "") {
  if (typeof value !== "object" || value === null) {
    return JSON.stringify(value);
  }
  if (JSON.isRawJSON(value)) {
    return value.rawJSON;
  }
  const subIndent = `${indent}  `;
  if (Array.isArray(value)) {
    return `- ${value.map((v) => mySerializer(v, subIndent)).join(`\n${indent}- `)}`;
  }
  return Object.entries(value)
    .map(([key, value]) => {
      const subValue = mySerializer(value, subIndent);
      if (subValue.includes("\n")) {
        return `${key}:\n${subIndent}${subValue}`;
      }
      return `${key}: ${subValue}`;
    })
    .join(`\n${indent}`);
}

console.log(
  mySerializer({
    name: "Josh",
    userId: JSON.rawJSON("12345678901234567890"),
    friends: [
      { name: "Alice", userId: JSON.rawJSON("9876543210987654321") },
      { name: "Bob", userId: JSON.rawJSON("56789012345678901234") },
    ],
  }),
);

// name: "Josh"
// userId: 12345678901234567890
// friends:
//   - name: "Alice"
//     userId: 9876543210987654321
//   - name: "Bob"
//     userId: 56789012345678901234
```

Nếu trong ví dụ trên, các giá trị `userId` không được tạo bởi `JSON.rawJSON()`, mà được truyền trực tiếp dưới dạng số, thì chúng ta sẽ bị mất độ chính xác ngay lập tức do giới hạn độ chính xác dấu phẩy động của JS.

```js
console.log(
  mySerializer({
    name: "Josh",
    userId: 12345678901234567890,
    friends: [
      { name: "Alice", userId: 9876543210987654321 },
      { name: "Bob", userId: 56789012345678901234 },
    ],
  }),
);

// name: "Josh"
// userId: 12345678901234567000
// friends:
//   - name: "Alice"
//     userId: 9876543210987655000
//   - name: "Bob"
//     userId: 56789012345678900000
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `JSON.isRawJSON` trong `core-js`](https://github.com/zloirock/core-js#jsonparse-source-text-access)
- {{jsxref("JSON")}}
- {{jsxref("JSON.stringify()")}}
- {{jsxref("JSON.rawJSON()")}}
