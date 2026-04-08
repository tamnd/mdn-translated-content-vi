---
title: "TypeError: BigInt value can't be serialized in JSON"
slug: Web/JavaScript/Reference/Errors/BigInt_not_serializable
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "BigInt value can't be serialized in JSON" xảy ra khi một {{jsxref("BigInt")}} được gặp trong {{jsxref("JSON.stringify")}} mà không có phương thức tuần tự hóa tùy chỉnh nào được cung cấp.

## Thông báo

```plain
TypeError: Do not know how to serialize a BigInt (V8-based)
TypeError: BigInt value can't be serialized in JSON (Firefox)
TypeError: JSON.stringify cannot serialize BigInt. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Bạn đang cố gắng tuần tự hóa một giá trị BigInt bằng `JSON.stringify`, vốn không hỗ trợ các giá trị BigInt theo mặc định. Đôi khi, JSON stringification xảy ra ngầm định trong các thư viện, như một phần của quá trình tuần tự hóa dữ liệu. Ví dụ, gửi dữ liệu đến máy chủ, lưu trữ trong bộ nhớ ngoài, hoặc chuyển giữa các luồng đều yêu cầu tuần tự hóa, thường được thực hiện bằng JSON.

Có một số cách để xử lý điều này:

- Nếu bạn có thể thay đổi nguồn dữ liệu, hãy tránh sử dụng các giá trị BigInt và chuyển đổi nó thành số trước (điều này có thể làm mất độ chính xác với các số lớn).
- Nếu bạn có thể thay đổi quá trình stringification, hãy truyền một hàm replacer vào `JSON.stringify` để chuyển đổi các giá trị BigInt thành chuỗi hoặc số.
- Bạn cũng có thể cung cấp một phương thức `BigInt.prototype.toJSON` toàn cục được gọi mỗi khi một giá trị BigInt được stringify.

Để biết thêm thông tin về các đánh đổi khác nhau, hãy xem [tài liệu tham khảo BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt#use_within_json).

## Ví dụ

### Cung cấp phương thức tuần tự hóa tùy chỉnh

Theo mặc định, các giá trị BigInt không thể tuần tự hóa trong JSON:

```js example-bad
const data = { a: 1n };
JSON.stringify(data);
// TypeError: BigInt value can't be serialized in JSON
```

Giả sử bạn muốn JSON chứa một giá trị số, đây là một vài cách tiếp cận hoạt động:

- Chuyển đổi BigInt thành số trước khi stringify:

  ```js
  const data = { a: 1n };
  JSON.stringify({ ...data, a: Number(data.a) });
  // '{"a":1}'
  ```

- Cung cấp một hàm replacer chuyển đổi các giá trị BigInt thành số hoặc [raw JSON objects](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/rawJSON):

  ```js
  const data = { a: 1n };
  JSON.stringify(data, (key, value) =>
    typeof value === "bigint" ? Number(value) : value,
  );
  // '{"a":1}'
  ```

  ```js
  const data = { a: 1n };
  JSON.stringify(data, (key, value) =>
    typeof value === "bigint" ? JSON.rawJSON(value.toString()) : value,
  );
  // '{"a":1}'
  ```

- Cung cấp phương thức `BigInt.prototype.toJSON` được gọi mỗi khi một giá trị BigInt được stringify:

  ```js
  BigInt.prototype.toJSON = function () {
    return Number(this);
  };
  const data = { a: 1n };
  JSON.stringify(data);
  // '{"a":1}'
  ```

  ```js
  BigInt.prototype.toJSON = function () {
    return JSON.rawJSON(this.toString());
  };
  const data = { a: 1n };
  JSON.stringify(data);
  // '{"a":1}'
  ```

## Xem thêm

- {{jsxref("BigInt")}}
- {{jsxref("JSON.stringify()")}}
- {{jsxref("JSON.rawJSON()")}}
